package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author kerim birlik
	 */
	public class MissleFactory 
	{
		
		public function MakeMissle( type : int) : Missle
		{
			var _missles : Missle;
			
			if (type == 0)
				{
				_missles = new Missle;
				}

		return _missles;
		}
		
	}

}