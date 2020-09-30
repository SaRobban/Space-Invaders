// TODO: Increasing difficulty.

class WaveManager {
	public int wave;

	public void nextWave() {
		wave++;
		enemyManager.reset();
		enemyManager.createEnemyGroup(100, ENEMY_SIZE, ENEMY_SPEED, 7, 4);
	}

	public void reset() {
		wave = 0;
	}
}