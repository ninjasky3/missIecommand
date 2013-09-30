package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * ...
	 * @author kerim birlik
	 */
	public class Organism extends Human
	{
		private var organisme : PoppetjeMC = new PoppetjeMC;
		
		public function Organism() 
		{
			organisme.x = -500;
			organisme.y = 750;
			humanName		=	"normalhuman";
			addChild(organisme);
			addEventListener(Event.ENTER_FRAME, loop);
		}
			
		
		private function loop(e:Event):void
		{
			organisme.x += 10;
			organisme.y += 0;
			
			if (organisme.x > 1400)
			{
				organisme.x = -500;
				
			}
			
		}
	}

}