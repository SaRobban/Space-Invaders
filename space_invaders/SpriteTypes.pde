class Sprite{
	String type;
	PVector localPosition;
	String enemy = 	new String("Enemy");
	String player = new String("Player");
	String bullet = new String("Bullet");


	color colEnemy =  color(255, 0, 0, 255);
	color colPlayer = color(0, 255, 0, 255);
	color colBullet = color(0, 0, 255, 255);

	Sprite(String type, PVector pos){
		this.type = type;
		localPosition = pos;
	}

	Sprite(String type, float x, float y){
		this.type = type;
		localPosition = new PVector(x,y);
	}


	void setPos(PVector pos){
		this.localPosition = pos;
	}

	void setMoveStep(PVector move){
		this.localPosition.add(move);
	}


	void draw(){
		if(type.equals(enemy)){
			drawEnemy();
		}else if(type.equals(bullet)){
			drawBullet();
		}else{
			drawPlayer();
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
}