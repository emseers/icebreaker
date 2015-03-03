package 
{
	/**
	 * ...
	 * @author Boarnoah
	 */
	import net.flashpunk.Entity;
	import net.flashpunk.Sfx;
	import net.flashpunk.FP;
	
	public class music extends Entity
	{
		[Embed(source = "snd/snd_song_1.mp3")] private const SND_SONG_1:Class;
		//TODO add SND_MENU
		private var num_songs:int = 2;
		private var snd_song:Sfx; 
		
		public function music(_worldName:String) 
		{
			init(_worldName);
		}
		
		public function init(_worldName:String):void {
			name = "music";
			switch(_worldName){
				case "mainMenuWorld":
					//snd_song = new Sfx(SND_MENU, chooseSfx, "music");
					//snd_song.loop();
					break;
				case "gameWorld":
					chooseSfx();
					break;
				default:
					break;
			}
			snd_song.loop();
		}
		
		private function chooseSfx():void {
			var sfxNum:int = (int) ((Math.random() * num_songs) + 1);
			switch(sfxNum){
				case 1:
					loadSfx(SND_SONG_1);
					break;
				//TODO add song here
				default:
					loadSfx(SND_SONG_1);
					break;
			}
		}
		
		private function loadSfx(song:Class):void{
			snd_song = new Sfx(song, chooseSfx, "music");
			snd_song.play();
		}
		
		public function stopMusic():void{
			snd_song.stop();
		}
	}

}