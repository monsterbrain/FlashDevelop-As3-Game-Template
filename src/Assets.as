package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.utils.getDefinitionByName;
	import flash.media.SoundTransform;
	/**
	 * ...
	 * @author Faisal Rasak
	 */
	public class Assets 
	{
		//Splash assets
		[Embed(source="../assets/graphics/splash/Splash_Logo.png")] 	public static var ImgSplashLogo:Class;
		
		//Menu & Level Screen
		[Embed(source="../assets/graphics/menu/Menu_Bg.png")] 			public static var ImgMenuBG:Class;
		[Embed(source="../assets/graphics/menu/gameTitle.png")] 		public static var ImgGameTitle:Class;
		[Embed(source = "../assets/graphics/menu/logo_mystudio.png")]	public static var ImgLogoMystudio:Class;
		[Embed(source = "../assets/graphics/menu/logo_sponsor.png")] 	public static var ImgSponsor:Class;
		[Embed(source="../assets/graphics/menu/Btn_Info.png")] 			public static var ImgInfoBtn:Class;
		[Embed(source = "../assets/graphics/menu/Btn_Play.png")] 		public static var ImgPlayBtn:Class;
		[Embed(source="../assets/graphics/menu/Btn_Mute_Off.png")] 		public static var ImgMuteBtnNormal:Class;
		[Embed(source="../assets/graphics/menu/Btn_Mute_On.png")] 		public static var ImgMuteBtnChecked:Class;
		
		//Level Screen
		[Embed(source = "../assets/graphics/levelselect/Lvl_Thumb_Bg.png")]	public static var ImgThumbBg:Class;
		[Embed(source = "../assets/graphics/levelselect/backButton.png")]	public static var ImgBackbtn:Class;
		[Embed(source = "../assets/graphics/levelselect/Lock_Thumb.png")]	public static var ImgThumbLocked:Class;
		
		//Pause Menu
		[Embed(source = "../assets/graphics/game/Btn_Backtomenu.png")]	public static var ImgBtnBacktomenu:Class;
		[Embed(source = "../assets/graphics/game/Btn_Close.png")]		public static var ImgBtnClose:Class;
		[Embed(source = "../assets/graphics/game/Btn_Continue.png")]	public static var ImgBtnContinue:Class;
		[Embed(source="../assets/graphics/game/PauseWindow.png")]		public static var ImgPauseWindow:Class;
		
		//SFX
		[Embed(source="../assets/sounds/letterClick.mp3")] 		public static var SfxClick:Class;
		[Embed(source = "../assets/sounds/screen_back.mp3")] 	public static var SfxClickBack:Class;
		
		//Music Tracks
		[Embed(source = "../assets/music/cool_funny_bounce_music.mp3")] public static var BgmMenu:Class;
		
		public function Assets() 
		{
			
		}
		
		/**
		 * Returns a Bitmap display object identified by the specified name.
		 * @param	The name of the bitmap asset to return.  This name must match one of the 
		 * @return	A Bitmap display object.
		 * Code from GhostWire Ref : http://www.ghostwire.com/blog/archives/as3-referencing-embedded-assets-of-another-class-using-underscore/
		 */
		public static function GetImage(name:String,smoothing:Boolean=false):Bitmap
		{
			//name = name.toUpperCase();
			try
			{
				var cls:Class = getDefinitionByName("Assets_" + name) as Class;
				var bmp:Bitmap = new cls();
				if (smoothing)
					bmp.smoothing = smoothing;
				return bmp;
			}
			catch (e:Error)
			{
				trace(e.getStackTrace());
			}
			// ** else return a default 16x16 opaque white square bitmap **
			return new Bitmap(new BitmapData(16,16));
		}
		
		static public function playSound(name:String, pos:Number=0, loop:int=1, sndtransform:SoundTransform=null):SoundChannel 
		{
			try
			{
				var cls:Class = getDefinitionByName("Assets_" + name) as Class;
				var music:Sound = new cls();
				return music.play(pos, loop, sndtransform);
			}
			catch (e:Error)
			{
				trace(e.getStackTrace());
			}
			return null;
		}
	}

}