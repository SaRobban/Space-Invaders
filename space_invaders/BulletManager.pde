enum Faction {
	ENEMY, PLAYER
}

class BulletManager{
	public ArrayList<Bullet> bulletsList;

	public BulletManager(){
		bulletsList = new ArrayList<Bullet>();
	}

	public ArrayList getListOfBullets(){
		return (bulletsList);
	}


	public void createBullet(PVector position, PVector direction, PVector size, float speed, Faction faction){
		Bullet newBullet = new Bullet(position, direction, size, speed, faction);
		bulletsList.add(newBullet);
	}


	public void createBullet(float posX, float posY, float dirX, float dirY, float sizeX, float sizeY, float speed, Faction faction){
		Bullet newBullet = new Bullet(new PVector(posX,posY), new PVector(dirX, dirY), new PVector(sizeX, sizeY), speed, faction);
		bulletsList.add(newBullet);
	}


	public void removeThisBullet(Bullet b) {
		removeThisBullet(bulletsList.indexOf(b));
	}

	public void removeThisBullet(int bulletIndex) {
		vFXManager.createABoom(bulletsList.get(bulletIndex).position);
		bulletsList.remove(bulletIndex);
	}


	public void clearBullets() {
		bulletsList.clear();
	}


	public void update(float deltaTime){
		for (int i = 0; i < bulletsList.size(); i++){
			Bullet bullet = bulletsList.get(i);
			bullet.update(deltaTime);

			// Remove offscreen bullets.
			if (bullet.position.x + bullet.size.x < 0 ||
				bullet.position.y + bullet.size.y < 0 ||
				bullet.position.x >= width ||
				bullet.position.y >= height) {

				bulletsList.remove(i);
				i--;
			}
		}
		//TODO: Loop twice is unnessesery
		checkCollision();
	}


	public void draw(){
		for (int i = 0; i < bulletsList.size(); i++){
			bulletsList.get(i).draw();
		}
	}

	public void checkCollision() {
		bullet_loop:
		for (int i = 0; i < bulletsList.size(); i++) {
			Bullet bullet = bulletsList.get(i);

			// Player collision.
			if (bullet.faction != Faction.PLAYER && !player.dead && player.isCollidingWith(bullet)) {
				removeThisBullet(i);
				player.getShot();
				i--;
				continue;
			}

			// Enemy collision.
			if (bullet.faction != Faction.ENEMY) {
				for (int j = 0; j < enemyManager.enemyList.size(); j++) {
					Enemy enemy = enemyManager.enemyList.get(j);
					if (enemy.isCollidingWith(bullet)) {
						removeThisBullet(i);
						enemy.getShot();
						i--;
						j--;
						continue bullet_loop;
					}
				}
			}

			// Shield collision.
			if (shieldManager.colliderTest(bullet.position)) {
				removeThisBullet(i);
				i--;
				continue;
			}

			// Bullet bullet collision
			for (int j = 0; j < bulletsList.size(); j++) {
				if (i == j) continue;
				Bullet bullet2 = bulletsList.get(j);
				if (bullet.faction == bullet2.faction) continue;
				if (bullet.isCollidingWith(bullet2)) {
					removeThisBullet(i);
					if (j >= i)
						j--;
					i--;
					removeThisBullet(j);
				}
			}
		}
	}

	public void reset() {
		bulletsList.clear();
	}
}