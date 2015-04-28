package 
{
	/**
	 * ...
	 * @author Boarnoah(Emseers)
	 */
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	
	public class background extends Entity
	{
		[Embed(source="res/shitBckg_L0_1.png")] private const SPR_BCKG_L0_1:Class;
		[Embed(source = "res/shitBckg_L1_1.png")] private const SPR_BCKG_L1_1:Class;
		[Embed(source = "res/shitBckg_L2_1.png")] private const SPR_BCKG_L2_1:Class;
		[Embed(source="res/shitBckg_L0_2.png")] private const SPR_BCKG_L0_2:Class;
		[Embed(source = "res/shitBckg_L1_2.png")] private const SPR_BCKG_L1_2:Class;
		[Embed(source = "res/shitBckg_L2_2.png")] private const SPR_BCKG_L2_2:Class;
		
		/**
		 * Idea is to have 2 entities at all times like this:
		 * |--Backdrop1--||--Backdrop2--|
		 *    |--CameraRegion--|
		 * cycle each entity as it goes offscreen to change gfx + change its .x
		 * to the other ones .x + width (to scroll infinintely)
		 */
		
		public var WIDTH:int = 1600;
		public var HEIGHT:int = 800;
		
		private var speedFactor:int = -2;
		
		private var background_L0_1:Image;
		private var background_L1_1:Image;
		private var background_L2_1:Image;
		private var background_L0_2:Image;
		private var background_L1_2:Image;
		private var background_L2_2:Image;
		
		private var backgroundList:Graphiclist;
		
		public function background(){
			init();
		}
		
		private function init():void{
			background_L0_1 = new Image(SPR_BCKG_L0_1);
			background_L1_1 = new Image(SPR_BCKG_L1_1);
			background_L2_1 = new Image(SPR_BCKG_L2_1);
			background_L0_2 = new Image(SPR_BCKG_L0_2);
			background_L1_2 = new Image(SPR_BCKG_L1_2);
			background_L2_2 = new Image(SPR_BCKG_L2_2);
			
			background_L0_1.x = 0;
			background_L1_1.x = 0;
			background_L2_1.x = 0;
			background_L0_2.x = 1600;
			background_L1_2.x = 1600;
			background_L2_2.x = 1600;
			
			backgroundList = new Graphiclist(background_L0_1, background_L0_2,
											background_L1_1, background_L1_2,
											background_L2_1, background_L2_2);
			graphic = backgroundList;
		}
		
		override public function update():void{
			moveBackground(background_L0_1, 2);
			moveBackground(background_L1_1, 4);
			moveBackground(background_L2_1, 8);
			moveBackground(background_L0_2, 2);
			moveBackground(background_L1_2, 4);
			moveBackground(background_L2_2, 8);
		}
		
		private function loadImage(_background_layer:Image, image:Class, position:int):void{
			
		}
		
		private function moveBackground(background_layer:Image, speed:int):void{
			background_layer.x += speedFactor * speed;
			if ((background_layer.x + WIDTH) == 0)
				background_layer.x = 1600;
		}
	}
}