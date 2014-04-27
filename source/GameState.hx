package;

import flixel.util.FlxPoint;
import flixel.FlxG;
import flixel.group.FlxTypedGroup;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.plugin.FlxPlugin;
import flixel.FlxCamera;
import flixel.addons.ui.FlxUIState;
import flixel.addons.ui.FlxUIInputText;
import flixel.util.FlxColor;

class GameState extends FlxUIState
{
	var m_localPlayer:Player;
	var m_evilTower:EvilTower;
	
	var m_players = new Map <Int, Player > ();
	public var m_playersGroup:FlxTypedGroup<Player> = new FlxTypedGroup<Player>(500);
	var m_level:Level;
	
	var m_inputText:FlxUIInputText;
	
	
	var m_winlines:Array<String> = ["please", "portal", "ludum dare", "ludumdare", "mustache", "moustache", "cali", "nator", "charlotte", "mrwhite", "gnon", "gand", "boloss", "ivory", "amboy", "biwinning", "biwining", "esisar", "kikoolol", "deep purple", "youyou"];
	var m_looselines:Array<String> = ["ubisoft", "coke", "sex", "anal", "rape", "good taste", "google", "apple", "swag", "hipster", "hello", "hi", "fag", "faggot", "rockpapershotgun", "nofrag", "lol", "hell", "surface", "ricklesauceur", "@ricklesauceur" ];
	
	override public function create():Void
	{
		super.create();
		_xml_id = "game_state";
		
		add(new FlxText(0, 0, 100, "Game state"));
		
		// setup map
		m_level = new Level("assets/data/level.tmx");
		add(m_level.m_backgroundTiles);
		m_level.loadObjects(this);
		
		// setup network
		var websocket:WebSocketPlugin = cast(FlxG.plugins.get(WebSocketPlugin), WebSocketPlugin);
		websocket.m_callback_disconnection = onDisconnect;
		
		websocket.registerMessageCallback(Reg.message_steering, onMessageSteering);
		websocket.registerMessageCallback(Reg.message_death, onMessageDeath);
		websocket.registerMessageCallback(Reg.message_teleport, onMessageTeleport);
		websocket.registerMessageCallback(Reg.message_chat, onMessageChat);

		// setup player
		var basePosition:FlxPoint = m_level.spawn();
		m_localPlayer = new Player(basePosition, this, Reg.playerID);
		add(m_localPlayer);
		
		// setup tower
		var towerPosition:FlxPoint = m_level.spawnTower();
		
		// depending of the target, who should be the master
		/*#if (cpp || neko)
		m_evilTower = new EvilTower(towerPosition, this, true);	
		#else
		m_evilTower = new EvilTower(towerPosition, this, false);	
		#end*/
		m_evilTower = new EvilTower(towerPosition, this, true);	
		
		add(m_evilTower);
		
		// camera
		FlxG.camera.follow(m_localPlayer, FlxCamera.STYLE_TOPDOWN_TIGHT);
		FlxG.camera.setBounds(0, 0, 1280, 280);
		
		// input field
		m_inputText = new FlxUIInputText();
		m_inputText.backgroundColor = FlxColor.BLACK;
		m_inputText.color = FlxColor.WHITE;
		m_inputText.borderColor = FlxColor.SILVER;
		m_inputText.y = 265;
		m_inputText.text = "<ENTER> TO CHAT";
		m_inputText.autoSize = true;
		m_inputText.maxLength = Reg.chat_max_len;
		add(m_inputText);
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
		
		m_evilTower.kill();
		m_evilTower = null;
		
		m_localPlayer.kill();
		m_localPlayer = null;
	}
	

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
		
		for (elem in m_players)
		{
			if (elem.m_lastUpdate > Reg.client_timeout)
			{
				removePlayer(elem.m_id);
			}
		}
		
		if (m_evilTower.m_isMaster == true)
		{
			// resolve collide
			m_level.collideWithMap(m_playersGroup, m_evilTower.OnCollide);
			m_level.collideWithMap(m_localPlayer, m_evilTower.OnCollide);
		}
		
		// check endgame
		m_level.checkEndGame(m_localPlayer, onCollideEndGame);
		
		// respawn
		if (m_localPlayer.m_markedToDeath && m_localPlayer.animation.finished)
		{
			// we can respawn based on inputs
			if (FlxG.mouse.justReleased)
			{
				var spawn:FlxPoint = m_level.spawn();
				m_localPlayer.teleport(spawn.x, spawn.y);
				
				m_localPlayer.m_markedToDeath = false;
			}
		}
		
