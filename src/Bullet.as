package 
{
import flash.display.MovieClip;
import flash.events.Event;
import flash.events.MouseEvent;
/**
* ...
* @author kerim birlik
*/
	public class Bullet extends bullet
	{
	public static var _allBullets:Array = [];
	public var movex : Number;
	public var movey : Number;
	public function Bullet() 
		{
		_allBullets.push(this);

		}
		public function update():void
		{
		x -= movex * 3;
		y -= movey * 3;
		}
	}

}
