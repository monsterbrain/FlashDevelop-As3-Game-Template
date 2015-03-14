package buttons 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Faisal Rasak
	 */
	public class ScaleButton extends Sprite 
	{
		private var scaleFactor:Number = 0.90;
		private var clickCallback:Function = null;
		public var buttonId:int = 0;
		
		public function ScaleButton(imgClass:Class,x:Number,y:Number,callback:Function=null,scaleFactor:Number=0.90):void 
		{
			super();
			
			this.scaleFactor = scaleFactor;
			
			this.x = x;
			this.y = y;
			
			clickCallback = callback;
			
			//centered always
			var bmp:Bitmap = new imgClass();
			bmp.x = -bmp.width * 0.5;
			bmp.y = -bmp.height * 0.5;
			bmp.smoothing = true;
			addChild(bmp);
			
			this.buttonMode = true;
			
			addListeners();
		}
		
		private function addListeners():void 
		{
			addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			addEventListener(MouseEvent.CLICK, onMouseClick);
		}
		
		private function onMouseUp(e:MouseEvent):void 
		{
			this.scaleX = this.scaleY = 1.0;
		}
		
		private function onMouseDown(e:MouseEvent):void 
		{
			this.scaleX = this.scaleY = scaleFactor;
		}
		
		private function onMouseClick(e:MouseEvent):void 
		{
			if (clickCallback != null)
			{
				clickCallback();
			}
		}
		
		public function removeListeners():void
		{
			removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			removeEventListener(MouseEvent.CLICK, onMouseClick);
		}
	}

}