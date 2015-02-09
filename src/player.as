package 
{
	/**
	 * ...
	 * @author Boarnoah
	 */
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;

	//import block;
	public class player extends Entity
	{
		//{ region: Gfx/Input Variables
		//TODO: pass this to constructor then to the other thing
		private var WIDTH:uint = 800;
		private var HEIGHT:uint = 600;
		
		[Embed(source = "res/shitPlayerSheet.png")] private const SPR_SHEET_PLAYER:Class;
		[Embed(source = "res/shitArmSheet.png")] private const SPR_SHEET_ARM:Class;
		
		private var spr_player_height:uint = 64;
		private var spr_player_width:uint = 32;
		private var spr_arm_height:uint = 32;
		private var spr_arm_width:uint = 32;
		
		public var playerSpriteMap:Spritemap = new Spritemap(SPR_SHEET_PLAYER, spr_player_width, spr_player_height);
		public var armSpriteMap:Spritemap = new Spritemap(SPR_SHEET_ARM, spr_arm_width, spr_arm_height);
		public var playerChar:Graphiclist = new Graphiclist();
		
		public var currentArmAnimation:String = "hit_0";
		//} endregion: Gfx/Input Variables
		
		public var playerSpeed:uint = 2;
		public var punchingDisabled:Boolean = false;
		public var armReach:int = spr_arm_width + spr_player_width;
		public var timer:Number = 0;
		
		public function player() 
		{	
			//TODO: Remove ghetto centering once real sprites are here
			init();
			x = (WIDTH/4) - (spr_player_width*2);
			y = 300;
			trace("Loading player gfx...");

		}
		
		public function init():void{
			type = "playerchar";
			setupPlayerGfx();
			setHitbox(spr_player_width * 4, spr_player_height * 4);
			Input.define("punch", Key.SPACE);
		}
		
		override public function update():void {
			/*
			timer += FP.elapsed;
			if (timer >= 0.25) {
				trace("Disabled timer");
				punchingDisabled = false;	
				timer -= 0.25;
			}
			*/
			var collisionObject:block = collide("block", x, y) as block;
			if (collisionObject != null ) {
				collisionObject.collidable = false;
				trace("owh that really hurt");
				destroy();
			}
			checkInput();
		}
		
		public function checkInput():void{
				if (Input.pressed("punch")) {
					armSpriteMap.play("hit_1", true);
					//FP.world.create(bullet(x, y, 2), true);
					//
					var collisionObject:block = collide("block", (x + (armReach) * 4), y) as block;
					
					
					if (collisionObject != null ) {
						//trace("hit a block");
						collisionObject.destroy();
						//blockControl.destroy();
					}//TODO else for boss (rubick?)
				}
		}
		
		public function destroy():void{
			trace("GG GAME OVER");
			
			//TODO: play death animation
			world.getInstance("blockControl").gameOver();
		}
		
		/*
		 * With the player punches put hitbox as rect in front of player, wher ehte arm would be at full swing location
		 * iff the box hits in that hitbox to destroy
		 * try this for the ^ hitbox so that normal can reserve for player hitting the box itself i.e masks
		 * http://developers.useflashpunk.net/t/melee-attack-collisions/614/4
		 */
		
		public function animate():void {
			
		}
		
		public function setupPlayerGfx():void {
			//TODO: add actual highdef things
			playerSpriteMap.scale = 4;
			armSpriteMap.scale = 4;
			armSpriteMap.x += spr_player_width;
			armSpriteMap.y += spr_player_width;
			
			playerSpriteMap.add("run_1", [0, 1, 2], 9, true);
			armSpriteMap.add("hit_1", [0, 1, 2, 1, 0], 15, false);
			//armSpriteMap.add("hit_0", [0]);
			
			//TODO: Change this since standing idle also triggers the finishedPunch callback
			//armSpriteMap.callback = finishedPunch;
			
			playerChar.add(playerSpriteMap);
			playerChar.add(armSpriteMap);
			addGraphic(playerChar);
			playerSpriteMap.play("run_1");
		}
	}
}