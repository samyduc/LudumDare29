package;

import flash.Lib;
import flash.display.Graphics;
import flixel.FlxGame;
import flixel.plugin.FlxPlugin;
import flixel.text.FlxText;

import haxe.Json;

import com.gemioli.io.SocketConnectionStatus;
import com.gemioli.io.Socket;
import com.gemioli.io.events.SocketEvent;

class WebSocketPlugin extends FlxPlugin
{

	var m_i:Int = 0;
	//var m_text:FlxText = new FlxText(10.0, 10.0, 1000, "Inactive socket", 8);
	
	var m_socket:Socket = null;
	var m_url:String = "http://star-killer.net:80";
	//var m_url:String = "http://localhost:80";
	
	var m_message_callback = new Map <String, Dynamic->Void > ();
	
	public var m_callback_connection:Bool->Void = null;
	public var m_callback_disconnection:Void->Void = null;
	
	/**
	 * You can pretty much ignore this logic and edit the variables above.
	 */
	public function new()
	{
		super();
		
		m_socket = new Socket(m_url);
		
		m_socket.addEventListener(SocketEvent.CONNECT, onConnectOK);
		m_socket.addEventListener(SocketEvent.CONNECT_FAILED, onConnectKO);
		m_socket.addEventListener(SocketEvent.DISCONNECTING, onDisconnection);
		m_socket.addEventListener(SocketEvent.DISCONNECT, onDisconnect);
		m_socket.addEventListener(SocketEvent.ERROR, onError);
		m_socket.addEventListener(SocketEvent.MESSAGE, onMessage);
		m_socket.addEventListener(SocketEvent.RECONNECTING, onReconnecting);
		m_socket.addEventListener(SocketEvent.RECONNECT, onReconnectOK);
		m_socket.addEventListener(SocketEvent.RECONNECT_FAILED, onReconnectKO);
		
		m_socket.addEventListener("message", onMessage);
	}
	
	/*override public function draw() : Void
	{
		super.draw();
		
		m_text.draw();	
		
		
	}*/
	
	public function connect() : Void
	{
		m_socket.connect();
	}
	
	public function disconnect() : Void
	{
		m_socket.disconnect();
	}
	
	public function isConnected() : Bool
	{
		return (m_socket.connectionStatus == SocketConnectionStatus.CONNECTED);
		
	}
	
	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
		
		m_i = m_i + 1;
		//m_text = new FlxText(10.0, 10.0, 1000, "Iteration" + m_i, 8);
		//trace(m_i);
		//m_text.update();
		
	}
	
	public function registerMessageCallback(name:String, callback:Dynamic->Void) : Void
	{
		// override if already present
		m_message_callback.set(name, callback);
	}
	
	public function send(name:String, payload:Dynamic): Void
	{
		m_socket.emit(name, payload);
	}
	
	override public inline function onStateSwitch():Void
	{
		// clean callbacks
		m_callback_connection = null;
		m_callback_disconnection = null;
		
		m_message_callback = null;
		m_message_callback = new Map < String, Dynamic->Void > ();
	}
	
	function onConnectOK(event:SocketEvent) : Void
	{
		
		//m_text = new FlxText(10.0, 10.0, 1000, "Connect OK" + m_i, 8);
		
		if (m_callback_connection != null)
		{
			m_callback_connection(true);
		}
	}
	
	function onConnectKO(event:SocketEvent) : Void
	{
		//m_text = new FlxText(10.0, 10.0, 1000, "Connect KO" + m_i, 8);
		
		if (m_callback_connection != null)
		{
			m_callback_connection(false);
		}
	}
	
	function onDisconnection(event:SocketEvent) : Void
	{
		//m_text = new FlxText(10.0, 10.0, 1000, "onDisconnection" + m_i, 8);
	}
	
	function onDisconnect(event:SocketEvent) : Void
	{
		//m_text = new FlxText(10.0, 10.0, 1000, "onDisconnect" + m_i, 8);
		
		if (m_callback_disconnection != null)
		{
			m_callback_disconnection();
			// we dont want to reconnect silently
			m_socket.disconnect();
		}
	}
	
	function onError(event:SocketEvent) : Void
	{
		//m_text = new FlxText(10.0, 10.0, 1000, "onError" + m_i, 8);
	
	}
	
	function onMessage(event:SocketEvent) : Void
	{
		//m_text = new FlxText(10.0, 10.0, 1000, "onMessage" + m_i, 8);

		// unserialize json
		var name:String = event.args[0].name;
		
		var callback:Dynamic->Void = m_message_callback.get(name);
		
		if (callback != null)
		{
			callback(event.args[0]);
		}
		else
		{
			//trace("message[" + name + "] dropped");
		}
	}
	
	function onReconnecting(event:SocketEvent) : Void
	{
		//m_text = new FlxText(10.0, 10.0, 1000, "onReconnecting" + m_i, 8);
	
	}	
	
	function onReconnectOK(event:SocketEvent) : Void
	{
		//m_text = new FlxText(10.0, 10.0, 1000, "onReconnectOK" + m_i, 8);
	
	}	
	
	function onReconnectKO(event:SocketEvent) : Void
	{
		//m_text = new FlxText(10.0, 10.0, 1000, "onReconnectKO" + m_i, 8);
	
	}	
	
}
