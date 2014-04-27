package;

import flixel.util.FlxSave;

/**
 * Handy, pre-built Registry class that can be used to store 
 * references to objects and other things for quick-access. Feel
 * free to simply ignore it or change it in any way you like.
 */
class Reg
{
	public static var playerID:Int = 0;
	public static var message_steering:String = "steering_G";
	public static var message_death:String = "death_G";
	public static var message_teleport:String = "teleport_G";
	public static var message_chat:String = "chat_G";
	
	public static var client_timeout:Float = 180;
	public static var chat_max_len:Int = 250;
	public static var chat_fadin:Int = 5 * 1000;
}