class Bullet extends Entity{
	int id;
	float speed;
	Sprite bulletSprite;

	Bullet(PVector position, PVector direction, float speed, float size, int id){
		super(position.x, position.y, size);
		super.direction = direction;
		this.speed = speed;
		bulletSprite = new Sprite("Bullet");
	}


	void setPosition(PVector pos){
		position = pos;
	}


	void setPosition(float posX, float posY){
		position.set(posX, posY);
	}


	void moveStep(float deltaTime){
		position.add(PVector.mult(direction, speed * deltaTime));
	}


	void draw(){
		bulletSprite.draw(position);
	}
}