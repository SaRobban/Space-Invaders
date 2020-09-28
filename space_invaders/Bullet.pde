class Bullet extends Entity{
	PVector velocity;

	Sprite bulletSprite;
	Bullet(PVector position, PVector velocity, float size){
		super(position.x, position.y, size);
		this.velocity = velocity;
		bulletSprite = new Sprite("Bullet", position);
	}

	Bullet(float posX, float posY, float velX, float velY, float size){
		super(posX, posY, size);
		bulletSprite = new Sprite("Bullet", position);
		this.velocity = new PVector(velX, velY);
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