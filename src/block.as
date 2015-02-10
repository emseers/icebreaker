package 
{
	/**
	 * ...
	 * @author Boarnoah
	 */
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	//Message from Ahmed
	public class block extends Entity
	{
		[Embed(source = "res/shitBrick_B1.png")] private const SPR_SHEET_BRICK:Class; // res/shitBrick.png
		
		private var spr_block_height:uint = 128;
		private var spr_block_width:uint = 32;
		private var speed:uint = 0;
		private var isDead:Boolean = false;
		
		public var blockSpriteMap:Spritemap = new Spritemap(SPR_SHEET_BRICK, spr_block_width, spr_block_height);
		
		public function block(_name:String) 
		{
			trace("Added block");
			init(_name);
		}
		
		public function init(_name:String):void{
			x =	800 + spr_block_width;
			y = 300;
			
			speed = 5;//_speed;
			
			type = _name;
			loadGfx();
			graphic = blockSpriteMap;
			blockSpriteMap.play("idle_0");
			setHitbox(spr_block_width * 4, spr_block_height * 4);
		}
		
		override public function update():void{
			x = x - speed;
			//blockSpriteMap.play("idle_0");
			
			// TO ensure block is out of view before "respawning"
			if(isDead){
				if (x < (0 - (spr_block_width * 4)))
					respawn();
			}
		}
		
		public function destroy():void{
			//trace("I IS EXPLODE");
			blockSpriteMap.play("destroy_0");
			isDead = true;
			collidable = false;
			world.getInstance("blockControl").updateBlocksPunched();
		}
		
		public function respawn():void{
			//TODO check if game is over yet if not spawn
			blockSpriteMap.play("idle_0");
			isDead = false;
			x = (int) ((Math.random() * (800 * 2)) + 400);
			collidable = true;
			trace("Spawned at: " + x);
		}
		
		public function loadGfx():void {
			//TODO remove ghetto scale and shitty moves
			blockSpriteMap.scale = 4;
			
			blockSpriteMap.y = 300 - (spr_block_height * 5);
			blockSpriteMap.add("idle_0", [0]);
			blockSpriteMap.add("destroy_0", [1, 2, 3], 15, false);
		}
	}
}