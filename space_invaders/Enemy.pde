class Enemy extends Entity{
	float speed;
	Sprite sprite;


	Enemy(PVector pos, PVector dir, PVector size, float speed){
		super(pos, dir, size);
		this.speed = speed;
		this.sprite = new Sprite("Enemy");
	}


	@Override
	public void update(float deltaTime){
		position.add(PVector.mult(direction, speed * deltaTime));
	}


	@Override
	public void draw(){
		sprite.draw(position);
	}
}