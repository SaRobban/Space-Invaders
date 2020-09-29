class BulletManager{
	public ArrayList<Bullet> bulletsList;
	int bulletNumber = 0;


	public BulletManager(){
		bulletsList = new ArrayList<Bullet>();
	}

	public ArrayList getListOfBullets(){
		return (bulletsList);
	}


	public void createBullet(PVector position, PVector direction, PVector size, float speed){
		Bullet newBullet = new Bullet(position, direction, size, speed, bulletNumber);
		bulletsList.add(newBullet);
		bulletNumber++;
	}


	public void createBullet(float posX, float posY, float dirX, float dirY, float sizeX, float sizeY, float speed){
		Bullet newBullet = new Bullet(new PVector(posX,posY), new PVector(dirX, dirY), new PVector(sizeX, sizeY), speed, bulletNumber);
		bulletsList.add(newBullet);
		bulletNumber++;
	}


	public void removeThisBullet(Bullet b){
		bulletsList.remove(b);
	}


	public void update(float deltaTime){
		for (int i = 0; i < bulletsList.size(); i++){
			bulletsList.get(i).update(deltaTime);
		}
	}


	public void draw(){
		for (int i = 0; i < bulletsList.size(); i++){
			bulletsList.get(i).draw();
		}
	}

	public void checkCollision(){
		for(int i = 0; i < bulletsList.size(); i++){
			Bullet bullet = bulletsList.get(i);

			if(shield.colliderTest(bullet.position)){
				bulletsList.remove(i);
				i -= 1;
			}
			else if (player.isCollidingWith(bullet)) {
				bulletsList.remove(i);
				player.getShot();
			}
			else {
				for (int j = 0; j < enemyManager.enemyList.size(); j++) {
					Enemy enemy = enemyManager.enemyList.get(j);
					if (enemy.isCollidingWith(bullet)) {
						bulletsList.remove(i);
						enemyManager.enemyList.remove(j);
						i -= 1;
						j -= 1;
					}
				}
			}
		}
	}
}