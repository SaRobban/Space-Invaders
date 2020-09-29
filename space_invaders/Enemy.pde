class Enemy extends Entity{
	float speed;
	Sprite sprite;

	Enemy(PVector pos, PVector dir, PVector size){
		super(pos, dir, size);
		this.sprite = new Sprite("Enemy");
	}

	@Override
	public void draw(){
		sprite.draw(position);
	}
}