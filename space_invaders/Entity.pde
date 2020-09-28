class Entity {
	public PVector position;
	public PVector direction;

	// Width and height of the entity.
	public float size;

	public Entity(float x, float y, float size) {
		this(x, y, size, 0, -1);
	}

	public Entity(float x, float y, float size, float directionX, float directionY) {
		position = new PVector(x, y);
		direction = new PVector(directionX, directionY);
		this.size = size;
	}

	public Entity(PVector position, float size) {
		this(position.x, position.y, size);
	}

	public Entity(PVector position, float size, PVector direction) {
		this(position.x, position.y, size, direction.x, direction.y);
	}

	public void update(float deltaTime) {}

	public void draw() {}

	public boolean isCollidingWith(Entity other) {
		return rectangleCollision(
			position.x, position.y, size, size,
			other.position.x, other.position.y, other.size, other.size
		);
	}
}