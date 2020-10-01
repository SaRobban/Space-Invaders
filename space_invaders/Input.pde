class Input {
	public boolean left, right;
	public boolean fire, fireDown;
	public boolean anyKey, anyKeyDown;
	public boolean pause, pauseDown;

	private boolean oldFire, oldPause;

	public void keyPressed() {
		onKey(true);
	}

	public void keyReleased() {
		onKey(false);
	}

	public void update() {
		anyKeyDown = false;

		if (keyPressed) {
			if (!anyKey) {
				anyKeyDown = true;
				anyKey = true;
			}
		}
		else {
			anyKey = false;
		}

		fireDown = !oldFire && fire;
		if (fireDown) oldFire = fire;

		pauseDown = !oldPause && pause;
		if (pauseDown) oldPause = pause;
	}

	private void onKey(boolean pressed) {
		if (keyCode == LEFT || key == 'a') {
			left = pressed;
		}
		else if (keyCode == RIGHT || key == 'd') {
			right = pressed;
		}
		else if (keyCode == UP || key == 'w' || key == ' ') {
			oldFire = fire;
			fire = pressed;
		}
		else if (keyCode == ESC) {
			oldPause = pause;
			pause = pressed;

			// Hack to prevent processing from quitting when escape is pressed.
			key = 0;
		}
	}
}
