class EnemyGroup {
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

		shootTimer = ENEMY_SHOOT_DELAY;
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

		if (newX <= ENEMY_FORMATION_WALL_PADDING) {
			newX = ENEMY_FORMATION_WALL_PADDING;
			velocity.x = -velocity.x;
		}
		else if (newX >= width - size.x - ENEMY_FORMATION_WALL_PADDING - 1) {
			newX = width - size.x - ENEMY_FORMATION_WALL_PADDING - 1;
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
			shootTimer = ENEMY_SHOOT_DELAY;
			shoot();
		}
	}

	private void recalculateBounds() {
		if (enemyCount <= 0) return;

		final float INF = 1/0f;

		float top = INF;
		float left = INF;
		float right = -INF;
		float bottom = -INF;

		for (int y = 0; y < numY; y++)
		for (int x = 0; x < numX; x++) {
			Enemy enemy = enemies[x][y];
			if (enemy == null) continue;

			if (enemy.position.x < left)
				left = enemy.position.x;

			if (enemy.position.y < top)
				top = enemy.position.y;

			if (enemy.position.x + enemy.size.x > right)
				right = enemy.position.x + enemy.size.x;

			if (enemy.position.y + enemy.size.y > bottom)
				bottom = enemy.position.y + enemy.size.y;
		}

		position.set(left, top);
		size.set(right - left, bottom - top);
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