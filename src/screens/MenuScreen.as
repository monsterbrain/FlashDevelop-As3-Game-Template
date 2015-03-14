package screens 
{
	import buttons.ScaleButton;
	import buttons.ScaleToggleButton;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormatAlign;
	import net.kawa.tween.easing.Sine;
	import net.kawa.tween.KTween;
	import net.stevensacks.utils.Web;
	import Utils;
	
	/**
	 * ...
	 * @author Faisal Rasak
	 */
	public class MenuScreen extends Screen 
	{
		private var playButton:ScaleButton;
		private var infoButton:ScaleButton;
		
		private var creditsText:TextField = new TextField();
		private var title:Bitmap;
		
		private var myCompanyButton:ScaleButton;
		private var sponsorButton:ScaleButton;		
		private var muteButton:ScaleToggleButton;
		
		private var angleId:int = 0;
		
		private const gap:int = 10;
		
		public function MenuScreen() 
		{
			super();
			
			addChild(Utils.getBitmap(Assets.ImgMenuBG));
			
			title = Utils.getBitmap(Assets.ImgGameTitle, 0, 0);
			title.x = GUtils.GWIDTH / 2 - title.width / 2;
			title.y = title.height / 2;
			addChild(title);
			
			Utils.setTextProperties(creditsText, "Code/Design\nMonster Brain Games\nMusic&Sounds\nFreeSfx.uk\nKenney.nl\nfreeSound.org", GUtils.FONT_DROIDSANS, 10, 70, 250, 16, 0xfefefe, TextFormatAlign.LEFT);
			addChild(creditsText);
			creditsText.alpha = 0;
			
			muteButton = new ScaleToggleButton(Assets.ImgMuteBtnNormal, Assets.ImgMuteBtnChecked, 0, 0, SndMgr.inst.isMute, onMuteButtonClicked);
			muteButton.x = GUtils.GWIDTH - muteButton.width / 2 - gap;
			muteButton.y = muteButton.height / 2 + gap;
			addChild(muteButton);
			
			infoButton = new ScaleButton(Assets.ImgInfoBtn, 0, 0, onInfoClicked);
			infoButton.x = infoButton.width / 2 + gap;
			infoButton.y = infoButton.height / 2 + gap;
			addChild(infoButton);
			
			playButton = new ScaleButton(Assets.ImgPlayBtn, 0, 0, onPlayClicked);
			playButton.x = GUtils.GWIDTH / 2;
			playButton.y = GUtils.GHEIGHT - playButton.height / 2 - gap*2;
			addChild(playButton);
			
			sponsorButton = new ScaleButton(Assets.ImgSponsor, 0, 0, onSponsorClicked);
			sponsorButton.x = sponsorButton.width / 2 + gap;
			sponsorButton.y = GUtils.GHEIGHT - sponsorButton.height / 2 - gap;
			addChild(sponsorButton);
			
			myCompanyButton = new ScaleButton(Assets.ImgLogoMystudio, 0, 0, onHelloClicked);
			myCompanyButton.x = GUtils.GWIDTH - myCompanyButton.width / 2 - gap;
			myCompanyButton.y = GUtils.GHEIGHT - myCompanyButton.height / 2 - gap;
			addChild(myCompanyButton);
		}
		
		private function onMuteButtonClicked():void 
		{
			SndMgr.inst.muteSound();
		}
		
		private function onHelloClicked():void 
		{
			//SndMgr.inst.playSound(SndMgr.SFXHELLOALIEN);
		}
		
		private function onSponsorClicked():void 
		{
			SndMgr.inst.playSound(SndMgr.SFXCLICK);
			Web.getURL(GUtils.SPONSORURL, "_blank");
		}
		
		private function onInfoClicked():void 
		{
			SndMgr.inst.playSound(SndMgr.SFXCLICK);
			KTween.cancel();
			creditsText.alpha = 1;
			KTween.to(creditsText, 4.0, { alpha:0 }, Sine.easeIn);
		}
		
		override public function addListeners():void
		{
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		public function onPlayClicked():void
		{
			SndMgr.inst.playSound(SndMgr.SFXCLICK);
			Main(this.parent).loadNextScreen(0);
		}
		
		private function onEnterFrame(e:Event):void 
		{
			angleId += 1;
			if (angleId >= 60)
			{
				angleId = 0;
			}
			
			//perform a swinging motion with Sin(angle) function.
			//Performance improvement with precalculated values
			title.y = 26 + 20 * Utils.sinVals[angleId];
		}
		
		override public function removeListeners():void
		{
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
	}

}