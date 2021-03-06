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

		shoot = new SoundFile(applet, "sound/shoot.wav");
		invaderKilled = new SoundFile(applet, "sound/invaderkilled.wav");
		explosion = new SoundFile(applet, "sound/explosion.wav");
		ufo = new SoundFile(applet, "sound/ufo_lowpitch.wav");
		music = new SoundFile(applet, "sound/spaceinvaders1.wav");

		shoot.amp(0.25f);
		invaderKilled.amp(0.25f);
		explosion.amp(0.25f);
		ufo.amp(0.25f);
	}
}