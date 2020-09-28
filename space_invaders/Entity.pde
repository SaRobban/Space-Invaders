class Entity {
	public PVector position;
	public PVector velocity = new PVector();

	// Width and height of the entity.
	public float size;

	public Entity(float x, float y, float size) {
		position = new PVector(x, y);
		this.size = size;
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