class EnemyGroup {
	static final float WALL_PADDING = 60;

	public PVector position;
	public PVector size;
	public PVector velocity;
	public ArrayList<Enemy> enemies = new ArrayList<Enemy>();

	private PVector newPosition = new PVector();

	public EnemyGroup(PVector position, PVector size, PVector velocity) {
		this.position = position;
		this.size = size;
		this.velocity = velocity;
	}

	public void update(float dt) {
		float newX = position.x + velocity.x * dt;
		float newY = position.y + velocity.y * dt;

		if (newX <= WALL_PADDING) {
			newX = WALL_PADDING;
			velocity.x = -velocity.x;
		}
		else if (newX >= width - size.x - WALL_PADDING - 1) {
			newX = width - size.x - WALL_PADDING - 1;
			velocity.x = -velocity.x;
		}

		float deltaX = newX - position.x;
		float deltaY = newY - position.y;
		for (Enemy enemy : enemies) {
			enemy.position.add(deltaX, deltaY);
		}

		position.set(newX, newY);
	}
}