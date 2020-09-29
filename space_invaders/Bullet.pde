class Bullet extends Entity{
	int id;
	float speed;
	Sprite bulletSprite;

	Bullet(PVector position, PVector direction, float speed, PVector size, int id){
		super(position.x, position.y, size);
		super.direction = direction;
		this.speed = speed;
		bulletSprite = new Sprite("Bullet");
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
		bulletSprite.draw(position);
	}
}