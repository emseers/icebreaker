package 
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Entity;
	/**
	 * ...
	 * @author Boarnoah
	 */
	public class worldScreenShot extends Entity
	{
		
		public function worldScreenShot(_screenshot:Image) 
		{
			trace("Showing the goods");
			init(_screenshot);
		}
		
		public function init(_screenshot:Image):void{
			graphic = _screenshot;
		}
		
	}

}