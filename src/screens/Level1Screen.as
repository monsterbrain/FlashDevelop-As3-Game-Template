package screens 
{
	import buttons.ScaleButton;
	import buttons.ScaleToggleButton;
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import net.kawa.tween.easing.Back;
	import net.kawa.tween.easing.Sine;
	import net.kawa.tween.KTJob;
	import net.kawa.tween.KTween;
	import net.stevensacks.utils.Web;
	import Utils;
	import GUtils;
	
	/**
	 * Game Class - Game implementation goes here
	 * 
	 * Just another Breakout clone for testing purposes
	 * 
	 * @author Faisal Rasak
	 */
	public class Level1Screen extends Screen 
	{
		private var ball:Shape;
		private var pad:Shape;
		
		private const ball_rad:Number = 20;
		private const pad_height:Number = 20;
		private const pad_width:Number = 70;
		
		private var velX:Number = 4;
		private var velY:Number = 4;
		
		private var muteButton:ScaleToggleButton;
		private var backButton:ScaleButton;
		private var pauseScreen:PauseDialogScreen;
		
		private var gamePaused:Boolean = false;
		
		private const gap:int = 10;
		
		public function Level1Screen() 
		{
			super();
			
			ball = new Shape();
			ball.graphics.beginFill(0xff0000);
			ball.graphics.drawCircle(0, 0, ball_rad);
			
			addChild(ball);
			
			ball.x = 200;
			ball.y = 200;
			
			pad = new Shape();
			pad.graphics.beginFill(0x00ff00);
			pad.graphics.drawRoundRect(-pad_width/2, -pad_height/2, pad_width, pad_height,5,5);
			
			addChild(pad);
			
			pad.x = 400;
			pad.y = 450;
			
			pauseScreen = new PauseDialogScreen(goBackToMenu, cancelPauseMenu);			
			
			backButton = new ScaleButton(Assets.ImgBackbtn, 0, 0, showPauseScreen);
			backButton.x = backButton.width / 2 + gap;
			backButton.y = backButton.height / 2 + gap;
			addChild(backButton);
			
			muteButton = new ScaleToggleButton(Assets.ImgMuteBtnNormal, Assets.ImgMuteBtnChecked, 0, 0, SndMgr.inst.isMute, onMuteButtonClicked);
			muteButton.x = GUtils.GWIDTH - muteButton.width / 2 - gap;
			muteButton.y = muteButton.height / 2 + gap;
			addChild(muteButton);
		}
		
		private function onMuteButtonClicked():void 
		{
			SndMgr.inst.muteSound();
		}
		
		private function showPauseScreen():void
		{
			SndMgr.inst.playSound(SndMgr.SFXCLICK);
			gamePaused = true;
			if(!contains(pauseScreen))
				addChild(pauseScreen);
			//pauseScreen.show();
		}
		
		private function cancelPauseMenu():void 
		{
			SndMgr.inst.playSound(SndMgr.SFXCLICKBACK);
			if(contains(pauseScreen))
				removeChild(pauseScreen);
			gamePaused = false;
		}
		
		private function goBackToMenu():void 
		{
			SndMgr.inst.playSound(SndMgr.SFXCLICK);
			if(contains(pauseScreen))
				removeChild(pauseScreen);
			Main(this.parent).loadPrevScreen();
		}
		
		override public function addListeners():void
		{
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(e:Event):void 
		{
			if (gamePaused)
				return;
				
			ball.x += velX;
			ball.y += velY;
				
			if (Utils.abs(pad.x - this.mouseX) > 4)
				pad.x += (this.mouseX - pad.x) * 0.25;//Move pad to the mouse. With Easing :)
			
			//Check collisions
			if (ball.x > GUtils.GWIDTH - ball_rad || (ball.x - ball_rad) < 0)
				velX = -velX;
			if (ball.y > GUtils.GHEIGHT - ball_rad || (ball.y - ball_rad) < 0)
				velY = -velY;
			
			if (ball.hitTestObject(pad))
				velY = -velY;
		}
		
		override public function removeListeners():void
		{
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
	}

}