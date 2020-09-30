class Enemy extends Entity{
	float speed;
	Sprite sprite;
	int value = ENEMY_VALUE;

	Enemy(PVector pos, PVector dir, PVector size){
		super(pos, dir, size);
		this.sprite = new Sprite("Enemy");
	}

	@Override
	public void draw(){
		sprite.draw(position);
	}

	public void getShot() {
		if (!gameOver)
			die();
	}

	public void die() {
		score += value;
	}

	public void shoot() {
		PVector bulletPos = new PVector(
			position.x + size.x / 2,
			position.y + size.y);
		bulletManager.createBullet(bulletPos, direction.copy(), BULLET_SIZE.copy(), BULLET_SPEED, Faction.ENEMY);
	}
}