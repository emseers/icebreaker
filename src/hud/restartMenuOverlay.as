package hud 
{
	/**
	 * ...
	 * @author Boarnoah
	 */
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import worlds.gameWorld;
	
	public class restartMenuOverlay extends Entity
	{
		[Embed(source="../res/shitRestartButton.png")] private const SPR_RESTART_MENU_OVERLAY:Class;
		private var SPR_RESTART_MENU_OVERLAY_width:uint = 256;
		private var SPR_RESTART_MENU_OVERLAY_height:uint = 128;
		
		public function restartMenuOverlay() 
		{
			init();
		}
	
		override public function update():void{
			if (collidePoint(x, y, world.mouseX, world.mouseY)){
                if (Input.mouseReleased)
					restartGame();
				else if (Input.check(Key.ENTER)) {
					restartGame();
				}
			}
		}
		
		public function restartGame():void {
			trace("Restarting game...");
			FP.world = new gameWorld;
		}
		
		public function init():void {
			graphic = new Image(SPR_RESTART_MENU_OVERLAY);
			x = 400 - (SPR_RESTART_MENU_OVERLAY_width/2);
			y = 300 - (SPR_RESTART_MENU_OVERLAY_height / 2);
			layer = 0;
			Input.define("interact", Key.SPACE);
			setHitboxTo(graphic);
		}
	}
}