		// updatate input text
		m_inputText.x = FlxG.camera.scroll.x;
		
		if (FlxG.keys.justReleased.ENTER)
		{
			if (m_inputText.text != "<ENTER> TO CHAT")
			{
				if (m_inputText.hasFocus)
				{	
					m_localPlayer.setChat(m_inputText.text);
					var position = { x:m_localPlayer.x, y:m_localPlayer.y, playerID:Reg.playerID, chat:m_inputText.text };
					var websocket:WebSocketPlugin = cast(FlxG.plugins.get(WebSocketPlugin), WebSocketPlugin);
					websocket.send(Reg.message_chat, position);
					
					checkMessage(m_inputText.text);
					m_inputText.text = "<ENTER> TO CHAT";
				}
			}
			else
			{
				m_inputText.text = "";
			}
			
			m_inputText.hasFocus = !m_inputText.hasFocus;
		}

	}
	
	function checkMessage(text:String): Void
	{
		// if the player is alive
		if (m_localPlayer.m_markedToDeath == false)
		{
			var isOver:Bool = false;
			text = text.toLowerCase();
			
			// check good words
			for (elem in m_winlines)
			{
				if (text == elem)
				{
					m_localPlayer.teleport(800, m_localPlayer.y);
					isOver = true;
					break;
				}
			}
			
			if (isOver == false)
			{	
				// check bad words
				for (elem in m_looselines)
				{
					if (text == elem)
					{
						m_localPlayer.teleport(600, m_localPlayer.y);
						isOver = true;
						break;
					}
				}
			}
		}
	}
	
	function addPlayer(playerID:Int, position:FlxPoint): Player
	{
		var player:Player = new Player(position, this, playerID);
		m_players[playerID] = player;
		m_playersGroup.add(player);
		
		add(player);
		
		return player;
	}
	
	function removePlayer(playerID:Int): Void
	{
		var player:Player = m_players.get(playerID);
		
		if (player != null)
		{
			m_players.remove(playerID);
			m_playersGroup.remove(player);
			remove(player);
		}
	}
	
	function onDisconnect() : Void
	{
		// go back to connect state
		//FlxG.switchState(new MenuState());
		FlxG.switchState(new GameState());
	}
	
	function onCollideEndGame(p0:Dynamic, p1:Dynamic) : Void
	{
		FlxG.switchState(new EndGameState());
	}
	
	function onMessageSteering(message:Dynamic) : Void
	{
		//trace(message);
		
		if (message.playerID != Reg.playerID)
		{
			var player:Player = m_players.get(message.playerID);
			
			var pos:FlxPoint = new FlxPoint(message.x, message.y);
			var pos_steering:FlxPoint = new FlxPoint(message.steering_x, message.steering_y);
			
			if (player == null)
			{
				//trace("player not found!");
				player = addPlayer(message.playerID, pos);
			}
			
			player.setSteering(pos, pos_steering);
		}
	}
	
	function onMessageDeath(message:Dynamic) : Void
	{
		//trace(message);
		
		// kill the poor guy if it is someone else
		var player:Player = m_players.get(message.playerID);
		
		if (player != null)
		{
			//trace("other die locally");
			// ask the tower to play the animation
			m_evilTower.fire(player);
			
			player.die(message.x, message.y);
		}
		else if (m_localPlayer.m_id == message.playerID)
		{
			//trace("i die locally");
			// if it is me
			// i die horribly
			FlxG.camera.shake(0.01, 0.2);
			m_localPlayer.die(message.x, message.y);
		}
	}
	
	function onMessageTeleport(message:Dynamic) : Void
	{
		if (m_localPlayer.m_id != message.playerID)
		{
			//trace("teleport " + message.playerID);
			var player:Player =  m_players.get(message.playerID);
			
			if (player == null)
			{
				var position:FlxPoint = new FlxPoint(message.x, message.y);
				player = addPlayer(message.playerID, position);
			}

			// cannot be dead if teleport
			player.m_markedToDeath = false;
			player.teleport(message.x, message.y);
		}
	}
	
	function onMessageChat(message:Dynamic) : Void
	{
		if (m_localPlayer.m_id != message.playerID)
		{
			//trace("chat " + message.playerID);
			var player:Player =  m_players.get(message.playerID);
			
			if (player == null)
			{
				var pos:FlxPoint = new FlxPoint(message.x, message.y);
				player = addPlayer(message.playerID, pos);
				player.teleport(message.x, message.y);
			}
			
			player.setChat(message.chat);
		}
	}
}