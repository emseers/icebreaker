package hud 
{
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Input;
	/**
	 * ...
	 * @author Boarnoah
	 */
	public class gameOverlay extends Entity
	{
		[Embed(source = "../res/shitMusicControl.png")] private const SPR_MUSIC_CONTROL:Class;
		[Embed(source = "../res/shitSoundControl.png")] private const SPR_SOUND_CONTROL:Class;
		
		private var gameOverlayGfxList:Graphiclist;
		private var musicControl:Spritemap;
		private var soundControl:Spritemap;
		
		private var spr_button_width:int = 64;
		private var spr_button_height:int = 64;
		private var musicCtrl_X:int = 650;
		private var musicCtrl_Y:int = 0;
		private var soundCtrl_X:int = musicCtrl_X + (spr_button_width);
		private var soundCtrl_Y:int = 0;
		
		
		private var musicCtrlSpriteMap:Spritemap; 
		private var soundCtrlSpriteMap:Spritemap; 
		
		public function gameOverlay() 
		{
			init();
		}
		
		private function init():void {
			musicCtrlSpriteMap = new Spritemap(SPR_MUSIC_CONTROL, spr_button_width, spr_button_height);
			soundCtrlSpriteMap = new Spritemap(SPR_SOUND_CONTROL, spr_button_width, spr_button_height);
			
			musicCtrlSpriteMap.x = musicCtrl_X;
			musicCtrlSpriteMap.y = musicCtrl_Y;
			soundCtrlSpriteMap.x = soundCtrl_X;
			soundCtrlSpriteMap.y = soundCtrl_Y;
			
			gameOverlayGfxList = new Graphiclist(musicCtrlSpriteMap, soundCtrlSpriteMap);
			graphic = gameOverlayGfxList;
		}
				
		// TODO Externalise function to utils class
		/**
		 * FUNCTION is also used in gameOverlay
		 * Returns boolean of whether cursor is within a box
		 * Parameters: (top left x, top left y, width of box, height of box)
		 * @return true/false based on cursors location in box
		 * 
		 **/
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
	}

}