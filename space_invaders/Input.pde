class Input {
	public boolean left, right;
	public boolean fire;

	public boolean anyKey;
	public boolean anyKeyDown;

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
	}

	private void onKey(boolean pressed) {
		if (keyCode == LEFT || key == 'a') {
			left = pressed;
		}
		else if (keyCode == RIGHT || key == 'd') {
			right = pressed;
		}
		else if (keyCode == UP || key == 'w' || key == ' ') {
			fire = pressed;
		}
	}
}
