class Sprite{
	String type;
	PVector position;



	String enemy = 	new String("Enemy");
	String player = new String("Player");
	String bullet = new String("Bullet");


	color colEnemy =  color(255, 0, 0, 255);
	color colPlayer = color(0, 255, 0, 255);
	color colBullet = color(0, 0, 255, 255);

	Sprite(String type, PVector pos){
		this.type = type;
		position = pos;
	}

	Sprite(String type, float x, float y){
		this.type = type;
		position = new PVector(x,y);
	}


	void setPos(PVector pos){
		this.position = pos;
	}

	void setMoveStep(PVector move){
		this.position.add(move);
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
		circle(position.x, position.y, 20);
	}

	void drawPlayer(){
		noStroke();
		fill(colPlayer);
		circle(position.x, position.y, 20);
	}

	void drawBullet(){
		noStroke();
		fill(colBullet);
		circle(position.x, position.y, 5);
	}
}