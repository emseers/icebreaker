package 
{
	/**
	 * ...
	 * @author Boarnoah
	 */
	import net.flashpunk.Entity;
	public class score 
	{
		public var score:uint = 0;
		
		public function score() 
		{
			
		}
		
		public function updateScore(_addToScore:uint):void{
			score += _addToScore;
		}
	}

}