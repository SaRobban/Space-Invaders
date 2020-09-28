class Bullet extends Entity{
	float speed;
	Sprite bulletSprite;

	Bullet(PVector position, PVector direction, float speed, float size){
		super(position.x, position.y, size);
		super.direction = direction;
		this.speed = speed;
		bulletSprite = new Sprite("Bullet", position);
	}

	Bullet(float posX, float posY, float velX, float velY, float size){
		super(posX, posY, size);
		this.bulletSprite = new Sprite("Bullet", position);
		PVector velocity = new PVector(velX, velY);
		this.speed = velocity.mag();
		super.direction = velocity.normalize();
	}

	void setPositiion(PVector pos){
		position = pos;
	}

	void setPositiion(float posX, float posY){
		position.set(posX, posY);
	}

	void setMoveStep(PVector vel){
		position.add(vel);
	}

	void setMoveStep(float velX, float velY){
		position.x += velX;
		position.y += velY;
	}

	void draw(){
		bulletSprite.draw();
	}
}