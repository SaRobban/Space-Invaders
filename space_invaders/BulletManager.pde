class BulletManeger{
	ArrayList<Bullet> bullets;
	int idOfBullets = 0;


	BulletManeger(){
		bullets = new ArrayList<Bullet>();
	}


	void createBullet(PVector position, PVector direction, float speed, float size){
		Bullet newBullet = new Bullet(position, direction, speed, size, idOfBullets);
		bullets.add(newBullet);
		idOfBullets++;
	}

	void createBullet(float posX, float posY, float dirX, float dirY, float speed, float size){
		Bullet newBullet = new Bullet(new PVector(posX,posY), new PVector(dirX, dirY), speed, size, idOfBullets);
		bullets.add(newBullet);
		idOfBullets++;
	}


	void removeABullet(Bullet b){
		for (int i = bullets.size() - 1; i >= 0; i--) {
			Bullet bComp = bullets.get(i);
			if (bComp.id == b.id) {
				bullets.remove(i);
			}
		}
	}

	void removeThisBullet(int id){
		bullets.remove(id);
	}

	
	void moveStep(float deltaTime){
		for (int i = 0; i < bullets.size(); i++){
			bullets.get(i).moveStep(deltaTime);
		}
	}

	void draw(){
		for (int i = 0; i < bullets.size(); i++){
			bullets.get(i).draw();
		}
	}

	void checkCollision(){
		for(int i = 0; i < bullets.size(); i++){
			if(shield.colliderTest(bullets.get(i).position)){
				removeThisBullet(i);
			}

		}
	}
}