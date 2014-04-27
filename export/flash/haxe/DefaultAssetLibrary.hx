package;


import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.MovieClip;
import flash.text.Font;
import flash.media.Sound;
import flash.net.URLRequest;
import flash.utils.ByteArray;
import haxe.Unserializer;
import openfl.Assets;

#if (flash || js)
import flash.display.Loader;
import flash.events.Event;
import flash.net.URLLoader;
#end

#if ios
import openfl.utils.SystemPath;
#end


@:access(flash.media.Sound)
class DefaultAssetLibrary extends AssetLibrary {
	
	
	public static var className (default, null) = new Map <String, Dynamic> ();
	public static var path (default, null) = new Map <String, String> ();
	public static var type (default, null) = new Map <String, AssetType> ();
	
	public function new () {
		
		super ();
		
		#if flash
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/data/level.tmx", __ASSET__assets_data_level_tmx);
		type.set ("assets/data/level.tmx", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/images/block1.png", __ASSET__assets_images_block1_png);
		type.set ("assets/images/block1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/block2.png", __ASSET__assets_images_block2_png);
		type.set ("assets/images/block2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/block3.png", __ASSET__assets_images_block3_png);
		type.set ("assets/images/block3.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/block4.png", __ASSET__assets_images_block4_png);
		type.set ("assets/images/block4.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/images/player_m.png", __ASSET__assets_images_player_m_png);
		type.set ("assets/images/player_m.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/player_r.png", __ASSET__assets_images_player_r_png);
		type.set ("assets/images/player_r.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/player_sprite_walk.png", __ASSET__assets_images_player_sprite_walk_png);
		type.set ("assets/images/player_sprite_walk.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/test1.ase", __ASSET__assets_images_test1_ase);
		type.set ("assets/images/test1.ase", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/images/test1.png", __ASSET__assets_images_test1_png);
		type.set ("assets/images/test1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/test2.png", __ASSET__assets_images_test2_png);
		type.set ("assets/images/test2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/test3.png", __ASSET__assets_images_test3_png);
		type.set ("assets/images/test3.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/testtileback.ase", __ASSET__assets_images_testtileback_ase);
		type.set ("assets/images/testtileback.ase", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/images/Tileground.png", __ASSET__assets_images_tileground_png);
		type.set ("assets/images/Tileground.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/Tileset_Image.png", __ASSET__assets_images_tileset_image_png);
		type.set ("assets/images/Tileset_Image.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/tower.ase", __ASSET__assets_images_tower_ase);
		type.set ("assets/images/tower.ase", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/images/tower.png", __ASSET__assets_images_tower_png);
		type.set ("assets/images/tower.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/tower2.ase", __ASSET__assets_images_tower2_ase);
		type.set ("assets/images/tower2.ase", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/images/tower2.png", __ASSET__assets_images_tower2_png);
		type.set ("assets/images/tower2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/music/audacity.aup", __ASSET__assets_music_audacity_aup);
		type.set ("assets/music/audacity.aup", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000021.au", __ASSET__assets_music_audacity_data_e00_d00_e0000021_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000021.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e000002b.au", __ASSET__assets_music_audacity_data_e00_d00_e000002b_au);
		type.set ("assets/music/audacity_data/e00/d00/e000002b.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000044.au", __ASSET__assets_music_audacity_data_e00_d00_e0000044_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000044.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000050.au", __ASSET__assets_music_audacity_data_e00_d00_e0000050_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000050.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000082.au", __ASSET__assets_music_audacity_data_e00_d00_e0000082_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000082.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e00000b3.au", __ASSET__assets_music_audacity_data_e00_d00_e00000b3_au);
		type.set ("assets/music/audacity_data/e00/d00/e00000b3.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e000012d.au", __ASSET__assets_music_audacity_data_e00_d00_e000012d_au);
		type.set ("assets/music/audacity_data/e00/d00/e000012d.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e000018b.au", __ASSET__assets_music_audacity_data_e00_d00_e000018b_au);
		type.set ("assets/music/audacity_data/e00/d00/e000018b.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e00001b5.au", __ASSET__assets_music_audacity_data_e00_d00_e00001b5_au);
		type.set ("assets/music/audacity_data/e00/d00/e00001b5.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e00001f9.au", __ASSET__assets_music_audacity_data_e00_d00_e00001f9_au);
		type.set ("assets/music/audacity_data/e00/d00/e00001f9.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e000020b.au", __ASSET__assets_music_audacity_data_e00_d00_e000020b_au);
		type.set ("assets/music/audacity_data/e00/d00/e000020b.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e000020f.au", __ASSET__assets_music_audacity_data_e00_d00_e000020f_au);
		type.set ("assets/music/audacity_data/e00/d00/e000020f.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000214.au", __ASSET__assets_music_audacity_data_e00_d00_e0000214_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000214.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000225.au", __ASSET__assets_music_audacity_data_e00_d00_e0000225_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000225.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e000029e.auf", __ASSET__assets_music_audacity_data_e00_d00_e000029e_auf);
		type.set ("assets/music/audacity_data/e00/d00/e000029e.auf", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e00002a0.au", __ASSET__assets_music_audacity_data_e00_d00_e00002a0_au);
		type.set ("assets/music/audacity_data/e00/d00/e00002a0.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e00002b4.au", __ASSET__assets_music_audacity_data_e00_d00_e00002b4_au);
		type.set ("assets/music/audacity_data/e00/d00/e00002b4.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e00002e3.au", __ASSET__assets_music_audacity_data_e00_d00_e00002e3_au);
		type.set ("assets/music/audacity_data/e00/d00/e00002e3.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e00002ee.au", __ASSET__assets_music_audacity_data_e00_d00_e00002ee_au);
		type.set ("assets/music/audacity_data/e00/d00/e00002ee.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000308.au", __ASSET__assets_music_audacity_data_e00_d00_e0000308_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000308.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000338.au", __ASSET__assets_music_audacity_data_e00_d00_e0000338_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000338.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000347.au", __ASSET__assets_music_audacity_data_e00_d00_e0000347_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000347.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e00003d1.au", __ASSET__assets_music_audacity_data_e00_d00_e00003d1_au);
		type.set ("assets/music/audacity_data/e00/d00/e00003d1.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e00003f7.au", __ASSET__assets_music_audacity_data_e00_d00_e00003f7_au);
		type.set ("assets/music/audacity_data/e00/d00/e00003f7.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e000041b.au", __ASSET__assets_music_audacity_data_e00_d00_e000041b_au);
		type.set ("assets/music/audacity_data/e00/d00/e000041b.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e000043c.au", __ASSET__assets_music_audacity_data_e00_d00_e000043c_au);
		type.set ("assets/music/audacity_data/e00/d00/e000043c.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e000047a.au", __ASSET__assets_music_audacity_data_e00_d00_e000047a_au);
		type.set ("assets/music/audacity_data/e00/d00/e000047a.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e00004bb.au", __ASSET__assets_music_audacity_data_e00_d00_e00004bb_au);
		type.set ("assets/music/audacity_data/e00/d00/e00004bb.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000558.au", __ASSET__assets_music_audacity_data_e00_d00_e0000558_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000558.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000572.au", __ASSET__assets_music_audacity_data_e00_d00_e0000572_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000572.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000589.au", __ASSET__assets_music_audacity_data_e00_d00_e0000589_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000589.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000592.au", __ASSET__assets_music_audacity_data_e00_d00_e0000592_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000592.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e00005c0.au", __ASSET__assets_music_audacity_data_e00_d00_e00005c0_au);
		type.set ("assets/music/audacity_data/e00/d00/e00005c0.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e00005d8.au", __ASSET__assets_music_audacity_data_e00_d00_e00005d8_au);
		type.set ("assets/music/audacity_data/e00/d00/e00005d8.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000612.au", __ASSET__assets_music_audacity_data_e00_d00_e0000612_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000612.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000616.au", __ASSET__assets_music_audacity_data_e00_d00_e0000616_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000616.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000666.au", __ASSET__assets_music_audacity_data_e00_d00_e0000666_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000666.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e00006a3.au", __ASSET__assets_music_audacity_data_e00_d00_e00006a3_au);
		type.set ("assets/music/audacity_data/e00/d00/e00006a3.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e00006c1.au", __ASSET__assets_music_audacity_data_e00_d00_e00006c1_au);
		type.set ("assets/music/audacity_data/e00/d00/e00006c1.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e00006cc.au", __ASSET__assets_music_audacity_data_e00_d00_e00006cc_au);
		type.set ("assets/music/audacity_data/e00/d00/e00006cc.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e00006fe.au", __ASSET__assets_music_audacity_data_e00_d00_e00006fe_au);
		type.set ("assets/music/audacity_data/e00/d00/e00006fe.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000726.au", __ASSET__assets_music_audacity_data_e00_d00_e0000726_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000726.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000727.au", __ASSET__assets_music_audacity_data_e00_d00_e0000727_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000727.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000733.au", __ASSET__assets_music_audacity_data_e00_d00_e0000733_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000733.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000772.auf", __ASSET__assets_music_audacity_data_e00_d00_e0000772_auf);
		type.set ("assets/music/audacity_data/e00/d00/e0000772.auf", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000788.au", __ASSET__assets_music_audacity_data_e00_d00_e0000788_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000788.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000790.au", __ASSET__assets_music_audacity_data_e00_d00_e0000790_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000790.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000795.au", __ASSET__assets_music_audacity_data_e00_d00_e0000795_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000795.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e00007a9.au", __ASSET__assets_music_audacity_data_e00_d00_e00007a9_au);
		type.set ("assets/music/audacity_data/e00/d00/e00007a9.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e00007bc.au", __ASSET__assets_music_audacity_data_e00_d00_e00007bc_au);
		type.set ("assets/music/audacity_data/e00/d00/e00007bc.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e00007c5.au", __ASSET__assets_music_audacity_data_e00_d00_e00007c5_au);
		type.set ("assets/music/audacity_data/e00/d00/e00007c5.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e000080f.au", __ASSET__assets_music_audacity_data_e00_d00_e000080f_au);
		type.set ("assets/music/audacity_data/e00/d00/e000080f.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000817.au", __ASSET__assets_music_audacity_data_e00_d00_e0000817_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000817.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000835.au", __ASSET__assets_music_audacity_data_e00_d00_e0000835_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000835.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000844.au", __ASSET__assets_music_audacity_data_e00_d00_e0000844_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000844.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000856.au", __ASSET__assets_music_audacity_data_e00_d00_e0000856_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000856.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000883.au", __ASSET__assets_music_audacity_data_e00_d00_e0000883_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000883.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000890.au", __ASSET__assets_music_audacity_data_e00_d00_e0000890_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000890.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e00008bc.au", __ASSET__assets_music_audacity_data_e00_d00_e00008bc_au);
		type.set ("assets/music/audacity_data/e00/d00/e00008bc.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000923.au", __ASSET__assets_music_audacity_data_e00_d00_e0000923_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000923.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000935.au", __ASSET__assets_music_audacity_data_e00_d00_e0000935_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000935.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000997.au", __ASSET__assets_music_audacity_data_e00_d00_e0000997_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000997.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e00009a3.au", __ASSET__assets_music_audacity_data_e00_d00_e00009a3_au);
		type.set ("assets/music/audacity_data/e00/d00/e00009a3.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e00009ab.au", __ASSET__assets_music_audacity_data_e00_d00_e00009ab_au);
		type.set ("assets/music/audacity_data/e00/d00/e00009ab.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e00009b4.au", __ASSET__assets_music_audacity_data_e00_d00_e00009b4_au);
		type.set ("assets/music/audacity_data/e00/d00/e00009b4.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e00009ca.au", __ASSET__assets_music_audacity_data_e00_d00_e00009ca_au);
		type.set ("assets/music/audacity_data/e00/d00/e00009ca.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e00009f5.au", __ASSET__assets_music_audacity_data_e00_d00_e00009f5_au);
		type.set ("assets/music/audacity_data/e00/d00/e00009f5.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000a22.au", __ASSET__assets_music_audacity_data_e00_d00_e0000a22_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000a22.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000a59.au", __ASSET__assets_music_audacity_data_e00_d00_e0000a59_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000a59.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000a6a.au", __ASSET__assets_music_audacity_data_e00_d00_e0000a6a_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000a6a.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000a70.au", __ASSET__assets_music_audacity_data_e00_d00_e0000a70_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000a70.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000ac7.au", __ASSET__assets_music_audacity_data_e00_d00_e0000ac7_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000ac7.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000ada.au", __ASSET__assets_music_audacity_data_e00_d00_e0000ada_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000ada.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000b08.au", __ASSET__assets_music_audacity_data_e00_d00_e0000b08_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000b08.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000b21.au", __ASSET__assets_music_audacity_data_e00_d00_e0000b21_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000b21.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000b77.au", __ASSET__assets_music_audacity_data_e00_d00_e0000b77_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000b77.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000bc1.au", __ASSET__assets_music_audacity_data_e00_d00_e0000bc1_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000bc1.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000bc6.au", __ASSET__assets_music_audacity_data_e00_d00_e0000bc6_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000bc6.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000c64.au", __ASSET__assets_music_audacity_data_e00_d00_e0000c64_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000c64.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000c7e.au", __ASSET__assets_music_audacity_data_e00_d00_e0000c7e_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000c7e.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000caa.au", __ASSET__assets_music_audacity_data_e00_d00_e0000caa_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000caa.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000ccd.au", __ASSET__assets_music_audacity_data_e00_d00_e0000ccd_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000ccd.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000d10.au", __ASSET__assets_music_audacity_data_e00_d00_e0000d10_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000d10.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000d42.au", __ASSET__assets_music_audacity_data_e00_d00_e0000d42_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000d42.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000da6.au", __ASSET__assets_music_audacity_data_e00_d00_e0000da6_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000da6.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000e2f.au", __ASSET__assets_music_audacity_data_e00_d00_e0000e2f_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000e2f.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000ec4.au", __ASSET__assets_music_audacity_data_e00_d00_e0000ec4_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000ec4.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000ed8.au", __ASSET__assets_music_audacity_data_e00_d00_e0000ed8_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000ed8.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000f02.au", __ASSET__assets_music_audacity_data_e00_d00_e0000f02_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000f02.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000f23.au", __ASSET__assets_music_audacity_data_e00_d00_e0000f23_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000f23.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000f5b.au", __ASSET__assets_music_audacity_data_e00_d00_e0000f5b_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000f5b.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000f5e.au", __ASSET__assets_music_audacity_data_e00_d00_e0000f5e_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000f5e.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000fa9.au", __ASSET__assets_music_audacity_data_e00_d00_e0000fa9_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000fa9.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/audacity_data/e00/d00/e0000fec.au", __ASSET__assets_music_audacity_data_e00_d00_e0000fec_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000fec.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/music/mort.mp3", __ASSET__assets_music_mort_mp3);
		type.set ("assets/music/mort.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/music/teleport.mp3", __ASSET__assets_music_teleport_mp3);
		type.set ("assets/music/teleport.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		className.set ("assets/music/win.mp3", __ASSET__assets_music_win_mp3);
		type.set ("assets/music/win.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/xml/end_state.xml", __ASSET__assets_xml_end_state_xml);
		type.set ("assets/xml/end_state.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/xml/game_state.xml", __ASSET__assets_xml_game_state_xml);
		type.set ("assets/xml/game_state.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/xml/menu_state.xml", __ASSET__assets_xml_menu_state_xml);
		type.set ("assets/xml/menu_state.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/box.png", __ASSET__flixel_flixel_ui_img_box_png);
		type.set ("flixel/flixel-ui/img/box.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/button.png", __ASSET__flixel_flixel_ui_img_button_png);
		type.set ("flixel/flixel-ui/img/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/button_arrow_down.png", __ASSET__flixel_flixel_ui_img_button_arrow_down_png);
		type.set ("flixel/flixel-ui/img/button_arrow_down.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/button_arrow_left.png", __ASSET__flixel_flixel_ui_img_button_arrow_left_png);
		type.set ("flixel/flixel-ui/img/button_arrow_left.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/button_arrow_right.png", __ASSET__flixel_flixel_ui_img_button_arrow_right_png);
		type.set ("flixel/flixel-ui/img/button_arrow_right.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/button_arrow_up.png", __ASSET__flixel_flixel_ui_img_button_arrow_up_png);
		type.set ("flixel/flixel-ui/img/button_arrow_up.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/button_thin.png", __ASSET__flixel_flixel_ui_img_button_thin_png);
		type.set ("flixel/flixel-ui/img/button_thin.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/button_toggle.png", __ASSET__flixel_flixel_ui_img_button_toggle_png);
		type.set ("flixel/flixel-ui/img/button_toggle.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/check_box.png", __ASSET__flixel_flixel_ui_img_check_box_png);
		type.set ("flixel/flixel-ui/img/check_box.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/check_mark.png", __ASSET__flixel_flixel_ui_img_check_mark_png);
		type.set ("flixel/flixel-ui/img/check_mark.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/chrome.png", __ASSET__flixel_flixel_ui_img_chrome_png);
		type.set ("flixel/flixel-ui/img/chrome.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/chrome_flat.png", __ASSET__flixel_flixel_ui_img_chrome_flat_png);
		type.set ("flixel/flixel-ui/img/chrome_flat.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/chrome_inset.png", __ASSET__flixel_flixel_ui_img_chrome_inset_png);
		type.set ("flixel/flixel-ui/img/chrome_inset.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/chrome_light.png", __ASSET__flixel_flixel_ui_img_chrome_light_png);
		type.set ("flixel/flixel-ui/img/chrome_light.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/dropdown_mark.png", __ASSET__flixel_flixel_ui_img_dropdown_mark_png);
		type.set ("flixel/flixel-ui/img/dropdown_mark.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/finger_big.png", __ASSET__flixel_flixel_ui_img_finger_big_png);
		type.set ("flixel/flixel-ui/img/finger_big.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/finger_small.png", __ASSET__flixel_flixel_ui_img_finger_small_png);
		type.set ("flixel/flixel-ui/img/finger_small.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/hilight.png", __ASSET__flixel_flixel_ui_img_hilight_png);
		type.set ("flixel/flixel-ui/img/hilight.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/invis.png", __ASSET__flixel_flixel_ui_img_invis_png);
		type.set ("flixel/flixel-ui/img/invis.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/minus_mark.png", __ASSET__flixel_flixel_ui_img_minus_mark_png);
		type.set ("flixel/flixel-ui/img/minus_mark.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/plus_mark.png", __ASSET__flixel_flixel_ui_img_plus_mark_png);
		type.set ("flixel/flixel-ui/img/plus_mark.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/radio.png", __ASSET__flixel_flixel_ui_img_radio_png);
		type.set ("flixel/flixel-ui/img/radio.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/radio_dot.png", __ASSET__flixel_flixel_ui_img_radio_dot_png);
		type.set ("flixel/flixel-ui/img/radio_dot.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/swatch.png", __ASSET__flixel_flixel_ui_img_swatch_png);
		type.set ("flixel/flixel-ui/img/swatch.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/tab.png", __ASSET__flixel_flixel_ui_img_tab_png);
		type.set ("flixel/flixel-ui/img/tab.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/img/tab_back.png", __ASSET__flixel_flixel_ui_img_tab_back_png);
		type.set ("flixel/flixel-ui/img/tab_back.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("flixel/flixel-ui/xml/defaults.xml", __ASSET__flixel_flixel_ui_xml_defaults_xml);
		type.set ("flixel/flixel-ui/xml/defaults.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("flixel/flixel-ui/xml/default_loading_screen.xml", __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml);
		type.set ("flixel/flixel-ui/xml/default_loading_screen.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("flixel/flixel-ui/xml/default_popup.xml", __ASSET__flixel_flixel_ui_xml_default_popup_xml);
		type.set ("flixel/flixel-ui/xml/default_popup.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		
		
		#elseif html5
		
		addExternal("assets/data/data-goes-here.txt", "text", "assets/data/data-goes-here.txt");
		addExternal("assets/data/level.tmx", "text", "assets/data/level.tmx");
		addExternal("assets/images/block1.png", "image", "assets/images/block1.png");
		addExternal("assets/images/block2.png", "image", "assets/images/block2.png");
		addExternal("assets/images/block3.png", "image", "assets/images/block3.png");
		addExternal("assets/images/block4.png", "image", "assets/images/block4.png");
		addExternal("assets/images/images-go-here.txt", "text", "assets/images/images-go-here.txt");
		addExternal("assets/images/player_m.png", "image", "assets/images/player_m.png");
		addExternal("assets/images/player_r.png", "image", "assets/images/player_r.png");
		addExternal("assets/images/player_sprite_walk.png", "image", "assets/images/player_sprite_walk.png");
		addExternal("assets/images/test1.ase", "binary", "assets/images/test1.ase");
		addExternal("assets/images/test1.png", "image", "assets/images/test1.png");
		addExternal("assets/images/test2.png", "image", "assets/images/test2.png");
		addExternal("assets/images/test3.png", "image", "assets/images/test3.png");
		addExternal("assets/images/testtileback.ase", "binary", "assets/images/testtileback.ase");
		addExternal("assets/images/Tileground.png", "image", "assets/images/Tileground.png");
		addExternal("assets/images/Tileset_Image.png", "image", "assets/images/Tileset_Image.png");
		addExternal("assets/images/tower.ase", "binary", "assets/images/tower.ase");
		addExternal("assets/images/tower.png", "image", "assets/images/tower.png");
		addExternal("assets/images/tower2.ase", "binary", "assets/images/tower2.ase");
		addExternal("assets/images/tower2.png", "image", "assets/images/tower2.png");
		addExternal("assets/music/audacity.aup", "text", "assets/music/audacity.aup");
		addExternal("assets/music/audacity_data/e00/d00/e0000021.au", "binary", "assets/music/audacity_data/e00/d00/e0000021.au");
		addExternal("assets/music/audacity_data/e00/d00/e000002b.au", "binary", "assets/music/audacity_data/e00/d00/e000002b.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000044.au", "binary", "assets/music/audacity_data/e00/d00/e0000044.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000050.au", "binary", "assets/music/audacity_data/e00/d00/e0000050.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000082.au", "binary", "assets/music/audacity_data/e00/d00/e0000082.au");
		addExternal("assets/music/audacity_data/e00/d00/e00000b3.au", "binary", "assets/music/audacity_data/e00/d00/e00000b3.au");
		addExternal("assets/music/audacity_data/e00/d00/e000012d.au", "binary", "assets/music/audacity_data/e00/d00/e000012d.au");
		addExternal("assets/music/audacity_data/e00/d00/e000018b.au", "binary", "assets/music/audacity_data/e00/d00/e000018b.au");
		addExternal("assets/music/audacity_data/e00/d00/e00001b5.au", "binary", "assets/music/audacity_data/e00/d00/e00001b5.au");
		addExternal("assets/music/audacity_data/e00/d00/e00001f9.au", "binary", "assets/music/audacity_data/e00/d00/e00001f9.au");
		addExternal("assets/music/audacity_data/e00/d00/e000020b.au", "binary", "assets/music/audacity_data/e00/d00/e000020b.au");
		addExternal("assets/music/audacity_data/e00/d00/e000020f.au", "binary", "assets/music/audacity_data/e00/d00/e000020f.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000214.au", "binary", "assets/music/audacity_data/e00/d00/e0000214.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000225.au", "binary", "assets/music/audacity_data/e00/d00/e0000225.au");
		addExternal("assets/music/audacity_data/e00/d00/e000029e.auf", "binary", "assets/music/audacity_data/e00/d00/e000029e.auf");
		addExternal("assets/music/audacity_data/e00/d00/e00002a0.au", "binary", "assets/music/audacity_data/e00/d00/e00002a0.au");
		addExternal("assets/music/audacity_data/e00/d00/e00002b4.au", "binary", "assets/music/audacity_data/e00/d00/e00002b4.au");
		addExternal("assets/music/audacity_data/e00/d00/e00002e3.au", "binary", "assets/music/audacity_data/e00/d00/e00002e3.au");
		addExternal("assets/music/audacity_data/e00/d00/e00002ee.au", "binary", "assets/music/audacity_data/e00/d00/e00002ee.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000308.au", "binary", "assets/music/audacity_data/e00/d00/e0000308.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000338.au", "binary", "assets/music/audacity_data/e00/d00/e0000338.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000347.au", "binary", "assets/music/audacity_data/e00/d00/e0000347.au");
		addExternal("assets/music/audacity_data/e00/d00/e00003d1.au", "binary", "assets/music/audacity_data/e00/d00/e00003d1.au");
		addExternal("assets/music/audacity_data/e00/d00/e00003f7.au", "binary", "assets/music/audacity_data/e00/d00/e00003f7.au");
		addExternal("assets/music/audacity_data/e00/d00/e000041b.au", "binary", "assets/music/audacity_data/e00/d00/e000041b.au");
		addExternal("assets/music/audacity_data/e00/d00/e000043c.au", "binary", "assets/music/audacity_data/e00/d00/e000043c.au");
		addExternal("assets/music/audacity_data/e00/d00/e000047a.au", "binary", "assets/music/audacity_data/e00/d00/e000047a.au");
		addExternal("assets/music/audacity_data/e00/d00/e00004bb.au", "binary", "assets/music/audacity_data/e00/d00/e00004bb.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000558.au", "binary", "assets/music/audacity_data/e00/d00/e0000558.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000572.au", "binary", "assets/music/audacity_data/e00/d00/e0000572.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000589.au", "binary", "assets/music/audacity_data/e00/d00/e0000589.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000592.au", "binary", "assets/music/audacity_data/e00/d00/e0000592.au");
		addExternal("assets/music/audacity_data/e00/d00/e00005c0.au", "binary", "assets/music/audacity_data/e00/d00/e00005c0.au");
		addExternal("assets/music/audacity_data/e00/d00/e00005d8.au", "binary", "assets/music/audacity_data/e00/d00/e00005d8.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000612.au", "binary", "assets/music/audacity_data/e00/d00/e0000612.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000616.au", "binary", "assets/music/audacity_data/e00/d00/e0000616.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000666.au", "binary", "assets/music/audacity_data/e00/d00/e0000666.au");
		addExternal("assets/music/audacity_data/e00/d00/e00006a3.au", "binary", "assets/music/audacity_data/e00/d00/e00006a3.au");
		addExternal("assets/music/audacity_data/e00/d00/e00006c1.au", "binary", "assets/music/audacity_data/e00/d00/e00006c1.au");
		addExternal("assets/music/audacity_data/e00/d00/e00006cc.au", "binary", "assets/music/audacity_data/e00/d00/e00006cc.au");
		addExternal("assets/music/audacity_data/e00/d00/e00006fe.au", "binary", "assets/music/audacity_data/e00/d00/e00006fe.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000726.au", "binary", "assets/music/audacity_data/e00/d00/e0000726.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000727.au", "binary", "assets/music/audacity_data/e00/d00/e0000727.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000733.au", "binary", "assets/music/audacity_data/e00/d00/e0000733.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000772.auf", "binary", "assets/music/audacity_data/e00/d00/e0000772.auf");
		addExternal("assets/music/audacity_data/e00/d00/e0000788.au", "binary", "assets/music/audacity_data/e00/d00/e0000788.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000790.au", "binary", "assets/music/audacity_data/e00/d00/e0000790.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000795.au", "binary", "assets/music/audacity_data/e00/d00/e0000795.au");
		addExternal("assets/music/audacity_data/e00/d00/e00007a9.au", "binary", "assets/music/audacity_data/e00/d00/e00007a9.au");
		addExternal("assets/music/audacity_data/e00/d00/e00007bc.au", "binary", "assets/music/audacity_data/e00/d00/e00007bc.au");
		addExternal("assets/music/audacity_data/e00/d00/e00007c5.au", "binary", "assets/music/audacity_data/e00/d00/e00007c5.au");
		addExternal("assets/music/audacity_data/e00/d00/e000080f.au", "binary", "assets/music/audacity_data/e00/d00/e000080f.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000817.au", "binary", "assets/music/audacity_data/e00/d00/e0000817.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000835.au", "binary", "assets/music/audacity_data/e00/d00/e0000835.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000844.au", "binary", "assets/music/audacity_data/e00/d00/e0000844.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000856.au", "binary", "assets/music/audacity_data/e00/d00/e0000856.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000883.au", "binary", "assets/music/audacity_data/e00/d00/e0000883.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000890.au", "binary", "assets/music/audacity_data/e00/d00/e0000890.au");
		addExternal("assets/music/audacity_data/e00/d00/e00008bc.au", "binary", "assets/music/audacity_data/e00/d00/e00008bc.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000923.au", "binary", "assets/music/audacity_data/e00/d00/e0000923.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000935.au", "binary", "assets/music/audacity_data/e00/d00/e0000935.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000997.au", "binary", "assets/music/audacity_data/e00/d00/e0000997.au");
		addExternal("assets/music/audacity_data/e00/d00/e00009a3.au", "binary", "assets/music/audacity_data/e00/d00/e00009a3.au");
		addExternal("assets/music/audacity_data/e00/d00/e00009ab.au", "binary", "assets/music/audacity_data/e00/d00/e00009ab.au");
		addExternal("assets/music/audacity_data/e00/d00/e00009b4.au", "binary", "assets/music/audacity_data/e00/d00/e00009b4.au");
		addExternal("assets/music/audacity_data/e00/d00/e00009ca.au", "binary", "assets/music/audacity_data/e00/d00/e00009ca.au");
		addExternal("assets/music/audacity_data/e00/d00/e00009f5.au", "binary", "assets/music/audacity_data/e00/d00/e00009f5.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000a22.au", "binary", "assets/music/audacity_data/e00/d00/e0000a22.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000a59.au", "binary", "assets/music/audacity_data/e00/d00/e0000a59.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000a6a.au", "binary", "assets/music/audacity_data/e00/d00/e0000a6a.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000a70.au", "binary", "assets/music/audacity_data/e00/d00/e0000a70.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000ac7.au", "binary", "assets/music/audacity_data/e00/d00/e0000ac7.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000ada.au", "binary", "assets/music/audacity_data/e00/d00/e0000ada.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000b08.au", "binary", "assets/music/audacity_data/e00/d00/e0000b08.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000b21.au", "binary", "assets/music/audacity_data/e00/d00/e0000b21.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000b77.au", "binary", "assets/music/audacity_data/e00/d00/e0000b77.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000bc1.au", "binary", "assets/music/audacity_data/e00/d00/e0000bc1.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000bc6.au", "binary", "assets/music/audacity_data/e00/d00/e0000bc6.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000c64.au", "binary", "assets/music/audacity_data/e00/d00/e0000c64.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000c7e.au", "binary", "assets/music/audacity_data/e00/d00/e0000c7e.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000caa.au", "binary", "assets/music/audacity_data/e00/d00/e0000caa.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000ccd.au", "binary", "assets/music/audacity_data/e00/d00/e0000ccd.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000d10.au", "binary", "assets/music/audacity_data/e00/d00/e0000d10.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000d42.au", "binary", "assets/music/audacity_data/e00/d00/e0000d42.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000da6.au", "binary", "assets/music/audacity_data/e00/d00/e0000da6.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000e2f.au", "binary", "assets/music/audacity_data/e00/d00/e0000e2f.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000ec4.au", "binary", "assets/music/audacity_data/e00/d00/e0000ec4.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000ed8.au", "binary", "assets/music/audacity_data/e00/d00/e0000ed8.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000f02.au", "binary", "assets/music/audacity_data/e00/d00/e0000f02.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000f23.au", "binary", "assets/music/audacity_data/e00/d00/e0000f23.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000f5b.au", "binary", "assets/music/audacity_data/e00/d00/e0000f5b.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000f5e.au", "binary", "assets/music/audacity_data/e00/d00/e0000f5e.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000fa9.au", "binary", "assets/music/audacity_data/e00/d00/e0000fa9.au");
		addExternal("assets/music/audacity_data/e00/d00/e0000fec.au", "binary", "assets/music/audacity_data/e00/d00/e0000fec.au");
		addExternal("assets/music/mort.mp3", "music", "assets/music/mort.mp3");
		addExternal("assets/music/music-goes-here.txt", "text", "assets/music/music-goes-here.txt");
		addExternal("assets/music/teleport.mp3", "music", "assets/music/teleport.mp3");
		addExternal("assets/music/win.mp3", "music", "assets/music/win.mp3");
		addExternal("assets/sounds/sounds-go-here.txt", "text", "assets/sounds/sounds-go-here.txt");
		addExternal("assets/xml/end_state.xml", "text", "assets/xml/end_state.xml");
		addExternal("assets/xml/game_state.xml", "text", "assets/xml/game_state.xml");
		addExternal("assets/xml/menu_state.xml", "text", "assets/xml/menu_state.xml");
		addExternal("assets/sounds/beep.mp3", "music", "assets/sounds/beep.mp3");
		addExternal("assets/sounds/flixel.mp3", "music", "assets/sounds/flixel.mp3");
		addExternal("flixel/flixel-ui/img/box.png", "image", "flixel/flixel-ui/img/box.png");
		addExternal("flixel/flixel-ui/img/button.png", "image", "flixel/flixel-ui/img/button.png");
		addExternal("flixel/flixel-ui/img/button_arrow_down.png", "image", "flixel/flixel-ui/img/button_arrow_down.png");
		addExternal("flixel/flixel-ui/img/button_arrow_left.png", "image", "flixel/flixel-ui/img/button_arrow_left.png");
		addExternal("flixel/flixel-ui/img/button_arrow_right.png", "image", "flixel/flixel-ui/img/button_arrow_right.png");
		addExternal("flixel/flixel-ui/img/button_arrow_up.png", "image", "flixel/flixel-ui/img/button_arrow_up.png");
		addExternal("flixel/flixel-ui/img/button_thin.png", "image", "flixel/flixel-ui/img/button_thin.png");
		addExternal("flixel/flixel-ui/img/button_toggle.png", "image", "flixel/flixel-ui/img/button_toggle.png");
		addExternal("flixel/flixel-ui/img/check_box.png", "image", "flixel/flixel-ui/img/check_box.png");
		addExternal("flixel/flixel-ui/img/check_mark.png", "image", "flixel/flixel-ui/img/check_mark.png");
		addExternal("flixel/flixel-ui/img/chrome.png", "image", "flixel/flixel-ui/img/chrome.png");
		addExternal("flixel/flixel-ui/img/chrome_flat.png", "image", "flixel/flixel-ui/img/chrome_flat.png");
		addExternal("flixel/flixel-ui/img/chrome_inset.png", "image", "flixel/flixel-ui/img/chrome_inset.png");
		addExternal("flixel/flixel-ui/img/chrome_light.png", "image", "flixel/flixel-ui/img/chrome_light.png");
		addExternal("flixel/flixel-ui/img/dropdown_mark.png", "image", "flixel/flixel-ui/img/dropdown_mark.png");
		addExternal("flixel/flixel-ui/img/finger_big.png", "image", "flixel/flixel-ui/img/finger_big.png");
		addExternal("flixel/flixel-ui/img/finger_small.png", "image", "flixel/flixel-ui/img/finger_small.png");
		addExternal("flixel/flixel-ui/img/hilight.png", "image", "flixel/flixel-ui/img/hilight.png");
		addExternal("flixel/flixel-ui/img/invis.png", "image", "flixel/flixel-ui/img/invis.png");
		addExternal("flixel/flixel-ui/img/minus_mark.png", "image", "flixel/flixel-ui/img/minus_mark.png");
		addExternal("flixel/flixel-ui/img/plus_mark.png", "image", "flixel/flixel-ui/img/plus_mark.png");
		addExternal("flixel/flixel-ui/img/radio.png", "image", "flixel/flixel-ui/img/radio.png");
		addExternal("flixel/flixel-ui/img/radio_dot.png", "image", "flixel/flixel-ui/img/radio_dot.png");
		addExternal("flixel/flixel-ui/img/swatch.png", "image", "flixel/flixel-ui/img/swatch.png");
		addExternal("flixel/flixel-ui/img/tab.png", "image", "flixel/flixel-ui/img/tab.png");
		addExternal("flixel/flixel-ui/img/tab_back.png", "image", "flixel/flixel-ui/img/tab_back.png");
		addExternal("flixel/flixel-ui/xml/defaults.xml", "text", "flixel/flixel-ui/xml/defaults.xml");
		addExternal("flixel/flixel-ui/xml/default_loading_screen.xml", "text", "flixel/flixel-ui/xml/default_loading_screen.xml");
		addExternal("flixel/flixel-ui/xml/default_popup.xml", "text", "flixel/flixel-ui/xml/default_popup.xml");
		
		
		#else
		
		#if (windows || mac || linux)
		
		var loadManifest = false;
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("assets/data/level.tmx", __ASSET__assets_data_level_tmx);
		type.set ("assets/data/level.tmx", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("assets/images/block1.png", __ASSET__assets_images_block1_png);
		type.set ("assets/images/block1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/block2.png", __ASSET__assets_images_block2_png);
		type.set ("assets/images/block2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/block3.png", __ASSET__assets_images_block3_png);
		type.set ("assets/images/block3.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/block4.png", __ASSET__assets_images_block4_png);
		type.set ("assets/images/block4.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("assets/images/player_m.png", __ASSET__assets_images_player_m_png);
		type.set ("assets/images/player_m.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/player_r.png", __ASSET__assets_images_player_r_png);
		type.set ("assets/images/player_r.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/player_sprite_walk.png", __ASSET__assets_images_player_sprite_walk_png);
		type.set ("assets/images/player_sprite_walk.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/test1.ase", __ASSET__assets_images_test1_ase);
		type.set ("assets/images/test1.ase", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/images/test1.png", __ASSET__assets_images_test1_png);
		type.set ("assets/images/test1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/test2.png", __ASSET__assets_images_test2_png);
		type.set ("assets/images/test2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/test3.png", __ASSET__assets_images_test3_png);
		type.set ("assets/images/test3.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/testtileback.ase", __ASSET__assets_images_testtileback_ase);
		type.set ("assets/images/testtileback.ase", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/images/Tileground.png", __ASSET__assets_images_tileground_png);
		type.set ("assets/images/Tileground.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/Tileset_Image.png", __ASSET__assets_images_tileset_image_png);
		type.set ("assets/images/Tileset_Image.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/tower.ase", __ASSET__assets_images_tower_ase);
		type.set ("assets/images/tower.ase", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/images/tower.png", __ASSET__assets_images_tower_png);
		type.set ("assets/images/tower.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/tower2.ase", __ASSET__assets_images_tower2_ase);
		type.set ("assets/images/tower2.ase", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/images/tower2.png", __ASSET__assets_images_tower2_png);
		type.set ("assets/images/tower2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/music/audacity.aup", __ASSET__assets_music_audacity_aup);
		type.set ("assets/music/audacity.aup", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000021.au", __ASSET__assets_music_audacity_data_e00_d00_e0000021_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000021.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e000002b.au", __ASSET__assets_music_audacity_data_e00_d00_e000002b_au);
		type.set ("assets/music/audacity_data/e00/d00/e000002b.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000044.au", __ASSET__assets_music_audacity_data_e00_d00_e0000044_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000044.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000050.au", __ASSET__assets_music_audacity_data_e00_d00_e0000050_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000050.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000082.au", __ASSET__assets_music_audacity_data_e00_d00_e0000082_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000082.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e00000b3.au", __ASSET__assets_music_audacity_data_e00_d00_e00000b3_au);
		type.set ("assets/music/audacity_data/e00/d00/e00000b3.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e000012d.au", __ASSET__assets_music_audacity_data_e00_d00_e000012d_au);
		type.set ("assets/music/audacity_data/e00/d00/e000012d.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e000018b.au", __ASSET__assets_music_audacity_data_e00_d00_e000018b_au);
		type.set ("assets/music/audacity_data/e00/d00/e000018b.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e00001b5.au", __ASSET__assets_music_audacity_data_e00_d00_e00001b5_au);
		type.set ("assets/music/audacity_data/e00/d00/e00001b5.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e00001f9.au", __ASSET__assets_music_audacity_data_e00_d00_e00001f9_au);
		type.set ("assets/music/audacity_data/e00/d00/e00001f9.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e000020b.au", __ASSET__assets_music_audacity_data_e00_d00_e000020b_au);
		type.set ("assets/music/audacity_data/e00/d00/e000020b.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e000020f.au", __ASSET__assets_music_audacity_data_e00_d00_e000020f_au);
		type.set ("assets/music/audacity_data/e00/d00/e000020f.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000214.au", __ASSET__assets_music_audacity_data_e00_d00_e0000214_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000214.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000225.au", __ASSET__assets_music_audacity_data_e00_d00_e0000225_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000225.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e000029e.auf", __ASSET__assets_music_audacity_data_e00_d00_e000029e_auf);
		type.set ("assets/music/audacity_data/e00/d00/e000029e.auf", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e00002a0.au", __ASSET__assets_music_audacity_data_e00_d00_e00002a0_au);
		type.set ("assets/music/audacity_data/e00/d00/e00002a0.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e00002b4.au", __ASSET__assets_music_audacity_data_e00_d00_e00002b4_au);
		type.set ("assets/music/audacity_data/e00/d00/e00002b4.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e00002e3.au", __ASSET__assets_music_audacity_data_e00_d00_e00002e3_au);
		type.set ("assets/music/audacity_data/e00/d00/e00002e3.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e00002ee.au", __ASSET__assets_music_audacity_data_e00_d00_e00002ee_au);
		type.set ("assets/music/audacity_data/e00/d00/e00002ee.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000308.au", __ASSET__assets_music_audacity_data_e00_d00_e0000308_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000308.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000338.au", __ASSET__assets_music_audacity_data_e00_d00_e0000338_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000338.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000347.au", __ASSET__assets_music_audacity_data_e00_d00_e0000347_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000347.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e00003d1.au", __ASSET__assets_music_audacity_data_e00_d00_e00003d1_au);
		type.set ("assets/music/audacity_data/e00/d00/e00003d1.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e00003f7.au", __ASSET__assets_music_audacity_data_e00_d00_e00003f7_au);
		type.set ("assets/music/audacity_data/e00/d00/e00003f7.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e000041b.au", __ASSET__assets_music_audacity_data_e00_d00_e000041b_au);
		type.set ("assets/music/audacity_data/e00/d00/e000041b.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e000043c.au", __ASSET__assets_music_audacity_data_e00_d00_e000043c_au);
		type.set ("assets/music/audacity_data/e00/d00/e000043c.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e000047a.au", __ASSET__assets_music_audacity_data_e00_d00_e000047a_au);
		type.set ("assets/music/audacity_data/e00/d00/e000047a.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e00004bb.au", __ASSET__assets_music_audacity_data_e00_d00_e00004bb_au);
		type.set ("assets/music/audacity_data/e00/d00/e00004bb.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000558.au", __ASSET__assets_music_audacity_data_e00_d00_e0000558_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000558.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000572.au", __ASSET__assets_music_audacity_data_e00_d00_e0000572_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000572.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000589.au", __ASSET__assets_music_audacity_data_e00_d00_e0000589_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000589.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000592.au", __ASSET__assets_music_audacity_data_e00_d00_e0000592_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000592.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e00005c0.au", __ASSET__assets_music_audacity_data_e00_d00_e00005c0_au);
		type.set ("assets/music/audacity_data/e00/d00/e00005c0.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e00005d8.au", __ASSET__assets_music_audacity_data_e00_d00_e00005d8_au);
		type.set ("assets/music/audacity_data/e00/d00/e00005d8.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000612.au", __ASSET__assets_music_audacity_data_e00_d00_e0000612_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000612.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000616.au", __ASSET__assets_music_audacity_data_e00_d00_e0000616_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000616.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000666.au", __ASSET__assets_music_audacity_data_e00_d00_e0000666_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000666.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e00006a3.au", __ASSET__assets_music_audacity_data_e00_d00_e00006a3_au);
		type.set ("assets/music/audacity_data/e00/d00/e00006a3.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e00006c1.au", __ASSET__assets_music_audacity_data_e00_d00_e00006c1_au);
		type.set ("assets/music/audacity_data/e00/d00/e00006c1.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e00006cc.au", __ASSET__assets_music_audacity_data_e00_d00_e00006cc_au);
		type.set ("assets/music/audacity_data/e00/d00/e00006cc.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e00006fe.au", __ASSET__assets_music_audacity_data_e00_d00_e00006fe_au);
		type.set ("assets/music/audacity_data/e00/d00/e00006fe.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000726.au", __ASSET__assets_music_audacity_data_e00_d00_e0000726_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000726.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000727.au", __ASSET__assets_music_audacity_data_e00_d00_e0000727_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000727.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000733.au", __ASSET__assets_music_audacity_data_e00_d00_e0000733_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000733.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000772.auf", __ASSET__assets_music_audacity_data_e00_d00_e0000772_auf);
		type.set ("assets/music/audacity_data/e00/d00/e0000772.auf", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000788.au", __ASSET__assets_music_audacity_data_e00_d00_e0000788_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000788.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000790.au", __ASSET__assets_music_audacity_data_e00_d00_e0000790_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000790.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000795.au", __ASSET__assets_music_audacity_data_e00_d00_e0000795_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000795.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e00007a9.au", __ASSET__assets_music_audacity_data_e00_d00_e00007a9_au);
		type.set ("assets/music/audacity_data/e00/d00/e00007a9.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e00007bc.au", __ASSET__assets_music_audacity_data_e00_d00_e00007bc_au);
		type.set ("assets/music/audacity_data/e00/d00/e00007bc.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e00007c5.au", __ASSET__assets_music_audacity_data_e00_d00_e00007c5_au);
		type.set ("assets/music/audacity_data/e00/d00/e00007c5.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e000080f.au", __ASSET__assets_music_audacity_data_e00_d00_e000080f_au);
		type.set ("assets/music/audacity_data/e00/d00/e000080f.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000817.au", __ASSET__assets_music_audacity_data_e00_d00_e0000817_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000817.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000835.au", __ASSET__assets_music_audacity_data_e00_d00_e0000835_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000835.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000844.au", __ASSET__assets_music_audacity_data_e00_d00_e0000844_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000844.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000856.au", __ASSET__assets_music_audacity_data_e00_d00_e0000856_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000856.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000883.au", __ASSET__assets_music_audacity_data_e00_d00_e0000883_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000883.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000890.au", __ASSET__assets_music_audacity_data_e00_d00_e0000890_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000890.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e00008bc.au", __ASSET__assets_music_audacity_data_e00_d00_e00008bc_au);
		type.set ("assets/music/audacity_data/e00/d00/e00008bc.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000923.au", __ASSET__assets_music_audacity_data_e00_d00_e0000923_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000923.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000935.au", __ASSET__assets_music_audacity_data_e00_d00_e0000935_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000935.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000997.au", __ASSET__assets_music_audacity_data_e00_d00_e0000997_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000997.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e00009a3.au", __ASSET__assets_music_audacity_data_e00_d00_e00009a3_au);
		type.set ("assets/music/audacity_data/e00/d00/e00009a3.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e00009ab.au", __ASSET__assets_music_audacity_data_e00_d00_e00009ab_au);
		type.set ("assets/music/audacity_data/e00/d00/e00009ab.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e00009b4.au", __ASSET__assets_music_audacity_data_e00_d00_e00009b4_au);
		type.set ("assets/music/audacity_data/e00/d00/e00009b4.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e00009ca.au", __ASSET__assets_music_audacity_data_e00_d00_e00009ca_au);
		type.set ("assets/music/audacity_data/e00/d00/e00009ca.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e00009f5.au", __ASSET__assets_music_audacity_data_e00_d00_e00009f5_au);
		type.set ("assets/music/audacity_data/e00/d00/e00009f5.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000a22.au", __ASSET__assets_music_audacity_data_e00_d00_e0000a22_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000a22.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000a59.au", __ASSET__assets_music_audacity_data_e00_d00_e0000a59_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000a59.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000a6a.au", __ASSET__assets_music_audacity_data_e00_d00_e0000a6a_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000a6a.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000a70.au", __ASSET__assets_music_audacity_data_e00_d00_e0000a70_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000a70.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000ac7.au", __ASSET__assets_music_audacity_data_e00_d00_e0000ac7_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000ac7.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000ada.au", __ASSET__assets_music_audacity_data_e00_d00_e0000ada_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000ada.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000b08.au", __ASSET__assets_music_audacity_data_e00_d00_e0000b08_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000b08.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000b21.au", __ASSET__assets_music_audacity_data_e00_d00_e0000b21_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000b21.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000b77.au", __ASSET__assets_music_audacity_data_e00_d00_e0000b77_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000b77.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000bc1.au", __ASSET__assets_music_audacity_data_e00_d00_e0000bc1_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000bc1.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000bc6.au", __ASSET__assets_music_audacity_data_e00_d00_e0000bc6_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000bc6.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000c64.au", __ASSET__assets_music_audacity_data_e00_d00_e0000c64_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000c64.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000c7e.au", __ASSET__assets_music_audacity_data_e00_d00_e0000c7e_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000c7e.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000caa.au", __ASSET__assets_music_audacity_data_e00_d00_e0000caa_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000caa.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000ccd.au", __ASSET__assets_music_audacity_data_e00_d00_e0000ccd_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000ccd.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000d10.au", __ASSET__assets_music_audacity_data_e00_d00_e0000d10_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000d10.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000d42.au", __ASSET__assets_music_audacity_data_e00_d00_e0000d42_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000d42.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000da6.au", __ASSET__assets_music_audacity_data_e00_d00_e0000da6_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000da6.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000e2f.au", __ASSET__assets_music_audacity_data_e00_d00_e0000e2f_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000e2f.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000ec4.au", __ASSET__assets_music_audacity_data_e00_d00_e0000ec4_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000ec4.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000ed8.au", __ASSET__assets_music_audacity_data_e00_d00_e0000ed8_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000ed8.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000f02.au", __ASSET__assets_music_audacity_data_e00_d00_e0000f02_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000f02.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000f23.au", __ASSET__assets_music_audacity_data_e00_d00_e0000f23_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000f23.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000f5b.au", __ASSET__assets_music_audacity_data_e00_d00_e0000f5b_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000f5b.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000f5e.au", __ASSET__assets_music_audacity_data_e00_d00_e0000f5e_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000f5e.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000fa9.au", __ASSET__assets_music_audacity_data_e00_d00_e0000fa9_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000fa9.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/audacity_data/e00/d00/e0000fec.au", __ASSET__assets_music_audacity_data_e00_d00_e0000fec_au);
		type.set ("assets/music/audacity_data/e00/d00/e0000fec.au", Reflect.field (AssetType, "binary".toUpperCase ()));
		
		className.set ("assets/music/mort.mp3", __ASSET__assets_music_mort_mp3);
		type.set ("assets/music/mort.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("assets/music/teleport.mp3", __ASSET__assets_music_teleport_mp3);
		type.set ("assets/music/teleport.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		
		className.set ("assets/music/win.mp3", __ASSET__assets_music_win_mp3);
		type.set ("assets/music/win.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("assets/xml/end_state.xml", __ASSET__assets_xml_end_state_xml);
		type.set ("assets/xml/end_state.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("assets/xml/game_state.xml", __ASSET__assets_xml_game_state_xml);
		type.set ("assets/xml/game_state.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("assets/xml/menu_state.xml", __ASSET__assets_xml_menu_state_xml);
		type.set ("assets/xml/menu_state.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/box.png", __ASSET__flixel_flixel_ui_img_box_png);
		type.set ("flixel/flixel-ui/img/box.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/button.png", __ASSET__flixel_flixel_ui_img_button_png);
		type.set ("flixel/flixel-ui/img/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/button_arrow_down.png", __ASSET__flixel_flixel_ui_img_button_arrow_down_png);
		type.set ("flixel/flixel-ui/img/button_arrow_down.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/button_arrow_left.png", __ASSET__flixel_flixel_ui_img_button_arrow_left_png);
		type.set ("flixel/flixel-ui/img/button_arrow_left.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/button_arrow_right.png", __ASSET__flixel_flixel_ui_img_button_arrow_right_png);
		type.set ("flixel/flixel-ui/img/button_arrow_right.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/button_arrow_up.png", __ASSET__flixel_flixel_ui_img_button_arrow_up_png);
		type.set ("flixel/flixel-ui/img/button_arrow_up.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/button_thin.png", __ASSET__flixel_flixel_ui_img_button_thin_png);
		type.set ("flixel/flixel-ui/img/button_thin.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/button_toggle.png", __ASSET__flixel_flixel_ui_img_button_toggle_png);
		type.set ("flixel/flixel-ui/img/button_toggle.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/check_box.png", __ASSET__flixel_flixel_ui_img_check_box_png);
		type.set ("flixel/flixel-ui/img/check_box.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/check_mark.png", __ASSET__flixel_flixel_ui_img_check_mark_png);
		type.set ("flixel/flixel-ui/img/check_mark.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/chrome.png", __ASSET__flixel_flixel_ui_img_chrome_png);
		type.set ("flixel/flixel-ui/img/chrome.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/chrome_flat.png", __ASSET__flixel_flixel_ui_img_chrome_flat_png);
		type.set ("flixel/flixel-ui/img/chrome_flat.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/chrome_inset.png", __ASSET__flixel_flixel_ui_img_chrome_inset_png);
		type.set ("flixel/flixel-ui/img/chrome_inset.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/chrome_light.png", __ASSET__flixel_flixel_ui_img_chrome_light_png);
		type.set ("flixel/flixel-ui/img/chrome_light.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/dropdown_mark.png", __ASSET__flixel_flixel_ui_img_dropdown_mark_png);
		type.set ("flixel/flixel-ui/img/dropdown_mark.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/finger_big.png", __ASSET__flixel_flixel_ui_img_finger_big_png);
		type.set ("flixel/flixel-ui/img/finger_big.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/finger_small.png", __ASSET__flixel_flixel_ui_img_finger_small_png);
		type.set ("flixel/flixel-ui/img/finger_small.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/hilight.png", __ASSET__flixel_flixel_ui_img_hilight_png);
		type.set ("flixel/flixel-ui/img/hilight.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/invis.png", __ASSET__flixel_flixel_ui_img_invis_png);
		type.set ("flixel/flixel-ui/img/invis.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/minus_mark.png", __ASSET__flixel_flixel_ui_img_minus_mark_png);
		type.set ("flixel/flixel-ui/img/minus_mark.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/plus_mark.png", __ASSET__flixel_flixel_ui_img_plus_mark_png);
		type.set ("flixel/flixel-ui/img/plus_mark.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/radio.png", __ASSET__flixel_flixel_ui_img_radio_png);
		type.set ("flixel/flixel-ui/img/radio.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/radio_dot.png", __ASSET__flixel_flixel_ui_img_radio_dot_png);
		type.set ("flixel/flixel-ui/img/radio_dot.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/swatch.png", __ASSET__flixel_flixel_ui_img_swatch_png);
		type.set ("flixel/flixel-ui/img/swatch.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/tab.png", __ASSET__flixel_flixel_ui_img_tab_png);
		type.set ("flixel/flixel-ui/img/tab.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/img/tab_back.png", __ASSET__flixel_flixel_ui_img_tab_back_png);
		type.set ("flixel/flixel-ui/img/tab_back.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/xml/defaults.xml", __ASSET__flixel_flixel_ui_xml_defaults_xml);
		type.set ("flixel/flixel-ui/xml/defaults.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/xml/default_loading_screen.xml", __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml);
		type.set ("flixel/flixel-ui/xml/default_loading_screen.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("flixel/flixel-ui/xml/default_popup.xml", __ASSET__flixel_flixel_ui_xml_default_popup_xml);
		type.set ("flixel/flixel-ui/xml/default_popup.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		
		
		#else
		
		var loadManifest = true;
		
		#end
		
		if (loadManifest) {
			try {
				
				#if blackberry
				var bytes = ByteArray.readFile ("app/native/manifest");
				#elseif tizen
				var bytes = ByteArray.readFile ("../res/manifest");
				#elseif emscripten
				var bytes = ByteArray.readFile ("assets/manifest");
				#else
				var bytes = ByteArray.readFile ("manifest");
				#end
				
				if (bytes != null) {
					
					bytes.position = 0;
					
					if (bytes.length > 0) {
						
						var data = bytes.readUTFBytes (bytes.length);
						
						if (data != null && data.length > 0) {
							
							var manifest:Array<AssetData> = Unserializer.run (data);
							
							for (asset in manifest) {
								
								if (!className.exists(asset.id)) {
									
									path.set (asset.id, asset.path);
									type.set (asset.id, asset.type);
									
								}
							}
						
						}
					
					}
				
				} else {
				
					trace ("Warning: Could not load asset manifest");
				
				}
			
			} catch (e:Dynamic) {
			
				trace ("Warning: Could not load asset manifest");
			
			}
		
		}
		
		#end
		
	}
	
	
	#if html5
	private function addEmbed(id:String, kind:String, value:Dynamic):Void {
		className.set(id, value);
		type.set(id, Reflect.field(AssetType, kind.toUpperCase()));
	}
	
	
	private function addExternal(id:String, kind:String, value:String):Void {
		path.set(id, value);
		type.set(id, Reflect.field(AssetType, kind.toUpperCase()));
	}
	#end
	
	
	public override function exists (id:String, type:AssetType):Bool {
		
		var assetType = DefaultAssetLibrary.type.get (id);
		
		#if pixi
		
		if (assetType == IMAGE) {
			
			return true;
			
		} else {
			
			return false;
			
		}
		
		#end
		
		if (assetType != null) {
			
			if (assetType == type || ((type == SOUND || type == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if ((assetType == BINARY || assetType == TEXT) && type == BINARY) {
				
				return true;
				
			} else if (path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (type == BINARY || type == null) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getBitmapData (id:String):BitmapData {
		
		#if pixi
		
		return BitmapData.fromImage (path.get (id));
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), BitmapData);
		
		#elseif openfl_html5
		
		return BitmapData.fromImage (ApplicationMain.images.get (path.get (id)));
		
		#elseif js
		
		return cast (ApplicationMain.loaders.get (path.get (id)).contentLoaderInfo.content, Bitmap).bitmapData;
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), BitmapData);
		else return BitmapData.load (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if pixi
		
		return null;
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif openfl_html5
		
		return null;
		
		#elseif js
		
		var bytes:ByteArray = null;
		var data = ApplicationMain.urlLoaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}

		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if pixi
		
		return null;
		
		#elseif (flash || js)
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists(id)) {
			var fontClass = className.get(id);
			Font.registerFont(fontClass);
			return cast (Type.createInstance (fontClass, []), Font);
		} else return new Font (path.get (id));
		
		#end
		
	}
	
	
	public override function getMusic (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		var sound = new Sound ();
		sound.__buffer = true;
		sound.load (new URLRequest (path.get (id)));
		return sound; 
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}
	
	
	public override function getPath (id:String):String {
		
		#if ios
		
		return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		#else
		
		return path.get (id);
		
		#end
		
	}
	
	
	public override function getSound (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		else return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
		
		#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if js
		
		var bytes:ByteArray = null;
		var data = ApplicationMain.urlLoaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:AssetType):Bool {
		
		#if flash
		
		if (type != AssetType.MUSIC && type != AssetType.SOUND) {
			
			return className.exists (id);
			
		}
		
		#end
		
		return true;
		
	}
	
	
	public override function loadBitmapData (id:String, handler:BitmapData -> Void):Void {
		
		#if pixi
		
		handler (getBitmapData (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBitmapData (id));
			
		}
		
		#else
		
		handler (getBitmapData (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if pixi
		
		handler (getBytes (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadFont (id:String, handler:Font -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getFont (id));
			
		//}
		
		#else
		
		handler (getFont (id));
		
		#end
		
	}
	
	
	public override function loadMusic (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}
	
	
	public override function loadSound (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getSound (id));
			
		//}
		
		#else
		
		handler (getSound (id));
		
		#end
		
	}
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		#if js
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (event.currentTarget.data);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}
		
		#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		#end
		
	}
	
	
}


#if pixi
#elseif flash

@:keep class __ASSET__assets_data_data_goes_here_txt extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_data_level_tmx extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_images_block1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_block2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_block3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_block4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_images_go_here_txt extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_images_player_m_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_player_r_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_player_sprite_walk_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_test1_ase extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_images_test1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_test2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_test3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_testtileback_ase extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_images_tileground_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_tileset_image_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_tower_ase extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_images_tower_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_tower2_ase extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_images_tower2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_music_audacity_aup extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000021_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e000002b_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000044_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000050_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000082_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e00000b3_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e000012d_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e000018b_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e00001b5_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e00001f9_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e000020b_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e000020f_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000214_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000225_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e000029e_auf extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e00002a0_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e00002b4_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e00002e3_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e00002ee_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000308_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000338_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000347_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e00003d1_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e00003f7_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e000041b_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e000043c_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e000047a_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e00004bb_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000558_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000572_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000589_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000592_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e00005c0_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e00005d8_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000612_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000616_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000666_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e00006a3_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e00006c1_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e00006cc_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e00006fe_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000726_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000727_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000733_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000772_auf extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000788_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000790_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000795_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e00007a9_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e00007bc_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e00007c5_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e000080f_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000817_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000835_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000844_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000856_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000883_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000890_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e00008bc_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000923_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000935_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000997_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e00009a3_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e00009ab_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e00009b4_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e00009ca_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e00009f5_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000a22_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000a59_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000a6a_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000a70_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000ac7_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000ada_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000b08_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000b21_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000b77_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000bc1_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000bc6_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000c64_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000c7e_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000caa_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000ccd_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000d10_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000d42_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000da6_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000e2f_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000ec4_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000ed8_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000f02_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000f23_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000f5b_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000f5e_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000fa9_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_audacity_data_e00_d00_e0000fec_au extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_mort_mp3 extends flash.media.Sound { }
@:keep class __ASSET__assets_music_music_goes_here_txt extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_music_teleport_mp3 extends flash.media.Sound { }
@:keep class __ASSET__assets_music_win_mp3 extends flash.media.Sound { }
@:keep class __ASSET__assets_sounds_sounds_go_here_txt extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_xml_end_state_xml extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_xml_game_state_xml extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_xml_menu_state_xml extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_sounds_beep_mp3 extends flash.media.Sound { }
@:keep class __ASSET__assets_sounds_flixel_mp3 extends flash.media.Sound { }
@:keep class __ASSET__flixel_flixel_ui_img_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_button_arrow_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_button_arrow_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_button_arrow_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_button_arrow_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_button_thin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_button_toggle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_check_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_check_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_chrome_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_chrome_flat_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_chrome_inset_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_chrome_light_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_dropdown_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_finger_big_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_finger_small_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_hilight_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_invis_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_minus_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_plus_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_radio_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_radio_dot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_swatch_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_tab_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_img_tab_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__flixel_flixel_ui_xml_defaults_xml extends flash.utils.ByteArray { }
@:keep class __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml extends flash.utils.ByteArray { }
@:keep class __ASSET__flixel_flixel_ui_xml_default_popup_xml extends flash.utils.ByteArray { }


#elseif html5






























































































































































#elseif (windows || mac || linux)


@:file("assets/data/data-goes-here.txt") class __ASSET__assets_data_data_goes_here_txt extends flash.utils.ByteArray {}
@:file("assets/data/level.tmx") class __ASSET__assets_data_level_tmx extends flash.utils.ByteArray {}
@:bitmap("assets/images/block1.png") class __ASSET__assets_images_block1_png extends flash.display.BitmapData {}
@:bitmap("assets/images/block2.png") class __ASSET__assets_images_block2_png extends flash.display.BitmapData {}
@:bitmap("assets/images/block3.png") class __ASSET__assets_images_block3_png extends flash.display.BitmapData {}
@:bitmap("assets/images/block4.png") class __ASSET__assets_images_block4_png extends flash.display.BitmapData {}
@:file("assets/images/images-go-here.txt") class __ASSET__assets_images_images_go_here_txt extends flash.utils.ByteArray {}
@:bitmap("assets/images/player_m.png") class __ASSET__assets_images_player_m_png extends flash.display.BitmapData {}
@:bitmap("assets/images/player_r.png") class __ASSET__assets_images_player_r_png extends flash.display.BitmapData {}
@:bitmap("assets/images/player_sprite_walk.png") class __ASSET__assets_images_player_sprite_walk_png extends flash.display.BitmapData {}
@:file("assets/images/test1.ase") class __ASSET__assets_images_test1_ase extends flash.utils.ByteArray {}
@:bitmap("assets/images/test1.png") class __ASSET__assets_images_test1_png extends flash.display.BitmapData {}
@:bitmap("assets/images/test2.png") class __ASSET__assets_images_test2_png extends flash.display.BitmapData {}
@:bitmap("assets/images/test3.png") class __ASSET__assets_images_test3_png extends flash.display.BitmapData {}
@:file("assets/images/testtileback.ase") class __ASSET__assets_images_testtileback_ase extends flash.utils.ByteArray {}
@:bitmap("assets/images/Tileground.png") class __ASSET__assets_images_tileground_png extends flash.display.BitmapData {}
@:bitmap("assets/images/Tileset_Image.png") class __ASSET__assets_images_tileset_image_png extends flash.display.BitmapData {}
@:file("assets/images/tower.ase") class __ASSET__assets_images_tower_ase extends flash.utils.ByteArray {}
@:bitmap("assets/images/tower.png") class __ASSET__assets_images_tower_png extends flash.display.BitmapData {}
@:file("assets/images/tower2.ase") class __ASSET__assets_images_tower2_ase extends flash.utils.ByteArray {}
@:bitmap("assets/images/tower2.png") class __ASSET__assets_images_tower2_png extends flash.display.BitmapData {}
@:file("assets/music/audacity.aup") class __ASSET__assets_music_audacity_aup extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000021.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000021_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e000002b.au") class __ASSET__assets_music_audacity_data_e00_d00_e000002b_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000044.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000044_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000050.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000050_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000082.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000082_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e00000b3.au") class __ASSET__assets_music_audacity_data_e00_d00_e00000b3_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e000012d.au") class __ASSET__assets_music_audacity_data_e00_d00_e000012d_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e000018b.au") class __ASSET__assets_music_audacity_data_e00_d00_e000018b_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e00001b5.au") class __ASSET__assets_music_audacity_data_e00_d00_e00001b5_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e00001f9.au") class __ASSET__assets_music_audacity_data_e00_d00_e00001f9_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e000020b.au") class __ASSET__assets_music_audacity_data_e00_d00_e000020b_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e000020f.au") class __ASSET__assets_music_audacity_data_e00_d00_e000020f_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000214.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000214_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000225.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000225_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e000029e.auf") class __ASSET__assets_music_audacity_data_e00_d00_e000029e_auf extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e00002a0.au") class __ASSET__assets_music_audacity_data_e00_d00_e00002a0_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e00002b4.au") class __ASSET__assets_music_audacity_data_e00_d00_e00002b4_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e00002e3.au") class __ASSET__assets_music_audacity_data_e00_d00_e00002e3_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e00002ee.au") class __ASSET__assets_music_audacity_data_e00_d00_e00002ee_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000308.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000308_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000338.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000338_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000347.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000347_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e00003d1.au") class __ASSET__assets_music_audacity_data_e00_d00_e00003d1_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e00003f7.au") class __ASSET__assets_music_audacity_data_e00_d00_e00003f7_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e000041b.au") class __ASSET__assets_music_audacity_data_e00_d00_e000041b_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e000043c.au") class __ASSET__assets_music_audacity_data_e00_d00_e000043c_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e000047a.au") class __ASSET__assets_music_audacity_data_e00_d00_e000047a_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e00004bb.au") class __ASSET__assets_music_audacity_data_e00_d00_e00004bb_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000558.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000558_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000572.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000572_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000589.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000589_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000592.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000592_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e00005c0.au") class __ASSET__assets_music_audacity_data_e00_d00_e00005c0_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e00005d8.au") class __ASSET__assets_music_audacity_data_e00_d00_e00005d8_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000612.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000612_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000616.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000616_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000666.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000666_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e00006a3.au") class __ASSET__assets_music_audacity_data_e00_d00_e00006a3_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e00006c1.au") class __ASSET__assets_music_audacity_data_e00_d00_e00006c1_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e00006cc.au") class __ASSET__assets_music_audacity_data_e00_d00_e00006cc_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e00006fe.au") class __ASSET__assets_music_audacity_data_e00_d00_e00006fe_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000726.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000726_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000727.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000727_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000733.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000733_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000772.auf") class __ASSET__assets_music_audacity_data_e00_d00_e0000772_auf extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000788.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000788_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000790.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000790_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000795.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000795_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e00007a9.au") class __ASSET__assets_music_audacity_data_e00_d00_e00007a9_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e00007bc.au") class __ASSET__assets_music_audacity_data_e00_d00_e00007bc_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e00007c5.au") class __ASSET__assets_music_audacity_data_e00_d00_e00007c5_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e000080f.au") class __ASSET__assets_music_audacity_data_e00_d00_e000080f_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000817.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000817_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000835.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000835_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000844.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000844_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000856.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000856_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000883.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000883_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000890.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000890_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e00008bc.au") class __ASSET__assets_music_audacity_data_e00_d00_e00008bc_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000923.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000923_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000935.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000935_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000997.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000997_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e00009a3.au") class __ASSET__assets_music_audacity_data_e00_d00_e00009a3_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e00009ab.au") class __ASSET__assets_music_audacity_data_e00_d00_e00009ab_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e00009b4.au") class __ASSET__assets_music_audacity_data_e00_d00_e00009b4_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e00009ca.au") class __ASSET__assets_music_audacity_data_e00_d00_e00009ca_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e00009f5.au") class __ASSET__assets_music_audacity_data_e00_d00_e00009f5_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000a22.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000a22_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000a59.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000a59_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000a6a.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000a6a_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000a70.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000a70_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000ac7.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000ac7_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000ada.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000ada_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000b08.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000b08_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000b21.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000b21_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000b77.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000b77_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000bc1.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000bc1_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000bc6.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000bc6_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000c64.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000c64_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000c7e.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000c7e_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000caa.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000caa_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000ccd.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000ccd_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000d10.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000d10_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000d42.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000d42_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000da6.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000da6_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000e2f.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000e2f_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000ec4.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000ec4_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000ed8.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000ed8_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000f02.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000f02_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000f23.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000f23_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000f5b.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000f5b_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000f5e.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000f5e_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000fa9.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000fa9_au extends flash.utils.ByteArray {}
@:file("assets/music/audacity_data/e00/d00/e0000fec.au") class __ASSET__assets_music_audacity_data_e00_d00_e0000fec_au extends flash.utils.ByteArray {}
@:sound("assets/music/mort.mp3") class __ASSET__assets_music_mort_mp3 extends flash.media.Sound {}
@:file("assets/music/music-goes-here.txt") class __ASSET__assets_music_music_goes_here_txt extends flash.utils.ByteArray {}
@:sound("assets/music/teleport.mp3") class __ASSET__assets_music_teleport_mp3 extends flash.media.Sound {}
@:sound("assets/music/win.mp3") class __ASSET__assets_music_win_mp3 extends flash.media.Sound {}
@:file("assets/sounds/sounds-go-here.txt") class __ASSET__assets_sounds_sounds_go_here_txt extends flash.utils.ByteArray {}
@:file("assets/xml/end_state.xml") class __ASSET__assets_xml_end_state_xml extends flash.utils.ByteArray {}
@:file("assets/xml/game_state.xml") class __ASSET__assets_xml_game_state_xml extends flash.utils.ByteArray {}
@:file("assets/xml/menu_state.xml") class __ASSET__assets_xml_menu_state_xml extends flash.utils.ByteArray {}
@:sound("E:/HaxeToolkit/haxe/lib/flixel/3,3,1/assets/sounds/beep.mp3") class __ASSET__assets_sounds_beep_mp3 extends flash.media.Sound {}
@:sound("E:/HaxeToolkit/haxe/lib/flixel/3,3,1/assets/sounds/flixel.mp3") class __ASSET__assets_sounds_flixel_mp3 extends flash.media.Sound {}
@:bitmap("E:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/box.png") class __ASSET__flixel_flixel_ui_img_box_png extends flash.display.BitmapData {}
@:bitmap("E:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/button.png") class __ASSET__flixel_flixel_ui_img_button_png extends flash.display.BitmapData {}
@:bitmap("E:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/button_arrow_down.png") class __ASSET__flixel_flixel_ui_img_button_arrow_down_png extends flash.display.BitmapData {}
@:bitmap("E:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/button_arrow_left.png") class __ASSET__flixel_flixel_ui_img_button_arrow_left_png extends flash.display.BitmapData {}
@:bitmap("E:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/button_arrow_right.png") class __ASSET__flixel_flixel_ui_img_button_arrow_right_png extends flash.display.BitmapData {}
@:bitmap("E:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/button_arrow_up.png") class __ASSET__flixel_flixel_ui_img_button_arrow_up_png extends flash.display.BitmapData {}
@:bitmap("E:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/button_thin.png") class __ASSET__flixel_flixel_ui_img_button_thin_png extends flash.display.BitmapData {}
@:bitmap("E:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/button_toggle.png") class __ASSET__flixel_flixel_ui_img_button_toggle_png extends flash.display.BitmapData {}
@:bitmap("E:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/check_box.png") class __ASSET__flixel_flixel_ui_img_check_box_png extends flash.display.BitmapData {}
@:bitmap("E:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/check_mark.png") class __ASSET__flixel_flixel_ui_img_check_mark_png extends flash.display.BitmapData {}
@:bitmap("E:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/chrome.png") class __ASSET__flixel_flixel_ui_img_chrome_png extends flash.display.BitmapData {}
@:bitmap("E:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/chrome_flat.png") class __ASSET__flixel_flixel_ui_img_chrome_flat_png extends flash.display.BitmapData {}
@:bitmap("E:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/chrome_inset.png") class __ASSET__flixel_flixel_ui_img_chrome_inset_png extends flash.display.BitmapData {}
@:bitmap("E:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/chrome_light.png") class __ASSET__flixel_flixel_ui_img_chrome_light_png extends flash.display.BitmapData {}
@:bitmap("E:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/dropdown_mark.png") class __ASSET__flixel_flixel_ui_img_dropdown_mark_png extends flash.display.BitmapData {}
@:bitmap("E:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/finger_big.png") class __ASSET__flixel_flixel_ui_img_finger_big_png extends flash.display.BitmapData {}
@:bitmap("E:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/finger_small.png") class __ASSET__flixel_flixel_ui_img_finger_small_png extends flash.display.BitmapData {}
@:bitmap("E:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/hilight.png") class __ASSET__flixel_flixel_ui_img_hilight_png extends flash.display.BitmapData {}
@:bitmap("E:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/invis.png") class __ASSET__flixel_flixel_ui_img_invis_png extends flash.display.BitmapData {}
@:bitmap("E:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/minus_mark.png") class __ASSET__flixel_flixel_ui_img_minus_mark_png extends flash.display.BitmapData {}
@:bitmap("E:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/plus_mark.png") class __ASSET__flixel_flixel_ui_img_plus_mark_png extends flash.display.BitmapData {}
@:bitmap("E:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/radio.png") class __ASSET__flixel_flixel_ui_img_radio_png extends flash.display.BitmapData {}
@:bitmap("E:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/radio_dot.png") class __ASSET__flixel_flixel_ui_img_radio_dot_png extends flash.display.BitmapData {}
@:bitmap("E:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/swatch.png") class __ASSET__flixel_flixel_ui_img_swatch_png extends flash.display.BitmapData {}
@:bitmap("E:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/tab.png") class __ASSET__flixel_flixel_ui_img_tab_png extends flash.display.BitmapData {}
@:bitmap("E:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/images/tab_back.png") class __ASSET__flixel_flixel_ui_img_tab_back_png extends flash.display.BitmapData {}
@:file("E:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/xml/defaults.xml") class __ASSET__flixel_flixel_ui_xml_defaults_xml extends flash.utils.ByteArray {}
@:file("E:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/xml/default_loading_screen.xml") class __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml extends flash.utils.ByteArray {}
@:file("E:/HaxeToolkit/haxe/lib/flixel-ui/1,0,2/assets/xml/default_popup.xml") class __ASSET__flixel_flixel_ui_xml_default_popup_xml extends flash.utils.ByteArray {}


#end
