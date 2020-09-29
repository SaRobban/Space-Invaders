class Input {
	public boolean left, right;
	public boolean fire;

	public void keyPressed() {
		onKey(true);
	}

	public void keyReleased() {
		onKey(false);
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
