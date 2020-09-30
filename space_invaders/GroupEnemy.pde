class GroupEnemy extends Enemy {
	public EnemyGroup group;

	GroupEnemy(PVector pos, PVector dir, PVector size, EnemyGroup group) {
		super(pos, dir, size);
		this.group = group;
	}

	@Override
	public void die() {
		group.onEnemyDead(this);
		super.die();
	}
}