class Sprite{
	String type;
	PVector localPosition;
	String enemy = 	new String("Enemy");
	String player = new String("Player");
	String bullet = new String("Bullet");

	color colEnemy =  color(255, 0, 0, 255);
	color colPlayer = color(0, 255, 0, 255);
	color colBullet = color(0, 0, 255, 255);

	Sprite(String type){
		this.type = type;
		this.localPosition = new PVector(0,0);
	}


	void draw(PVector pos){
		
		localPosition = pos;

		if(type.equals(enemy)){
			drawEnemy();
		}else if(type.equals(bullet)){
			drawBullet();
		}else if(type.equals(player)){
			drawPlayer();
		}else{
			drawPixel();
		}
	}

	void drawEnemy(){
		noStroke();
		fill(colEnemy);
		circle(localPosition.x, localPosition.y, 20);
	}

	void drawPlayer(){
		noStroke();
		fill(colPlayer);
		circle(localPosition.x, localPosition.y, 20);
	}

	void drawBullet(){
		noStroke();
		fill(colBullet);
		circle(localPosition.x, localPosition.y, 5);
	}

	void drawPixel(){
		noStroke();
		fill(colPlayer);
		rect(localPosition.x, localPosition.y, 1, 1);
	}
}