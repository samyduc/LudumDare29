package;

import flash.Lib;
import flixel.FlxGame;
import flixel.FlxState;
import flixel.FlxG;

class GameClass extends FlxGame
{
	var gameWidth:Int = 640; // Width of the game in pixels (might be less / more in actual pixels depending on your zoom).
	var gameHeight:Int = 280; // Height of the game in pixels (might be less / more in actual pixels depending on your zoom).
	var initialState:Class<FlxState> = MenuState; // The FlxState the game starts with.
	var zoom:Float = 1; // If -1, zoom is automatically calculated to fit the window dimensions.
	var framerate:Int = 60; // How many frames per second the game should run at.
	var skipSplash:Bool = false; // Whether to skip the flixel splash screen that appears in release mode.
	var startFullscreen:Bool = false; // Whether to start the game in fullscreen on desktop targets

	/**
	 * You can pretty much ignore this logic and edit the variables above.
	 */
	public function new()
	{
		var stageWidth:Int = 640;
		var stageHeight:Int = 280;

		if (zoom == -1)
		{
			var ratioX:Float = stageWidth / gameWidth;
			var ratioY:Float = stageHeight / gameHeight;
			zoom = Math.min(ratioX, ratioY);
			gameWidth = Math.ceil(stageWidth / zoom);
			gameHeight = Math.ceil(stageHeight / zoom);
		}

		var websocketPlugin:WebSocketPlugin = new WebSocketPlugin();
		FlxG.plugins.add(websocketPlugin);
		
		super(gameWidth, gameHeight, initialState, zoom, framerate, framerate, skipSplash, startFullscreen);
		
		// bugged ...
		FlxG.autoPause = false;
	}
	
	// workaround to force the game to run ...
	private override function onFocus(_):Void
	{
		
	}
	
	private override function onFocusLost(_):Void
	{
		
	}
}
