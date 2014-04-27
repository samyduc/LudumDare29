package;

import flixel.text.FlxText;
import flixel.util.FlxPoint;
import openfl.Assets;
import flixel.effects.particles.FlxEmitter;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.util.FlxColor;
import haxe.Json;
import haxe.Timer;

class Player extends FlxSprite 
{
	public var m_id:Int = 0;
	var m_parent:FlxState = null;
	var m_isMaster:Bool = false;
	public var m_lastUpdate:Float = 0;
	public var m_markedToDeath:Bool = false;
	var m_tween:FlxTween;
	var m_chat:FlxText;
	var m_chatTimer:Timer = new Timer(Reg.chat_fadin);
	
	var m_speed:Float = 100;
	var m_position:FlxPoint = new FlxPoint();
	var m_steering:FlxPoint = new FlxPoint();
	var m_direction:FlxPoint = new FlxPoint();
	
	public function new(position:FlxPoint, parent:FlxState, id:Int) 
	{
		super(position.x, position.y);
		position.copyTo(m_steering);
		position.copyTo(m_position);
		
		m_lastUpdate = 0;
		m_parent = parent;
		m_isMaster = Reg.playerID == id;
		m_id = id;
		
		// setup animations
		loadGraphic("assets/images/test1.png", true, 32, 32);
		animation.add("idle", [0, 3, 0, 3, 0, 4, 0, 3], 1, true);
		animation.add("walk", [0, 1, 0, 2], 5, true);
		animation.add("die", [5, 6, 7, 8, 9, 10, 11], 5, false);
		animation.add("teleport", [12, 13, 14], 5, false);
		
		animation.play("idle");
		
		// kind of a spawn request
		teleport(position.x, position.y);
		
		// debug

	}
	
	public override function update():Void
	{
		//this.x = m_position.x;
		//this.y = m_position.y;
		
		m_position.x = this.x;
		m_position.y = this.y;
		
		if (m_chat != null)
		{
			m_chat.x = this.x;
			m_chat.y = this.y;
		}
		
		if (m_isMaster && m_markedToDeath == false)
		{
			// inputs
			if (FlxG.mouse.justReleased)
			{
				// update steering
				m_steering.x = FlxG.mouse.x;
				m_steering.y = FlxG.mouse.y;
				
				setSteering(m_position, m_steering);
				
				var position = { x:m_position.x, y:m_position.y, steering_x:m_steering.x, steering_y:m_steering.y, playerID:Reg.playerID };
				var websocket:WebSocketPlugin = cast(FlxG.plugins.get(WebSocketPlugin), WebSocketPlugin);
				websocket.send(Reg.message_steering, position);
			}
			
			
		}
		
		if (animation.finished && m_markedToDeath == false)
		{
			animation.play("idle");
		}
		
		m_lastUpdate = m_lastUpdate + FlxG.elapsed;
		super.update();
	}
	
	public function setSteering(position:FlxPoint, position_steering:FlxPoint):Void
	{
		m_lastUpdate = 0;
		m_steering = position_steering;
		
		
		var distance:Float = m_position.distanceTo(m_steering);
		
		if (m_tween != null)
		{
			m_tween.cancel();
		}
		
		this.flipX = (m_steering.x - m_position.x < 0);

		
		m_tween = FlxTween.tween(this, { x:m_steering.x, y:m_steering.y }, distance / m_speed, { type:FlxTween.ONESHOT, ease:FlxEase.quadIn, complete:tweenWalkOver, startDelay:0, loopDelay:0 });
		animation.play("walk");
		
	}
	
	public function setChat(text:String) : Void
	{
		m_lastUpdate = 0;
		// troncate string if needed
		text = text.substr(0, Reg.chat_max_len);
		
		// i hate this string class, bugged at every turn
		if (m_chat != null)
		{
			m_parent.remove(m_chat);
			m_chat = null;
		}
		
		m_chat = new FlxText(x, y, 0, "");
		m_chat.offset.y = 10;
		m_chat.fieldWidth = 200;
		
		if (m_isMaster)
		{
			// because the crew is awesome
			m_chat.setFormat(null, 8, FlxColor.IVORY, "center");
		}
		else
		{
			m_chat.setFormat(null, 8, FlxColor.GREEN, "center");
		}
		m_chat.setBorderStyle(FlxText.BORDER_OUTLINE, FlxColor.BLACK, 1);
		m_parent.add(m_chat);
		m_chat.text = text;
		
		if (m_chatTimer != null)
		{
			m_chatTimer.stop();
		}
		
		m_chatTimer = new Timer(Reg.chat_fadin);
		m_chatTimer.run = resetChat;
	}
	
	function resetChat() : Void
	{
		//m_chat.textField = "";
		m_parent.remove(m_chat);
		m_chat = null;
		m_chatTimer.stop();
	}
	
	private function tweenWalkOver(tween:FlxTween):Void
	{
		if (m_markedToDeath == false)
		{
			animation.play("idle");
		}
	}
	
	override public function kill():Void
	{
		if (m_chatTimer != null)
		{
			m_chatTimer.stop();
			m_chatTimer = null;
		}
		
		super.kill();
	}
	
	public function teleport(x:Float, y:Float) : Void
	{
		FlxG.sound.play("assets/music/teleport.mp3");
		
		m_lastUpdate = 0;
		animation.play("teleport");
		
		this.x = x;
		this.y = y;
		
		m_position.x = x;
		m_position.y = y;
		
		m_steering.x = x;
		m_steering.y = y;
		
		if (m_tween != null)
		{
			m_tween.cancel();
		}
		
		if (m_isMaster == true)
		{

			// send network message
			var position = { x:x, y:y, playerID:m_id };
			var websocket:WebSocketPlugin = cast(FlxG.plugins.get(WebSocketPlugin), WebSocketPlugin);

			websocket.send(Reg.message_teleport, position);
		}
	}
	
	public function die(x:Float, y:Float) : Void
	{
		FlxG.sound.play("assets/music/mort.mp3");
		
		this.x = x;
		this.y = y;
		
		m_position.x = x;
		m_position.y = y;
		
		m_steering.x = x;
		m_steering.y = y;
		
		if (m_tween != null)
		{
			m_tween.cancel();
		}
		
		animation.play("die");
	}
}