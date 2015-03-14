package buttons 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Faisal Rasak
	 */
	public class ScaleToggleButton extends Sprite 
	{
		private var scaleFactor:Number = 0.90;
		private var clickCallback:Function = null;
		public var buttonId:int = 0;
		
		private var _isChecked:Boolean = false;
		
		private var normalBmp:Bitmap;
		private var checkedBmp:Bitmap;
		
		public function ScaleToggleButton(imgNormalClass:Class,imgCheckedClass:Class,x:Number,y:Number,isChecked:Boolean=false,callback:Function=null,scaleFactor:Number=0.90):void 
		{
			super();
			
			this.scaleFactor = scaleFactor;
			
			this.x = x;
			this.y = y;
			
			clickCallback = callback;
			
			this._isChecked = isChecked;
			
			//centered always
			normalBmp = new imgNormalClass();
			normalBmp.x = -normalBmp.width * 0.5;
			normalBmp.y = -normalBmp.height * 0.5;
			normalBmp.smoothing = true;
			
			
			checkedBmp = new imgCheckedClass();
			checkedBmp.x = -checkedBmp.width * 0.5;
			checkedBmp.y = -checkedBmp.height * 0.5;
			checkedBmp.smoothing = true;
			
			
			if (isChecked)
				addChild(checkedBmp);
			else
				addChild(normalBmp);
				
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
				toggleChecked();
				clickCallback();
			}
		}
		
		private function toggleChecked():void 
		{
			if (isChecked)
			{
				isChecked = false;
			}
			else
			{
				isChecked = true;
			}
		}
		
		public function removeListeners():void
		{
			removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			removeEventListener(MouseEvent.CLICK, onMouseClick);
		}
		
		public function get isChecked():Boolean 
		{
			return _isChecked;
		}
		
		public function set isChecked(value:Boolean):void 
		{
			_isChecked = value;
			if (value)
			{
				if (contains(normalBmp))
					removeChild(normalBmp);
				addChild(checkedBmp);
			}
			else
			{
				if (contains(checkedBmp))
					removeChild(checkedBmp);
				addChild(normalBmp);
			}
		}
	}

}