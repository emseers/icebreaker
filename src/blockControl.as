package 
{
	/**
	 * ...
	 * @author Boarnoah
	 */
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import worlds.gameOverWorld;
	import net.flashpunk.graphics.Image;
	import flash.display.BitmapData;
	import flash.filters.BlurFilter;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.Point;
	import Array;
	public class blockControl extends Entity
	{
		public var blocksPunched:int = 0;
		//public var test:int = 0;
		public function blockControl() 
		{
			trace("Started block control");
			name = "blockControl";
		}
		
		override public function update():void{
			/*
			if(test == 0){
				test = 1;
				//FP.world.create(block, true);
				//super.update();
			}
			*/
		}
		
		public function updateBlocksPunched():void{
			blocksPunched += 1;
			
			trace("Block punched, new count: " + blocksPunched);
			
			if(blocksPunched > 20)
				trace("Spawnining big block");
			
		}
		
		public function gameOver():void{
			trace("Game is now over");
			var screenShot:Image = generateScreenShot();
			FP.world = new gameOverWorld(screenShot);
		}
		
		public function generateScreenShot():Image{
			var screenData:BitmapData = FP.buffer.clone();
			
			// Add blur filter
			screenData.applyFilter(screenData, screenData.rect, new Point(),new BlurFilter(4, 4, 4));
			
			// Add B&W filter 
			//courtesy of (http://forum.starling-framework.org/topic/is-there-a-way-to-desaturate-of-texture#post-6705)
			//var bitmapData:BitmapData = new Logo().bitmapData;
			var matrix:Array = new Array();
			matrix=matrix.concat([0.5,0.5,0.5,0,0]); // Red
			matrix=matrix.concat([0.5,0.5,0.5,0,0]); // Green
			matrix=matrix.concat([0.5,0.5,0.5,0,0]); // Blue
			matrix = matrix.concat([0, 0, 0, 1, 0]); // Alpha
			
			var bwFilter:ColorMatrixFilter = new ColorMatrixFilter(matrix);
			screenData.applyFilter(screenData, screenData.rect, new Point(), bwFilter);

			
			return new Image(screenData);//screenshot as Image;
		}
		public function destroy():void{
			trace("Destroyed a block");
		}
		//TODO: dynamically add blocks and move em arround based on difficulty
		
	}

}