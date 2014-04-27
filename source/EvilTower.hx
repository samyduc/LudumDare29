package;

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
import flixel.text.FlxText;
import flixel.util.FlxColor;
import haxe.Json;
import haxe.Timer;

class EvilTower extends FlxSprite 
{
	public var m_isMaster:Bool = false;
	var m_parent:FlxState = null;
	var m_isFiring:Bool = false;
	var m_chat:FlxText;
	var m_chatTimer:Timer;
	var m_chatComeBackTimer:Timer;
	
	var m_chatlines:Array<String> = ["Ludum dare extrem edition welcome you",
									 "You smell like cheese",
									 "Please baby don't go",
									 "Come closer",
									 "It is rainy up there",
									 "I am very nice",
									 "I haxe anxiety issues",
									 "Don't die like the others",
									 "Just be nice please",
									 "But some stupid with a flare gun ♫",
									 "I am glad you are back",
									 "make peace",
									 "BURN BURN BURN",
									 "stay classy internet",
									 "are you still there ?",
									 "Do something nice",
									 "HAHAHAHAHAHAHAH"
										];
	
	var m_tween:FlxTween;
	
	public function new(position:FlxPoint, parent:FlxState, isMaster:Bool = false) 
	{
		super(position.x, position.y);
		
		m_parent = parent;
		m_isMaster = isMaster;
		
		loadGraphic("assets/images/tower2.png", true, 32, 32);
		animation.add("idle", [0, 1, 2, 3], 10, true);
		animation.add("fire", [4, 5, 6], 5, false);
		
		animation.play("idle");
		
		// chat
		//if (m_isMaster)
		//{
			setChat(m_chatlines[0]);
		//}
	}
	
	public override function update():Void
	{
		if (m_isMaster == true)
		{
			// check nearby players
			//FlxG.collide(this, m_parent.m_playersGroup, OnCollide);
			
		}
		
		super.update();
		
		if (animation.finished == true)
		{
			animation.play("idle");
			m_isFiring = false;
		}
	}
	
	public function OnCollide(p0:Dynamic, p1:Dynamic): Void
	{
		if (m_isFiring == false && m_isMaster && p1.m_markedToDeath == false)
		{
			// one should be me, second a player
			//trace("hit!!");
			
			fire(p1);
			
			// send death message (it is a player
			var position = { x:p1.x, y:p1.y, playerID:p1.m_id };
			var websocket:WebSocketPlugin = cast(FlxG.plugins.get(WebSocketPlugin), WebSocketPlugin);

			websocket.send(Reg.message_death, position);
		}
	}
	
	public function fire(p:Dynamic): Void
	{
		if (m_tween != null)
		{
			m_tween.cancel();
		}
		
		m_isFiring = true;
		animation.play("fire");
		p.m_markedToDeath = true;	
	}
	
	public function setChat(text:String) : Void
	{
		// troncate string if needed
		//text = text.substr(0, Reg.chat_max_len);
		
		if (m_parent != null)
		{
			// i hate this string class, bugged at every turn
			if (m_chat != null)
			{
				m_parent.remove(m_chat);
				m_chat = null;
			}
			
			m_chat = new FlxText(x, y, 0, "");
			
			if (m_isMaster)
			{
				m_chat.offset.y = 10;
			}
			else
			{
				m_chat.offset.y = 100;
				m_chat.offset.x = -150;
			}
			m_chat.fieldWidth = 200;
			
			m_chat.setFormat(null, 8, FlxColor.RED, "center");

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
	}
	
	function resetChat() : Void
	{
		//m_chat.textField = "";
		m_parent.remove(m_chat);
		m_chat = null;
		m_chatTimer.stop();
		
		// next line
		chooseRandomChat();
	}
	
	function chooseRandomChat() : Void
	{
		var wait:Int = Std.random(6*1000);
		m_chatComeBackTimer = new Timer(wait);
		m_chatComeBackTimer.run = onChooseRandomChat;
	}
	
	function onChooseRandomChat(): Void
	{
		m_chatComeBackTimer.stop();
		m_chatComeBackTimer = null;
		
		var index:Int = Std.random(m_chatlines.length);
		setChat(m_chatlines[index]);
	}
	
	override public function kill():Void
	{
		m_parent = null;
		
		if (m_chatComeBackTimer != null)
		{
			m_chatComeBackTimer.stop();
			m_chatComeBackTimer = null;
		}
		
		if (m_chatTimer != null)
		{
			m_chatTimer.stop();
			m_chatTimer = null;
		}
		
		super.kill();
	}
}