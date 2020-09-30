class EnemyManager{
	public ArrayList<Enemy> enemyList;
	public ArrayList<EnemyGroup> groups;

	public EnemyManager(){
		enemyList = new ArrayList<Enemy>();
		groups = new ArrayList<EnemyGroup>();
	}


	public void createEnemyGroup(float positionY, PVector enemySize, PVector enemySpeed, int numX, int numY) {
		float spacing = ENEMY_FORMATION_SPACING;
		float strideX = enemySize.x + spacing;
		float strideY = enemySize.y + spacing;

		PVector groupSize = new PVector(strideX * numX - spacing, strideY * numY - spacing);
		PVector groupPos = new PVector((width - groupSize.x) / 2, positionY);

		EnemyGroup group = new EnemyGroup(groupPos, groupSize, enemySpeed, numX, numY);

		for (int y = 0; y < numY; y++)
		for (int x = 0; x < numX; x++) {
			PVector pos = new PVector(groupPos.x + strideX * x, groupPos.y + strideY * y);
			Enemy enemy = new GroupEnemy(pos, new PVector(0, 1), ENEMY_SIZE.copy(), group);

			enemyList.add(enemy);
			group.enemies[x][y] = enemy;
		}

		groups.add(group);
	}


	public ArrayList getListOfEnemys(){
		return(enemyList);
	}


	public void addEnemyToList(PVector position, PVector direction, PVector size, float speed){
		enemyList.add(new MovingEnemy(position, direction, size, speed));
	}

	public void addEnemyToList(float posX, float posY, float dirX, float dirY, float sizeX, float sizeY, float speed){
		enemyList.add(new MovingEnemy(new PVector(posX, posY), new PVector(dirX, dirY), new PVector(sizeX, sizeY), speed));
	}


	public void removeEnemyFromList(Enemy e){
		enemyList.remove(e);
	}


	public void onEnemyDead(Enemy enemy) {
		removeEnemyFromList(enemy);
	}


	public void update(float deltaTime){
		for (int i = 0; i < groups.size(); i++) {
			EnemyGroup group = groups.get(i);
			group.update(deltaTime);

			// Remove empty groups.
			if (group.enemyCount <= 0) {
				groups.remove(i);
				i--;
			}
		}

		for (int i = 0; i < enemyList.size(); i++){
			Enemy enemy = enemyList.get(i);
			enemy.update(deltaTime);

			// Lose if enemy hit the bottom of the screen.
			if (enemy.position.y + enemy.size.y >= height - 1) {
				gameOver();
			}
		}

		if (enemyList.size() <= 0) {
			gameOver();
		}
	}


	public void draw(){
		for (int i = 0; i < enemyList.size(); i++){
			enemyList.get(i).draw();
		}
	}

	public void reset() {
		groups.clear();
		enemyList.clear();
	}
}