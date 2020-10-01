// Jonatan

class MovingEnemy extends Enemy {
	public float speed;

	MovingEnemy(PVector position, PVector direction, PVector size, float speed) {
		super(position, direction, size);
	}

	@Override
	public void update(float dt) {
		position.x += direction.x * speed * dt;
		position.y += direction.y * speed * dt;
	}
}