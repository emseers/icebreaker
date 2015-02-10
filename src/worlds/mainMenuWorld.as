package worlds 
{
	/**
	 * ...
	 * @author Boarnoah
	 */
	import hud.mMenuOverlay;
	import net.flashpunk.World;
	
	public class mainMenuWorld extends World 
	{
		
		public function mainMenuWorld() 
		{
			trace("Starting main menu...");
			init();
		}
		
		public function init():void {
			add(new background());
			add(new hud.mMenuOverlay());
		}
	}

}