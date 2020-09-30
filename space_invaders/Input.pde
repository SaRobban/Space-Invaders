class Input {
	public boolean left, right;
	public boolean fire, fireDown;
	public boolean anyKey, anyKeyDown;

	private boolean oldFire;

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
	}
}
