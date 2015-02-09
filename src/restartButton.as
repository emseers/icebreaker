package 
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
	
	public class restartButton extends Entity
	{
		[Embed(source="res/shitRestartButton.png")] private const SPR_RESTART_BTN:Class;
		private var spr_restart_btn_width:uint = 256;
		private var spr_restart_btn_height:uint = 128;
		
		public function restartButton() 
		{
			init();
		}
	
		override public function update():void{
			if (collidePoint(x, y, world.mouseX, world.mouseY)){
                if (Input.mouseReleased)
					restartGame();
			}else if (Input.pressed("interact")){
				restartGame();
			}
		}
		
		public function restartGame():void {
			trace("Restarting game...");
			FP.world = new gameWorld;
		}
		
		public function init():void {
			graphic = new Image(SPR_RESTART_BTN);
			x = 400 - (spr_restart_btn_width/2);
			y = 300 - (spr_restart_btn_height / 2);
			Input.define("interact", Key.SPACE);
			setHitboxTo(graphic);
		}
	}
}