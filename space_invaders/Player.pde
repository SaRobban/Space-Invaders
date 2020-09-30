class Player extends Entity {
	public float speed;
	public int health = PLAYER_HEALTH;
	public boolean dead = false;

	private float fireDelay;
	private Sprite sprite = new Sprite("Player");

	public Player(float x, float y, float width, float height, float speed) {
		super(x, y, width, height);
		this.speed = speed;
		fireDelay = PLAYER_FIRE_DELAY;
	}

	@Override
	public void update(float dt) {
		if (dead) return;

		// Movement
		float move = 0;
		if (input.left) move -= 1;
		if (input.right) move += 1;

		position.x += move * speed * dt;
		position.x = constrain(position.x, 0, width - size.x - 1);

		// Shooting
		fireDelay -= dt;
		if (input.fire && fireDelay <= 0) {
			fireDelay = PLAYER_FIRE_DELAY;
			fire();
		}
	}

	@Override
	public void draw() {
		if (dead) return;

		fill(255);
		sprite.draw(position);
	}

	public void getShot() {
		if (dead || health <= 0) return;

		health -= 1;
		if (health == 0) {
			die();
		}
	}

	public void reset() {
		health = PLAYER_HEALTH;
		fireDelay = PLAYER_FIRE_DELAY;
		dead = false;
	}

	private void die() {
		dead = true;
		gameOver();
	}

	private void fire() {
		PVector bulletPos = new PVector(position.x + size.x / 2 - BULLET_SIZE.x / 2, position.y - size.y *0.5 - 1 - BULLET_SIZE.y *0.5);
		bulletManager.createBullet(bulletPos, direction.copy(), BULLET_SIZE.copy(), BULLET_SPEED, Faction.PLAYER);
	}
}