package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.FlxG;
import flixel.plugin.FlxPlugin;
import flixel.addons.ui.FlxUIState;
import flixel.util.FlxPoint;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxUIState
{
	var m_showcase:Player;
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		_xml_id = "menu_state";
		super.create();
		
		var position:FlxPoint = new FlxPoint(200, 100);
		m_showcase = new Player(position, this, -1);
		m_showcase.scale.set(10, 10);
		add(m_showcase);
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}
	
	public override function getRequest(name:String, target:Dynamic, data:Dynamic, ?params:Array<Dynamic>):Dynamic
	{
		return null;
	}	
	
	public override function getEvent(name:String, target:Dynamic, data:Dynamic, ?params:Array<Dynamic>):Void
	{
		if (params != null)
		{
			switch(name)
			{
				case "click_button":
				{
					switch(cast(params[0], String))
					{
						case "button_connect":
						{
							FlxG.switchState(new ConnectionState());
						}
					}
				}
			}
		}
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
	}	
}