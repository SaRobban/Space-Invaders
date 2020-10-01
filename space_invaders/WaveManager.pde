// TODO: Increasing difficulty.

class WaveManager {
	public int wave;

	private PVector currentSpeed = new PVector();

	public void nextWave() {
		wave++;
		if (wave == 1)
			currentSpeed.set(ENEMY_SPEED);
		currentSpeed.mult(1.1f);

		enemyManager.createEnemyGroup(-220, ENEMY_SIZE.copy(), currentSpeed.copy(), 7, 4);
	}

	public void reset() {
		wave = 0;
		currentSpeed.set(ENEMY_SPEED);
	}
}