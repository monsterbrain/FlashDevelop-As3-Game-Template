package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import GUtils;
	import screens.Level1Screen;
	import screens.LevelSelectScreen;
	import screens.MenuScreen;
	import screens.Screen;
	import screens.SplashScreen;
	
	/**
	 * ------------FlashDevelop As3 Game Template--------------
	 * Simple Skeleton Quick-Start Game Template written in As3
	 * 
	 * Feel free to use it in any way you like. But if you have
	 * better ideas about implementing stuffs easily & safely
	 * let me know :)
	 * 
	 * Flash Develop Version 	: 4.6.2.5
	 * Tweener Engine			: KTween
	 * UI Assets from			: Kenney the Awesome
	 * 
	 * @author Faisal Rasak
	 */
	
	 //Starting point, unless there's a Preloader loading all stuffs before loading this 'Main' class
	public class Main extends Sprite 
	{
		//Embed Fonts
		[Embed(source = "../assets/fonts/DroidSans.ttf", fontName = "droidsans", mimeType = "application/x-font", embedAsCFF = "false")]
		protected var DroidFont:Class;
		
		//Constants for screens
		private static const SPLASH		:		int = 0;
		private static const MENU		:		int = 1;
		private static const LEVELSELECT:		int = 2;
		private static const LEVEL1		:		int = 3;
		
		//Keeping track of screens
		private var currentScreen:Screen;
		private var currentScreenID:int = 0;
		
		//Screens
		private var splashScreen		:SplashScreen;
		private var menuScreen			:MenuScreen;
		private var levelSelectScreen	:LevelSelectScreen;
		private var level1Screen		:Level1Screen;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			//Init Save Data. Load if exists. Create a new Save Data, if not exists.
			//SaveData.instance.initializeSave();
			
			loadCurrentScreen();
		}
		
		private function loadCurrentScreen():void 
		{
			//Tracing only when flag is set; might be handy if you have a lot of traces
			//and you don't have time to find & remove them all
			if (GUtils.DEBUGMODE)
				trace("loadCurrentScreen()");
			
			//Remove current screen if there is any
			if (currentScreen != null && contains(currentScreen))
			{
				currentScreen.removeListeners();
				removeChild(currentScreen);
				currentScreen = null;
				if (GUtils.DEBUGMODE)
					trace("Removed current screen");
			}
			
			if (GUtils.DEBUGMODE)
					trace("Load screen with ID " + currentScreenID);
					
			switch (currentScreenID) 
			{
				case SPLASH : 
					splashScreen = new SplashScreen();
					currentScreen = splashScreen;
				break;
				case MENU : 
					menuScreen = new MenuScreen();
					currentScreen = menuScreen;
				break;
				case LEVELSELECT : 
					levelSelectScreen = new LevelSelectScreen();
					currentScreen = levelSelectScreen;
				break;
				case LEVEL1 : 
					level1Screen = new Level1Screen();
					currentScreen = level1Screen;
				break;
				default:
			}
			
			if (currentScreen != null)
			{
				currentScreen.addListeners();
				addChild(currentScreen);
			}
		}
		
		public function loadNextScreen(args:int=0):void
		{
			if (GUtils.DEBUGMODE)
				trace("loadNextScreen, args=" + args);
				
			//args used to load different levels
			if (currentScreenID == SPLASH)
			{
				currentScreenID = MENU;
				SndMgr.inst.playMusic(SndMgr.BGMMENU);
			}
			else if (currentScreenID == MENU)
			{
				currentScreenID = LEVELSELECT;
				SndMgr.inst.playMusic(SndMgr.BGMMENU);
			}
			else if (currentScreenID == LEVELSELECT && args==0)
			{
				currentScreenID = LEVEL1;
				SndMgr.inst.playMusic(SndMgr.BGMMENU);
			}
			loadCurrentScreen();
		}
		
		public function loadPrevScreen(args:int=0):void
		{
			if (GUtils.DEBUGMODE)
				trace("loadPrevScreen, args=" + args);
			
			//args used to load different levels
			if (currentScreenID == LEVELSELECT)
			{
				currentScreenID = MENU;
			}
			else if (currentScreenID == LEVEL1)
			{
				currentScreenID = LEVELSELECT;
			}
			loadCurrentScreen();
		}
		
	}
}