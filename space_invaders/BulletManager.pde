class BulletManeger{
	public ArrayList<Bullet> bullets;
	int idOfBullets = 0;


	public BulletManeger(){
		bullets = new ArrayList<Bullet>();
	}


	public void createBullet(PVector position, PVector direction, float speed, PVector size){
		Bullet newBullet = new Bullet(position, direction, speed, size, idOfBullets);
		bullets.add(newBullet);
		idOfBullets++;
	}


	public void createBullet(float posX, float posY, float dirX, float dirY, float speed, PVector size){
		Bullet newBullet = new Bullet(new PVector(posX,posY), new PVector(dirX, dirY), speed, size, idOfBullets);
		bullets.add(newBullet);
		idOfBullets++;
	}


	public void removeABullet(Bullet b){
		for (int i = bullets.size() - 1; i >= 0; i--) {
			Bullet bComp = bullets.get(i);
			if (bComp.id == b.id) {
				bullets.remove(i);
			}
		}
	}


	public void removeThisBullet(int id){
		bullets.remove(id);
	}


	@Override
	public void update(float deltaTime){
		for (int i = 0; i < bullets.size(); i++){
			bullets.get(i).update(deltaTime);
		}
	}


	@Override
	public void draw(){
		for (int i = 0; i < bullets.size(); i++){
			bullets.get(i).draw();
		}
	}

	public void checkCollision(){
		for(int i = 0; i < bullets.size(); i++){
			if(shield.colliderTest(bullets.get(i).position)){
				removeThisBullet(i);
			}
		}
	}
}