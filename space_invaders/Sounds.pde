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

	public Sound sound;

	public Sounds(PApplet applet) {
		sound = new Sound(applet);
		sound.volume(0.5f);

		shoot = new SoundFile(applet, "shoot.wav");
		invaderKilled = new SoundFile(applet, "invaderkilled.wav");
		explosion = new SoundFile(applet, "explosion.wav");
		ufo = new SoundFile(applet, "ufo_lowpitch.wav");

		shoot.amp(0.3f);
		invaderKilled.amp(0.3f);
		explosion.amp(0.3f);
		ufo.amp(0.3f);

		music = new SoundFile(applet, "spaceinvaders1.wav");
	}
}