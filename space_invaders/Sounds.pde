// Jonatan

//
// Sounds taken from: https://www.classicgaming.cc/classics/space-invaders/sounds
//

class Sounds {
	public SoundFile shoot;
	public SoundFile invaderKilled;
	public SoundFile explosion;
	public SoundFile ufo;

	public SoundFile music;

	public Sounds(PApplet applet) {
		shoot = new SoundFile(applet, "shoot.wav");
		invaderKilled = new SoundFile(applet, "invaderkilled.wav");
		explosion = new SoundFile(applet, "explosion.wav");
		ufo = new SoundFile(applet, "ufo_lowpitch.wav");

		music = new SoundFile(applet, "spaceinvaders1.mp3");
	}
}