package  {
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	/**
	 * Utils - Commonly used codes to minimize extra codes
	 * @author Faisal
	 */
	public class Utils 
	{
		public static const sinVals:Array = [0.00, 0.052, 0.10, 0.16, 0.21, 0.26, 0.31, 0.36, 0.41, 0.45, 0.50, 0.54, 0.59, 0.63, 0.67, 0.71, 0.74, 0.78, 0.81, 0.84, 0.87, 0.89, 0.91, 0.93, 0.95, 0.97, 0.98, 0.99, 0.99, 1.00, 1.0, 1.00, 0.99, 0.99, 0.98, 0.97, 0.95, 0.93, 0.91, 0.89, 0.87, 0.84, 0.81, 0.78, 0.74, 0.71, 0.67, 0.63, 0.59, 0.54, 0.50, 0.45, 0.41, 0.36, 0.31, 0.26, 0.21, 0.16, 0.10, 0.052];
		
		public function Utils() 
		{
		}
		
		//Easy way to setup the TextField values
		public static function setTextProperties(txt:TextField,text:String,fontName:String="",_x:Number=0,_y:Number=0,width:Number=100,textSize:int=20,color:uint=0x000000,align:String=TextFormatAlign.CENTER):void 
		{
			var txtFormat:TextFormat = new TextFormat(fontName,textSize,color,null,null,null,null,null,align);
			txt.defaultTextFormat = txtFormat;
			txt.antiAliasType = AntiAliasType.ADVANCED;
			txt.embedFonts = true;
			txt.width = width;
			txt.selectable = false;
			txt.text = text;
			txt.mouseEnabled = false;
			
			txt.x = _x;
			txt.y = _y;
		}
		
		//Pass a Non-Null sprite, with ImageClass to add the Bitmap to the sprite 
		public static function createImageSprite(sprite:Sprite,  ImageClass:Class = null, _x:Number =0, _y:Number=0, buttonMode:Boolean = false):void 
		{
			var bitmap:Bitmap = new ImageClass();
			bitmap.smoothing = true;
			sprite.addChild(bitmap);
			
			sprite.x = _x;
			sprite.y = _y;
			
			sprite.buttonMode = buttonMode;
		}
		
		public static function addBitmapToSprite(bitmap:Bitmap, sprite:Sprite, buttonMode:Boolean = false, centered:Boolean = false):void
		{
			sprite.addChild(bitmap);
			sprite.buttonMode = buttonMode;
			if (centered)
			{
				bitmap.x -= (bitmap.width * 0.5);
				bitmap.y -= (bitmap.height * 0.5);
			}
		}
		
		//Create a rounded box with non-null sprite
		public static function createRoundBox(sprite:Sprite,_x:Number =0, _y:Number=0 , _width:Number = 100, _height:Number = 100, color:uint = 0x000000, alpha:Number = 1.0, roundWidth:Number = 5.0, roundHeight:Number = 5.0, buttonMode:Boolean = false):void 
		{
			sprite.graphics.beginFill(color, alpha);
			sprite.graphics.drawRoundRect(0, 0, _width, _height,roundWidth,roundHeight);
			sprite.graphics.endFill();
			
			sprite.x = _x;
			sprite.y = _y;
			
			sprite.buttonMode = buttonMode;
		}
		
		//Create a rounded box with non-null sprite with pivot at centre
		public static function createCRoundBox(sprite:Sprite,_x:Number =0, _y:Number=0 , _width:Number = 100, _height:Number = 100, color:uint = 0x000000, alpha:Number = 1.0, roundWidth:Number = 5.0, roundHeight:Number = 5.0, buttonMode:Boolean = false):void 
		{
			sprite.graphics.beginFill(color, alpha);
			sprite.graphics.drawRoundRect(-_width*0.5, -_height*0.5, _width, _height,roundWidth,roundHeight);
			sprite.graphics.endFill();
			
			sprite.x = _x;
			sprite.y = _y;
			
			sprite.buttonMode = buttonMode;
		}
		
		//Create a box with non-null sprite
		public static function createBox(sprite:Sprite,_x:Number =0, _y:Number=0, _width:Number=100,_height:Number=100,color:uint=0x000000,alpha:Number=1.0,buttonMode:Boolean=false):void 
		{
			sprite.graphics.beginFill(color, alpha);
			sprite.graphics.drawRect(0, 0, _width, _height);
			sprite.graphics.endFill();
			
			sprite.x = _x;
			sprite.y = _y;
			
			sprite.buttonMode = buttonMode;
		}
		
		//Create a circle with only line stroke
		public static function createCircle(sprite:Sprite,_x:Number =0, _y:Number=0, _radius:Number=10,thickness:Number = 1.0,color:uint=0x000000,alpha:Number=1.0):void 
		{
			sprite.graphics.lineStyle(thickness, color, alpha);
			sprite.graphics.drawCircle(_x,_y,_radius);
		}
		
		//get a bitmap from the embedded bitmap class
		public static function getBitmap(bmpClass:Class,x:Number=0,y:Number=0):Bitmap
		{
			var bmp:Bitmap = new bmpClass();
			bmp.x = x;
			bmp.y = y;
			return bmp;
		}
		
		public static function getRand(num:Number):int
		{
			return int(Math.floor(Math.random() * num));
		}
		
		public static function abs(value:Number):Number
		{
			return ((value ^ (value >> 31)) - (value >> 31));
		}
		
	}

}