package worlds 
{
	/**
	 * ...
	 * @author Boarnoah
	 */
	import block;
	import hud.gameOverlay;
	import net.flashpunk.World;
	import net.flashpunk.FP;

	public class gameWorld extends World
	{
		
		public function gameWorld() {

			//trace("Starting level: gameWorld");
			FP.console.enable();
			add(new background());
			add(new player());
			add(new gameControl());
			add(new score());
			add(new block("block"));
			add(new block("block"));
			add(new block("block"));
			add(new music("gameWorld"));
			add(new gameOverlay());
		}

	}

}