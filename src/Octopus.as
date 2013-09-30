package  
{
	import flash.events.Event;
	/**
	 * ...
	 * @author kerim birlik
	 */
	public class Octopus extends Human
	{
		private var octopus : OctopusMC = new OctopusMC;
		public function Octopus() 
		{
			
			octopus.x = -500;
			octopus.y = 750;
			humanName		=	"normalhuman";
			addChild(octopus);
			addEventListener(Event.ENTER_FRAME, loop);
		}
		private function loop(e:Event):void
		{
			octopus.x += 10;
			octopus.y += 0;
			
						if (octopus.x > 1400)
			{
				octopus.x = -500;
				
			}
		}
		
		
	}

}