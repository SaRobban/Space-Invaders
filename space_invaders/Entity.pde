class Entity {
	public PVector position;

	// Width and height of the entity.
	public float size;

	public Entity(float x, float y, float size) {
		position = new PVector(x, y);
		this.size = size;
	}

	public void update(float deltaTime) {}

	public void draw() {}
}