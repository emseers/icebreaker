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

	public class mMenuOverlay extends Entity
	{
		//[Embed(source="../res/shitStartButton.png")] 
		[Embed(source="../res/shitStartMenu.png")] private const SPR_MAIN_MENU_OVERLAY:Class;
		//[Embed(source="../res/shitRestartButton.png")] private const SPR_RESTART_MENU_OVERLAY:Class;
		private var playBtn_x:int = 16;
		private var playBtn_y:int = 250;
		private var playBtn_width:int = 256;
		private var playBtn_height:int = 128;
		
		private var emBtn_x:int = 675;
		private var emBtn_y:int = 170;
		private var emBtn_width:int = 128;
		private var emBtn_height:int = 128;
		
		private var fpBtn_x:int = 600;
		private var fpBtn_y:int = 500;
		private var fpBtn_width:int = 128;
		private var fpBtn_height:int = 128;
		
		public function mMenuOverlay() 
		{
			trace("Added playbutton");
			init();
		}
		
		override public function update():void{
			if (Input.mouseReleased) {
				if (mouseInRegion(playBtn_x, playBtn_y, playBtn_width, playBtn_height))
					startGame();
				else if (mouseInRegion(emBtn_x, emBtn_y, emBtn_width, emBtn_height))
					emButton();
				else if (mouseInRegion(fpBtn_x, fpBtn_y, fpBtn_width, fpBtn_height))
					fpButton();
			}else if (Input.pressed("interact")){
				startGame();
			}
		}
		
		private function mouseInRegion(xX:int, yY:int, width:int, height:int):Boolean{
			var mouseX:int = Input.mouseX;
			var mouseY:int = Input.mouseY;
			
			if(mouseX >= xX && mouseX <= (xX + width)){
				if(mouseY >= yY && mouseY <= (yY + height)){
					return true;
				}else
					return false;
			}else
				return false;
		}
		
		private function startGame():void { 
			FP.world = new gameWorld;
		}
		
		// Emseers button
		private function emButton():void { 
			//TODO open to emseers page (github of game or youtube, i would suggest github)
		}
		
		// Flashpunk button
		private function fpButton():void { 
			//TODO open tab to flashpunk
		}
		
		private function init():void{
			graphic = new Image(SPR_MAIN_MENU_OVERLAY);
			//graphic = new Image(SPR_RESTART_MENU_OVERLAY);
			Input.define("interact", Key.SPACE);
		}
	}
}