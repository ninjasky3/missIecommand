package  
{
import flash.display.MovieClip;
import flash.events.Event;
import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Kerim Birlik
	 */
	public  class Missle extends WindEntity
	{
		public static var _allMeteooren:Array = [];
	
		private var missledingens:MissleMC = new MissleMC;
		
		public function Missle() 
		{
			addChild(missledingens);
			
			
		}

	}

}