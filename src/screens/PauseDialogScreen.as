package screens 
{
	import buttons.ScaleButton;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Faisal Rasak
	 */
	public class PauseDialogScreen extends Sprite 
	{
		private var windowBg:Bitmap;
		private var closeButton:ScaleButton;
		private var continueButton:ScaleButton;
		private var backToMenuButton:ScaleButton;
		
		public function PauseDialogScreen(CbBackToMenu:Function=null,CbCancelPauseMenu:Function=null):void
		{
			//transperant dark bg
			this.graphics.beginFill(0, 0.75);
			this.graphics.drawRect(0, 0, GUtils.GWIDTH, GUtils.GHEIGHT);
			
			windowBg = new Assets.ImgPauseWindow();
			windowBg.smoothing = true;
			windowBg.x = GUtils.GWIDTH/2 - windowBg.width / 2;
			windowBg.y = GUtils.GHEIGHT/2 - windowBg.height / 2;
			addChild(windowBg);
			
			closeButton = new ScaleButton(Assets.ImgBtnClose, windowBg.x + windowBg.width, windowBg.y, CbCancelPauseMenu);
			addChild(closeButton);
			
			continueButton = new ScaleButton(Assets.ImgBtnContinue, windowBg.x + windowBg.width/2, windowBg.y+windowBg.height/2-30, CbCancelPauseMenu);
			addChild(continueButton);
			
			backToMenuButton = new ScaleButton(Assets.ImgBtnBacktomenu, windowBg.x + windowBg.width/2, windowBg.y+windowBg.height/2+30, CbBackToMenu);
			addChild(backToMenuButton);
		}
		
	}

}