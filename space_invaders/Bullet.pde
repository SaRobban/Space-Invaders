class Bullet extends Entity{
	float speed;
	Sprite bulletSprite;
	Faction faction;

	Bullet(PVector position, PVector direction, PVector size, float speed, Faction faction){
		super(position, direction, size);
		this.speed = speed;
		bulletSprite = new Sprite("Bullet");
		this.faction = faction;
	}


	public void setPosition(PVector pos){
		position = pos;
	}


	public void setPosition(float posX, float posY){
		position.set(posX, posY);
	}


	@Override
	public void update(float deltaTime){
		position.add(PVector.mult(direction, speed * deltaTime));
	}


	@Override
	public void draw(){
		//bulletSprite.draw(position);
		if(faction == faction.ENEMY){
			bulletSprite.drawEnemyBullet(position);
		}else{
			bulletSprite.draw(position);
		}
	}
}