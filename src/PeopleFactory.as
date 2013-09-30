package  
{
	/**
	 * ...
	 * @author kerim birlik
	 */
	public class PeopleFactory 
	{
		
		public function MakePeople( type : int) : Human
		{
			var people : Human;
			
			if (type < 10)
				{
				people = new Organism;
				}
				if (type  > 10 && type < 20 )
				{
				people = new Octopus;
				}
		
		return people;
		}
		
	}

}