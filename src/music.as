package 
{
	/**
	 * ...
	 * @author Boarnoah
	 */
	import net.flashpunk.Entity;
	import net.flashpunk.Sfx;
	public class music extends Entity
	{
		[Embed(source = "snd/snd_song_0.mp3")] private const SND_SONG_0:Class;
		private var snd_song1:Sfx = new Sfx(SND_SONG_0, null,"music");	
		public function music() 
		{
			init();
		}
		
		public function init():void {
			name = "music";
			snd_song1.loop();
		}
		
		public function stopMusic():void{
			snd_song1.stop();
		}
	}

}