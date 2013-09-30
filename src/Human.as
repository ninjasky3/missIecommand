package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author kerim birlik
	 */
	public class Human extends MovieClip
	{
		private var _humanName	:	String;
		private var _speed		:	Number;
		private var _directionX	:	Number;
		private var _directionY	:	Number;
		private var _damage		:	Number;
		

		
			public function get speed() : Number {
			return	_speed;
		}

		public function set speed(speed : Number) : void {
			_speed = speed;
		}

		public function get humanName() : String {
			return _humanName;
		}

		public function set humanName(humanName : String) : void {
			_humanName = humanName;
		}
		
		
	}

}