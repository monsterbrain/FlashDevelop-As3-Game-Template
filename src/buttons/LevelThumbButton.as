package buttons 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Faisal Rasak
	 */
	public class LevelThumbButton extends Sprite
	{
		private var thumbButton:ScaleButton;
		private var levelText:TextField;		
		
		public function LevelThumbButton(levelId:int=0,clickCallback:Function = null):void
		{
			thumbButton = new ScaleButton(Assets.ImgThumbBg, 0, 0, clickCallback);
			levelText = new TextField();
			addChild(thumbButton);
			Utils.setTextProperties(levelText, "Level " + levelId, GUtils.FONT_DROIDSANS, -thumbButton.width / 2, 0, thumbButton.width, 20, 0x333333);
			levelText.height = 24;
			addChild(levelText);
		}
		
		public function setPos(x:int, y:int):void
		{
			this.x = x;
			this.y = y;
		}
		
	}

}