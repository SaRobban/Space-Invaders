class Player extends Entity {
	private static final float FIRE_DELAY = 0.5f;

	public float speed;
	private float fireDelay;

	public Player() {
		this(0, 0, 40, 10);
	}

	public Player(float x, float y, float size, float speed) {
		super(x, y, size, size);
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
		// TODO: Replace with player sprite.
		pushMatrix();
			translate(position.x, position.y);
			rect(0, 0, size, size);
		popMatrix();
	}

	private void fire() {
		// TODO: Fire a bullet.
		println("Fire!");
	}
}