package worlds 
{
	/**
	 * ...
	 * @author Boarnoah
	 */
	import block;
	import net.flashpunk.World;
	import net.flashpunk.FP;

	public class gameWorld extends World
	{
		
		public function gameWorld() {

			//trace("Starting level: gameWorld");
			FP.console.enable();
			add(new background());
			add(new player());
			add(new blockControl());
			add(new block("block"));
		}

	}

}