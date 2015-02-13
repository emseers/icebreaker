package hud 
{
	/**
	 * ...
	 * @author Poisonrune
	 */
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import worlds.gameWorld;
	import worlds.mainMenuWorld;
	
	public class mainMenuButton extends Entity
	
	{
		[Embed(source="../res/shitMainmButton.png")] private const SPR_MAIN_BUTTON_OVERLAY:Class;
		private var SPR_MAIN_BUTTON_OVERLAY_width:uint = 256;
		private var SPR_MAIN_BUTTON_OVERLAY_height:uint = 128;
		
		public function mainMenuButton() 
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
			trace("Returning to main menu...");
			FP.world = new mainMenuWorld;
		}
		
		public function init():void {
			graphic = new Image(SPR_MAIN_BUTTON_OVERLAY);
			x = 400 - (SPR_MAIN_BUTTON_OVERLAY_width/2);
			y = 450 - (SPR_MAIN_BUTTON_OVERLAY_height / 2);
			Input.define("interact", Key.SPACE);
			setHitboxTo(graphic);
		}
	}

}
