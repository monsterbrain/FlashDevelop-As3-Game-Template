package  
{
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import raj.soundlite.MBG;
	import raj.soundlite.MSFX;
	import raj.soundlite.MSound;
	/**
	 * ...
	 * @author Faisal
	 */
	public class SndMgr 
	{
		public static const BGMMENU			:int = 0;
		public static const SFXCLICK		:int = 1;
		public static const SFXCLICKBACK	:int = 2;
		
		//private var letterHitSFX:MSound = new MSound(new Assets.SFXLetterHit(), 0, 0.65);
		
		private var bgMusic:MSound = new MSound(new Assets.BgmMenu(), 999999, 0.65);
		
		private var sfxClick		:MSound = new MSound(new Assets.SfxClick(), 0, 0.75);
		private var sfxClickBack	:MSound = new MSound(new Assets.SfxClickBack(), 0, 0.75);
		
		public var isMute:Boolean = false;
		
		private static var snd_instance:SndMgr;
		
		private var musicChannel:SoundChannel;
		private var soundChannel:SoundChannel;
		
		private var soundTransform:SoundTransform;
		
		public function SndMgr()
		{
			// using soundlite library
			MSFX.init();
			MBG.init();
			
			// else
			//musicChannel = new SoundChannel();
			//soundChannel = new SoundChannel();
			//
			//soundTransform = new SoundTransform(0.65);
		}
		
		public static function get inst():SndMgr
		{
			if (snd_instance == null)
			{
				snd_instance = new SndMgr();
			}
			return snd_instance;
		}
		
		public static function set inst(value:SndMgr):void
		{
			snd_instance = value;
		}
		
		public function playMusic(id:int = 0):void
		{
			// using soundlite library
			if (id == BGMMENU)
				MBG.play(bgMusic);
			
			//else
			//if (id == BGMMENU)
				//musicChannel = Assets.playSound("BgmMenu", 0, 999, soundTransform); //Pass in ClassName
		}
		
		public function pauseMusic():void
		{
			// using soundlite library
			MBG.stop(bgMusic);
			
			//else
			//musicChannel.stop();
		}
		
		public function playSound(id:int = 0, vol:Number = 0.65):void
		{
			// using soundlite library
			if (id == SFXCLICK)
				MSFX.play(sfxClick);
			else if (id == SFXCLICKBACK)
				MSFX.play(sfxClickBack);
			
			// else
			//if (id == SFXCLICK)
				//soundChannel = Assets.playSound("SfxClick", 0, 1, soundTransform); //Pass in ClassName
			
		}
		
		public function muteSound():Boolean 
		{
			if (isMute)
			{
				isMute = false;
				// using soundlite library
				MSFX.setMute(isMute);
				MBG.setMute(isMute);
				
				// else
				//soundTransform.volume = 0.65;
				//musicChannel.soundTransform = soundTransform;
				//soundChannel.soundTransform = soundTransform;
			}
			else
			{
				isMute = true;
				// using soundlite library
				MSFX.setMute(isMute);
				MBG.setMute(isMute);
				
				// else
				//soundTransform.volume = 0;
				//musicChannel.soundTransform = soundTransform;
				//soundChannel.soundTransform = soundTransform;
			}
			return isMute;
		}
		
	}

}