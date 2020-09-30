class UFO extends Enemy{
	float speed;

	UFO(PVector pos, PVector dir, PVector size, float speed){
		super(pos, dir, size);
		super.sprite = new Sprite("UFO");
		this.speed = speed;
		super.value = UFO_VALUE;
	}

	@Override
	public void update(float deltaT) {
		position.add(new PVector(direction.x * speed * deltaT, direction.y * speed * deltaT));
		if(position.x < 0){
			enemyManager.removeEnemyFromList(this);
		}
	}

	@Override
	public void draw(){
		sprite.draw(position, size);
	}
}