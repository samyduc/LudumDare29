package;

import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.FlxG;
import flixel.plugin.FlxPlugin;

/**
 * try reconnection and if succeed go to the game
 */
class ConnectionState extends FlxState
{
	
	var m_sendRequestPlayerID:Bool = false;
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		add(new FlxText(0, 0, 100, "Connecting to server ..."));
		
		var websocket:WebSocketPlugin = cast(FlxG.plugins.get(WebSocketPlugin), WebSocketPlugin);
		websocket.m_callback_connection = onConnect;
		websocket.registerMessageCallback("connect_A", onConnectAnswer);
		
		websocket.connect();
		m_sendRequestPlayerID = false;
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
		
		var websocket:WebSocketPlugin = cast(FlxG.plugins.get(WebSocketPlugin),WebSocketPlugin);
		if (websocket.isConnected() && m_sendRequestPlayerID == false)
		{
			// get unique id and we can go
			m_sendRequestPlayerID = true;
			websocket.send("connect_R", null);
		}
	}
	
	function onConnect(is_success:Bool) : Void
	{
		if (is_success)
		{
			//trace("connection success");
		}
		else
		{
			//trace("error while connecting");
			FlxG.switchState(new MenuState());
		}
	}
	
	function onConnectAnswer(event:Dynamic) : Void
	{
		// save context
		Reg.playerID = event.playerID;
		//trace("player ID");
		//trace(Reg.playerID);
		
		// go to game
		FlxG.switchState(new GameState());
	}
}