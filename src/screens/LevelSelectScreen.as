package screens 
{
	import buttons.LevelThumbButton;
	import buttons.ScaleButton;
	import buttons.ScaleToggleButton;
	import flash.events.Event;
	import net.kawa.tween.easing.Sine;
	import net.kawa.tween.KTween;
	import net.stevensacks.utils.Web;
	import Utils;
	
	/**
	 * ...
	 * @author Faisal Rasak
	 */
	public class LevelSelectScreen extends Screen 
	{
		private var myCompanyButton:ScaleButton;
		private var sponsorButton:ScaleButton;
		private var backButton:ScaleButton;
		private var muteButton:ScaleToggleButton;
		
		private var lvl1Button:LevelThumbButton;
		private var lvl2Button:LevelThumbButton;
		private var lvl3Button:LevelThumbButton;
		private var lvl4Button:LevelThumbButton;
		
		private const gap:int = 10;
		
		public function LevelSelectScreen() 
		{
			super();
			
			addChild(Utils.getBitmap(Assets.ImgMenuBG));
			
			muteButton = new ScaleToggleButton(Assets.ImgMuteBtnNormal, Assets.ImgMuteBtnChecked, 0, 0, SndMgr.inst.isMute, onMuteButtonClicked);
			muteButton.x = GUtils.GWIDTH - muteButton.width / 2 - gap;
			muteButton.y = muteButton.height / 2 + gap;
			addChild(muteButton);
			
			backButton = new ScaleButton(Assets.ImgBackbtn, 0, 0, goBackToMenu);
			backButton.x = backButton.width / 2 + gap;
			backButton.y = backButton.height / 2 + gap;
			addChild(backButton);
			
			sponsorButton = new ScaleButton(Assets.ImgSponsor, 0, 0, onSponsorClicked);
			sponsorButton.x = sponsorButton.width / 2 + gap;
			sponsorButton.y = GUtils.GHEIGHT - sponsorButton.height / 2 - gap;
			addChild(sponsorButton);
			
			//Todo: Need to handle the click function to a single function
			lvl1Button = new LevelThumbButton(0,onLevel1ThumbClicked);
			lvl2Button = new LevelThumbButton(1,onLevel2ThumbClicked);
			lvl3Button = new LevelThumbButton(2,onLevel3ThumbClicked);
			lvl4Button = new LevelThumbButton(3,onLevel4ThumbClicked);
			
			addChild(lvl1Button);
			addChild(lvl2Button);
			addChild(lvl3Button);
			addChild(lvl4Button);
			
			//Arranging Level thumbs in 2x2 formation grid
			var gapBtwnThumbs:int = 20;	//gap between thumbs
			var startX:int = (GUtils.GWIDTH - (lvl1Button.width * 2 + gapBtwnThumbs)) / 2 + lvl1Button.width / 2;
			var startY:int = (GUtils.GHEIGHT - (lvl1Button.height * 2 + gapBtwnThumbs)) / 2 + lvl1Button.height / 2;
			
			lvl1Button.setPos(startX, startY);
			lvl2Button.setPos(startX+lvl1Button.width+gapBtwnThumbs, startY);
			lvl3Button.setPos(startX, startY+lvl1Button.height+gapBtwnThumbs);
			lvl4Button.setPos(startX+lvl1Button.width+gapBtwnThumbs, startY+lvl1Button.height+gapBtwnThumbs);
		}
		
		private function onLevel1ThumbClicked():void 
		{
			Main(this.parent).loadNextScreen(0);
		}
		
		private function onLevel2ThumbClicked():void 
		{
			
		}
		
		private function onLevel3ThumbClicked():void 
		{
			
		}
		
		private function onLevel4ThumbClicked():void 
		{
			
		}
		
		private function onMuteButtonClicked():void 
		{
			SndMgr.inst.muteSound();
		}
		
		private function goBackToMenu():void 
		{
			SndMgr.inst.playSound(SndMgr.SFXCLICKBACK);
			Main(this.parent).loadPrevScreen();
		}
		
		private function onAnimalThumbClicked():void 
		{
			
		}
		
		private function onBirdThumbClicked():void 
		{
			
		}
		
		private function onSponsorClicked():void 
		{
			SndMgr.inst.playSound(SndMgr.SFXCLICK);
			Web.getURL("http://monsterbraininc.com", "_blank");
		}
		
		override public function addListeners():void
		{
			//addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		public function onPlayClicked():void
		{
			Main(this.parent).loadNextScreen(0);
		}
		
		private function onEnterFrame(e:Event):void 
		{
		}
		
		override public function removeListeners():void
		{
			//removeEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
	}

}