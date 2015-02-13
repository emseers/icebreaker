package worlds 
{
	//import flash.display.BitmapData;
	import hud.restartMenuOverlay;
	import hud.mainMenuButton;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Boarnoah
	 */
	public class gameOverWorld extends World
	{
		
		public function gameOverWorld(_screenshot:Image) 
		{
			init(_screenshot);
		}
		
		public function init(_screenshot:Image):void {
			add(new worldScreenShot(_screenshot));
			add(new hud.restartMenuOverlay());
			add(new hud.mainMenuButton());
		}
	}

}