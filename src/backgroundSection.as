package{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Boarnoah(Emseers)
	 */
	public class backgroundSection extends Entity {
		[Embed(source="res/shitBckg_L0_1.png")] private const SPR_BCKG_L0_1:Class;
		[Embed(source = "res/shitBckg_L1_1.png")] private const SPR_BCKG_L1_1:Class;
		[Embed(source = "res/shitBckg_L2_1.png")] private const SPR_BCKG_L2_1:Class;
		[Embed(source="res/shitBckg_L0_2.png")] private const SPR_BCKG_L0_2:Class;
		[Embed(source = "res/shitBckg_L1_2.png")] private const SPR_BCKG_L1_2:Class;
		[Embed(source = "res/shitBckg_L2_2.png")] private const SPR_BCKG_L2_2:Class;
		
		public var layerType:int;
		
		public var WIDTH:int = 1600;
		public var HEIGHT:int = 800;
		public var NUM_SKINS:int = 2;
		
		private var speedFactor:int = -2;
		private var speed:int;
		
		private var currentImageIndex:uint;
		private var currentImage:Image;
		
		public function backgroundSection(_layerType:int, _x:int) {
			layerType = _layerType;
			x = _x;
			
			switch(layerType){
				case 0:
					layer = 4;
					speed = 2;
					break;
				case 1:
					layer = 3;
					speed = 4;
					break;
				case 2:
					layer = 2;
					speed = 8;
					break;
				default:
					layer = 4;
					speed = 2;
					break;
			}
			
			changeImage();
		}
		
		override public function update():void {
			x += speedFactor * speed;
			if((x + WIDTH) == 0){
				changeImage();
				x = 1600;
			}
		}
		
		private function changeImage():void {
			var newImageIndex:uint = (uint) ((Math.random() * NUM_SKINS) + 1); 
			
			if(newImageIndex != currentImageIndex){
				if(layerType == 0){
					switch(newImageIndex){
						case 1:
							loadImage(SPR_BCKG_L0_1);
							break;
						case 2:
							loadImage(SPR_BCKG_L0_2);
							break;
						default:
							loadImage(SPR_BCKG_L0_1);
							break;
					}
				}else if(layerType == 1){
					switch(newImageIndex){
						case 1:
							loadImage(SPR_BCKG_L1_1);
							break;
						case 2:
							loadImage(SPR_BCKG_L1_2);
							break;
						default:
							loadImage(SPR_BCKG_L1_1);
							break;
					}
				}else if(layerType == 2){
					switch(newImageIndex){
						case 1:
							loadImage(SPR_BCKG_L2_1);
							break;
						case 2:
							loadImage(SPR_BCKG_L2_2);
							break;
						default:
							loadImage(SPR_BCKG_L2_1);
							break;
					}
				}
				
				currentImageIndex = newImageIndex;
			}else{
				x = WIDTH;
			}
		}
		
		private function loadImage(_image:Class):void {
			currentImage = new Image(_image);
			graphic = currentImage;
		}
	}	
}