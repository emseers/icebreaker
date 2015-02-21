package 
{
	/**
	 * ...
	 * @author Boarnoah
	 */
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Graphiclist;
	
	public class background extends Entity
	{
		[Embed(source = "res/shitBckg_B0.png")] private const SPR_Bckg0:Class;
		[Embed(source = "res/shitBckg_B1.png")] private const SPR_Bckg1:Class;
		[Embed(source = "res/shitBckg_B2.png")] private const SPR_Bckg2:Class;
		private var backDrop_0:Backdrop;
		private var backDrop_1:Backdrop;
		private var backDrop_2:Backdrop;
		private var speedFactor:int = -2;
		public function background() 
		{
			trace("Setting up backdrop...");
			backDrop_0 = new Backdrop(SPR_Bckg0, true, true);
			backDrop_1 = new Backdrop(SPR_Bckg1, true, true);
			backDrop_2 = new Backdrop(SPR_Bckg2, true, true);
			
			var backDrop:Graphiclist = new Graphiclist(backDrop_0, backDrop_1, backDrop_2);
			graphic = backDrop;
		}
		
		override public function update():void {
			//TODO: Fix to repeat in range, wihtout skipping behaviour, tween maybe?
			backDrop_0.x += 1 * speedFactor;
			backDrop_1.x += 3 * speedFactor;
			backDrop_2.x += 6 * speedFactor;
		}
	}

}