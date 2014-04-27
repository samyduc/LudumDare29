package;

import flixel.FlxState;
import openfl.Assets;
import haxe.io.Path;
import haxe.xml.Parser;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.tile.FlxTilemap;
import flixel.util.FlxPoint;
import flixel.text.FlxText;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledObject;
import flixel.addons.editors.tiled.TiledObjectGroup;
import flixel.addons.editors.tiled.TiledTileSet;

// base code is from haxe flixel sample
class Level extends TiledMap
{
	public var m_backgroundTiles:FlxGroup;
	public var m_towerSpawner:FlxPoint = new FlxPoint();
	private var m_collidableTileLayers:FlxGroup;
	private var m_endGameCollider:FlxGroup;
	
	var m_spawners:Array<FlxPoint> = new Array<FlxPoint>();
	
	
	public function new(tiledLevel:Dynamic)
	{
		super(tiledLevel);
		
		m_backgroundTiles = new FlxGroup();
		m_collidableTileLayers = new FlxGroup();
		m_endGameCollider = new FlxGroup();
		
		// Load Tile Maps
		for (tileLayer in layers)
		{
			var tileSheetName:String = tileLayer.properties.get("tileset");
			
			if (tileSheetName == null)
			{
				throw "'tileset' property not defined for the '" + tileLayer.name + "' layer. Please add the property to the layer.";
			}
				
			var tileSet:TiledTileSet = null;
			for (ts in tilesets)
			{
				if (ts.name == tileSheetName)
				{
					tileSet = ts;
					break;
				}
			}
			
			if (tileSet == null)
			{
				throw "Tileset '" + tileSheetName + " not found. Did you mispell the 'tilesheet' property in " + tileLayer.name + "' layer?";
			}
				
			var imagePath 		= new Path(tileSet.imageSource);
			var processedPath 	= "assets/images/" + imagePath.file + "." + imagePath.ext;
			
			var tilemap:FlxTilemap = new FlxTilemap();
			tilemap.widthInTiles = width;
			tilemap.heightInTiles = height;
			tilemap.loadMap(tileLayer.tileArray, processedPath, tileSet.tileWidth, tileSet.tileHeight, 0, 1, 1, 1);
			
			m_backgroundTiles.add(tilemap);
		}
	}
	
	public function loadObjects(state:GameState)
	{
		for (group in objectGroups)
		{
			for (o in group.objects)
			{
				loadObject(o, group, state);
			}
		}
	}
	
	private function loadObject(o:TiledObject, g:TiledObjectGroup, state:GameState)
	{
		var x:Int = o.x;
		var y:Int = o.y;
		
		// objects in tiled are aligned bottom-left (top-left in flixel)
		if (o.gid != -1)
			y -= g.map.getGidOwner(o.gid).tileHeight;
		
		switch (o.type.toLowerCase())
		{
			case "spawner":
				
				var spawner:FlxPoint = new FlxPoint(x, y);
				m_spawners.push(spawner);
				
			case "towerspawner":
				m_towerSpawner.set(x, y);
				
			case "text":
				var text:FlxText = new FlxText(x, y, 0, o.name, 20);
				text.color = 0xaa0000;
				state.add(text);
				
			case "collider":
				var collide = new FlxObject(x, y, o.width, o.height);
				if (o.name != "endgame")
				{
					m_collidableTileLayers.add(collide);
				}
				else
				{
					m_endGameCollider.add(collide);
				}
				
			/*case "coin":
				var tileset = g.map.getGidOwner(o.gid);
				var coin = new FlxSprite(x, y, c_PATH_LEVEL_TILESHEETS + tileset.imageSource);
				state.coins.add(coin);
				
			case "exit":
				// Create the level exit
				var exit = new FlxSprite(x, y);
				exit.makeGraphic(32, 32, 0xff3f3f3f);
				exit.exists = false;
				state.exit = exit;
				state.add(exit);*/
		}
	}
	
	public function spawn() : FlxPoint
	{
		var spawner:FlxPoint;
		
		var randomSpawner:Int = Std.random(m_spawners.length);
		spawner = m_spawners[randomSpawner];
		
		return spawner;
	}

	public function spawnTower() : FlxPoint
	{
		return m_towerSpawner;
	}
	
	public function collideWithMap(obj:Dynamic, notifyCallback:Dynamic->Dynamic->Void):Void
	{
		FlxG.overlap(m_collidableTileLayers, obj, notifyCallback);
	}
	
	public function checkEndGame(obj:Dynamic, notifyCallback:Dynamic->Dynamic->Void):Void
	{
		// horrible hack ...
		if (obj.x > 900)
		{
			notifyCallback(obj, obj);
		}
	}
}