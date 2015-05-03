package 
{
	/**
	 * ...
	 * @author Boarnoah(Emseers)
	 */
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	
	public class background extends Entity
	{	
		/**
		 * Idea is to have 2 entities at all times like this:
		 * |--Backdrop1--||--Backdrop2--|
		 *    |--CameraRegion--|
		 * cycle each entity as it goes offscreen to change gfx + change its .x
		 * to the other ones .x + width (to scroll infinintely)
		 */
		
		private var background_L0_1:Entity;
		private var background_L1_1:Entity;
		private var background_L2_1:Entity;
		private var background_L0_2:Entity;
		private var background_L1_2:Entity;
		private var background_L2_2:Entity;
		
		public function background() {
			trace("Created background...");
		}
		
		//NOTE: FP.world is null at init time, need to wait for entities to start
		//being added to it, before adding more entities to it
		override public function added():void {
			/**
			 * backgroundSections are single entities that make up the 6 pieces
			 * 2 for each layer of the background. Needs seperate entties since 
			 * they need to stay relative to each other (z wise) which is not 
			 * possible with a graphiclist
			 */
			background_L0_1 = new backgroundSection(0, 0)
			background_L1_1 = new backgroundSection(1, 0);
			background_L2_1 = new backgroundSection(2, 0);
			background_L0_2 = new backgroundSection(0, 1600);
			background_L1_2 = new backgroundSection(1, 1600);
			background_L2_2 = new backgroundSection(2, 1600);
			
			FP.world.add(background_L0_1);
			FP.world.add(background_L0_2);
			FP.world.add(background_L1_1);
			FP.world.add(background_L1_2);
			FP.world.add(background_L2_1);
			FP.world.add(background_L2_2);
		}
	}
}