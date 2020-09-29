class Entity {
	public PVector position;
	public PVector direction;

	// Width and height of the entity.
	public PVector size;

	public Entity(float x, float y, float width, float height) {
		this(x, y, width, height, 0, -1);
	}

	public Entity(float x, float y, float width, float height, float directionX, float directionY) {
		position = new PVector(x, y);
		direction = new PVector(directionX, directionY);
		this.size = new PVector(width, height);
	}

	public Entity(PVector position, PVector size) {
		this(position.x, position.y, size.x, size.y);
	}

	public Entity(PVector position, PVector size, PVector direction) {
		this(position.x, position.y, size.x, size.y, direction.x, direction.y);
	}

	public void update(float deltaTime) {}

	public void draw() {}

	public boolean isCollidingWith(Entity other) {
		return rectangleCollision(
			position.x, position.y, size.x, size.y,
			other.position.x, other.position.y, other.size.x, other.size.y
		);
	}
}