package 
{
	/**
	 * ...
	 * @author Boarnoah
	 */
	import net.flashpunk.Entity;
	
	public class bullet extends Entity 
	{
		var speed = 0;
		var WIDTH = 800;
		public function bullet(_x:int, _y:int, _speed:int) 
		{
			trace("Created punch \"bullet\"");
			init(_x, _y, _speed);
		}
		
		public function init(_x:int, _y:int, _speed:int):void{
			x = _x;
			y = _y;
			setHitbox(16,16,x,y);
			speed = _speed;
		}
		
		override public function update():void{
			x = x + speed;
		}
	}
}