class Player extends Entity {
	private static final float FIRE_DELAY = 0.5f;

	public float speed;
	private float fireDelay;
	private Sprite sprite = new Sprite("Player");

	public Player(float x, float y, float width, float height, float speed) {
		super(x, y, width, height);
		this.speed = speed;
	}

	@Override
	public void update(float dt) {
		// Movement
		float move = 0;
		if (input.left) move -= 1;
		if (input.right) move += 1;

		position.x += move * speed * dt;

		// Shooting
		fireDelay -= dt;
		if (input.fire && fireDelay <= 0) {
			fireDelay = FIRE_DELAY;
			fire();
		}
	}

	@Override
	public void draw() {
		fill(255);
		sprite.draw(position);
	}

	public void getShot() {
		println("Player got shot");
		gameOver = true;
	}

	private void fire() {
		PVector bulletPos = new PVector(position.x + size.x / 2 - BULLET_SIZE.x / 2, position.y);
		bulletManager.createBullet(bulletPos, direction.copy(), BULLET_SIZE.copy(), BULLET_SPEED);
	}
}