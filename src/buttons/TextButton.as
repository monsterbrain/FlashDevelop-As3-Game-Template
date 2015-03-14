package buttons 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Faisal Rasak
	 */
	public class TextButton extends Sprite
	{
		private var text:TextField = new TextField();
		private var bg:Sprite = new Sprite();
		
		private var isToggled:Boolean = false;
		
		public function TextButton(txt:String="Button",x:Number=0,y:Number=0,width:Number=100,height:Number=30):void 
		{
			this.x = x;
			this.y = y;
			Utils.createRoundBox(bg, -width / 2, -height / 2, width, height, 0xaf2323);
			addChild(bg);
			Utils.setTextProperties(text, txt, "oxygen", -50, -10, 100, 16, 0xffffff);
			addChild(text);
			
			buttonMode = true;
			
			addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		}
		
		public function toggle():void
		{
			if (isToggled)
			{
				isToggled = false;
				bg.transform.colorTransform = new ColorTransform();
			}
			else
			{
				isToggled = true;
				bg.transform.colorTransform = new ColorTransform(1.85,0.25,0.25);
			}
		}
		
		private function onMouseDown(e:MouseEvent):void 
		{
			this.scaleX = this.scaleY = 0.95;
		}
		
		private function onMouseUp(e:MouseEvent):void 
		{
			this.scaleX = this.scaleY = 1.0;
		}
		
	}

}