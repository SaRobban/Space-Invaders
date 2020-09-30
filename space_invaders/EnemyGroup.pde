class EnemyGroup {
	static final float WALL_PADDING = 60;
	static final float SHOOT_DELAY = 1f;

	public PVector position;
	public PVector size;
	public PVector velocity;
	public int numX, numY;
	public Enemy[][] enemies;
	public int enemyCount;

	private float shootTimer;

	public EnemyGroup(PVector position, PVector size, PVector velocity, int numX, int numY) {
		this.position = position;
		this.size = size;
		this.velocity = velocity;
		this.numX = numX;
		this.numY = numY;
		enemies = new Enemy[numX][numY];
		enemyCount = numX * numY;

		shootTimer = SHOOT_DELAY;
	}

	public void update(float dt) {
		handleMovement(dt);
		handleShooting(dt);
	}

	public void onEnemyDead(Enemy enemy) {
		for (int y = 0; y < numY; y++)
		for (int x = 0; x < numX; x++) {
			if (enemies[x][y] == enemy) {
				enemies[x][y] = null;
				enemyCount -= 1;
			}
		}

		recalculateBounds();
	}

	private void handleMovement(float dt) {
		float newX = position.x + velocity.x * dt;
		float newY = position.y + velocity.y * dt;

		if (newX <= WALL_PADDING) {
			newX = WALL_PADDING;
			velocity.x = -velocity.x;
		}
		else if (newX >= width - size.x - WALL_PADDING - 1) {
			newX = width - size.x - WALL_PADDING - 1;
			velocity.x = -velocity.x;
		}

		float deltaX = newX - position.x;
		float deltaY = newY - position.y;
		position.set(newX, newY);

		for (int y = 0; y < numY; y++)
		for (int x = 0; x < numX; x++) {
			Enemy enemy = enemies[x][y];
			if (enemy != null)
				enemy.position.add(deltaX, deltaY);
		}
	}

	private void handleShooting(float dt) {
		shootTimer -= dt;
		if (shootTimer <= 0) {
			shootTimer = SHOOT_DELAY;
			shoot();
		}
	}

	private void recalculateBounds() {
		if (enemyCount <= 0) return;

		PVector min = new PVector(1/0f, 1/0f);
		PVector max = new PVector(-1/0f, -1/0f);

		for (int y = 0; y < numY; y++)
		for (int x = 0; x < numX; x++) {
			Enemy enemy = enemies[x][y];
			if (enemy == null) continue;

			if (enemy.position.x <= min.x && enemy.position.y <= min.y)
				min.set(enemy.position);

			if (enemy.position.x >= max.x && enemy.position.y >= max.y)
				max.set(enemy.position);
		}

		max.add(ENEMY_SIZE, ENEMY_SIZE);

		position.set(min);
		size.set(max.x - min.x, max.y - min.y);
	}

	private void shoot() {
		if (enemyCount <= 0) return;

		// TODO: Bad random loop, make better.
		random_loop:
		while (true) {
			int column = (int)random(numX);
			for (int y = numY - 1; y >= 0; y--) {
				Enemy enemy = enemies[column][y];
				if (enemy != null) {
					enemy.shoot();
					break random_loop;
				}
			}
		}
	}
}