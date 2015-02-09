package
{
	/**
	 * ...
	 * @author Boarnoah
	 */
	
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import worlds.gameWorld;
	
	public class Main extends Engine 
	{
		private var WIDTH:uint = 800;
		private var HEIGHT:uint = 600;
		
		public function Main() 
		{
			super(WIDTH, HEIGHT, 60, false);
			//TODO: Go to menu first
			FP.world = new gameWorld;
			//FP.screen.scale = 2;
		}
		
		override public function init():void 
		{
			trace("Starting game, IceBreaker Clone by the Emseers (youtube.com/emseers)");
		}
	}
}