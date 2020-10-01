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
		sprite.draw(position, size);
	}

	public void getShot() {
		if (gameState != State.GAME_OVER)
			die();
	}

	public void die() {
		enemyManager.onEnemyDead(this);
	}

	public void shoot() {
		PVector bulletPos = new PVector(
			position.x + size.x / 2,
			position.y + size.y);
		bulletManager.createBullet(bulletPos, direction.copy(), BULLET_SIZE.copy(), ENEMY_BULLET_SPEED, Faction.ENEMY);
	}
}