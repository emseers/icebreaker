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
		[Embed(source = "res/shitBrick_B1.png")] private const SPR_SHEET_BRICK_B0:Class; // res/shitBrick.png
		[Embed(source="res/shitBrick_B2.png")] private const SPR_SHEET_BRICK_B1:Class; 
		
		private var spr_block_height:uint = 128;
		private var spr_block_width:uint = 32;
		private var num_skins:int = 2;
		
		private var speed:uint = 0;
		private var isDead:Boolean = false;
		private var enemyType:uint = 0;
		private var spawnX:int;
		public var blockSpriteMap:Spritemap;
		
		public function block(_name:String) 
		{
			trace("Added block");
			init(_name);
		}
		
		public function init(_name:String):void{
			x =	(int) ((Math.random() * (800 * 4)) + 800);//800 + spr_block_width;
			y = 300;
			
			speed = 5 * 2;
			
			type = _name;
			loadGfx(SPR_SHEET_BRICK_B0);
			
			blockSpriteMap.play("idle_0");
			setHitbox(spr_block_width * 4, spr_block_height * 4, 0 - (spr_block_width),0);
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
		
		public function destroy(_playerx:int, _playerArmReach:int):void{
			//trace("I IS EXPLODE");
			blockSpriteMap.play("destroy_0");
			isDead = true;
			collidable = false;
			
			var distToPlayer:int = x - _playerx;
			//if(distToPlayer <= 0
			world.getInstance("blockControl").updateBlocksPunched();
			world.getInstance("score").updateScore(5);
		}
		
		public function respawn():void{
			//TODO check if game is over yet if not spawn
			blockSpriteMap.play("idle_0");
			isDead = false;
			do{
				spawnX = (int) ((Math.random() * (800 * 4)) + 800);
			}while (isPosEmpty(spawnX));
			x = spawnX;
			var prevEnemyType:uint = enemyType;
			enemyType = (uint) ((Math.random() * num_skins) + 1);
			trace(enemyType);
			if (prevEnemyType != enemyType) {
				trace("Changed enemy type...");
				changeSkin(enemyType);
			}
			collidable = true;
			trace("Spawned at: " + x);
		}
		
		private function isPosEmpty(_spawnX:int):Boolean{
			var positionOccupied:Boolean = false;
			var blockList:Array = [];
			world.getClass(block, blockList);
			
			for each (var e:block in blockList){
				if((_spawnX <= e.x + spr_block_width + (spr_block_width/2)) && (_spawnX >= e.x - (spr_block_width/2))){
					positionOccupied = false;
					return positionOccupied
				}
			}
			
			return positionOccupied;
		}
		
		public function getEnemyType():uint{
			return enemyType;
		}
		
		public function changeSkin(_enemyType:uint):void{
			switch(_enemyType){
				case 1:
					loadGfx(SPR_SHEET_BRICK_B0);
					break;
				case 2:
					loadGfx(SPR_SHEET_BRICK_B1);
					break;
				default:
					loadGfx(SPR_SHEET_BRICK_B0);
					break;
			}
		}
		
		public function loadGfx(_SPR_SHEET:Class):void {
			//TODO remove ghetto scale and shitty moves
			blockSpriteMap = new Spritemap(_SPR_SHEET, spr_block_width, spr_block_height);
			blockSpriteMap.scale = 4;
			blockSpriteMap.y = 300 - (spr_block_height * 5);
			blockSpriteMap.add("idle_0", [0]);
			blockSpriteMap.add("destroy_0", [1, 2, 3], 15, false);
			graphic = blockSpriteMap; 
			//super.update();
		}
	}
}