package 
{
	/**
	 * ...
	 * @author Boarnoah
	 */
	import net.flashpunk.Entity;
	
	public class score extends Entity
	{
		public var currentScore:uint = 0;
		
		public function score() 
		{
			name = "score";
		}
		
		public function updateScore(_addToScore:uint):void{
			currentScore += _addToScore;
		}
	}
}