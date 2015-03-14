package screens 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import GUtils;
	import net.kawa.tween.easing.Sine;
	import net.kawa.tween.KTween;
	import net.stevensacks.utils.Web;
	import Utils;
	
	/**
	 * ...
	 * @author Faisal Rasak
	 */
	public class SplashScreen extends Screen 
	{
		private var splashImg:Sprite = new Sprite();
		private var isSplashShown:Boolean = false;
		
		public function SplashScreen() 
		{
			super();
			
			//create white BG
			var bg:Sprite = new Sprite();
			Utils.createBox(bg, 0, 0, GUtils.GWIDTH, GUtils.GHEIGHT, 0xffffff);
			addChild(bg);
			
			//Add your Awesome Logo here
			Utils.addBitmapToSprite(Assets.GetImage("ImgSplashLogo",true),splashImg, true, true);
			addChild(splashImg);
			
			//Center the Logo on screen
			splashImg.x = GUtils.GWIDTH / 2;
			splashImg.y = GUtils.GHEIGHT / 2;
			
			//fade In starts
			splashImg.alpha = 0;
		}
		
		override public function addListeners():void
		{
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			splashImg.addEventListener(MouseEvent.CLICK, onLogoClicked);
		}
		
		private function onLogoClicked(e:MouseEvent):void 
		{
			//"_blank" used to open webpage in new TAB or Window
			Web.getURL(GUtils.DEVELOPERURL, "_blank");
		}
		
		private function onEnterFrame(e:Event):void 
		{
			if(!isSplashShown)
				splashImg.alpha += 0.025;
			
			if (splashImg.alpha >= 1 && !isSplashShown)
			{
				isSplashShown = true;
				
				//Fade out Logo
				KTween.to(this, 1.5, { alpha:0 }, Sine.easeOut, Main(this.parent).loadNextScreen);
			}
		}
		
		override public function removeListeners():void
		{
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			splashImg.removeEventListener(MouseEvent.CLICK, onLogoClicked);
		}
	}

}