package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * ...
	 * @author kerim birlik
	 */
	public class WindEntity extends MovieClip
	{
		
		public function WindEntity() 
		{
			// addEventListener(Event.ENTER_FRAME, loop);
		this.y += 10;
		this.x += Math.random() * 20;
		}
		
	
	}

}