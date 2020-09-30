class Sprite{
	String type;
	PVector localPosition;
	String enemy = 	new String("Enemy");
	String player = new String("Player");
	String bullet = new String("Bullet");
	String ufo = new String("UFO");

	color colEnemy =  color(255, 0, 0, 255);
	color colPlayer = color(0, 255, 0, 255);
	color colBullet = color(0, 0, 255, 255);
	color colUFO = color(0, 0, 255, 255);

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
		}else if(type.equals(ufo)){
			drawUFO();
		}else{
			drawPixel();
		}
	}

	void drawEnemy(){
		noStroke();
		fill(colEnemy);
		ellipseMode(CORNER);

		pushMatrix();
		translate(localPosition.x, localPosition.y);
		//Head
		ellipse(0, 0, ENEMY_SIZE.x, ENEMY_SIZE.y *0.75);	
		//fill(255);
		pushMatrix();
		fill(255,128);
		translate(ENEMY_SIZE.x * 0.25, ENEMY_SIZE.y * 0.05);
		rotate(PI*0.3);
		ellipse(0, 0, ENEMY_SIZE.y *0.15, ENEMY_SIZE.x * 0.35);
		popMatrix();

		ellipse(ENEMY_SIZE.x * 0.35, ENEMY_SIZE.y * 0.15, ENEMY_SIZE.x * 0.15, ENEMY_SIZE.y *0.1);		
		strokeWeight(4);
		stroke(colEnemy);
		//arms
		line(ENEMY_SIZE.x *0.5, ENEMY_SIZE.y *0.5, ENEMY_SIZE.x, ENEMY_SIZE.y);
		line(ENEMY_SIZE.x *0.5, ENEMY_SIZE.y *0.5, ENEMY_SIZE.x *0.5, ENEMY_SIZE.y);
		line(ENEMY_SIZE.x *0.5, ENEMY_SIZE.y *0.5, 0, ENEMY_SIZE.y);			
		stroke(0);
		line(ENEMY_SIZE.x *0.2, ENEMY_SIZE.y *0.4, ENEMY_SIZE.x *0.4, ENEMY_SIZE.y *0.6);
		line(ENEMY_SIZE.x *0.6, ENEMY_SIZE.y *0.6, ENEMY_SIZE.x *0.8, ENEMY_SIZE.y *0.4);
		popMatrix();
	}

	void drawPlayer(){
		noStroke();
		fill(colPlayer);
		ellipseMode(CORNER);
		ellipse(localPosition.x, localPosition.y, PLAYER_SIZE.x, PLAYER_SIZE.y);
	}

	void drawBullet(){
		noStroke();
		fill(colBullet);
		ellipseMode(CORNER);
		ellipse(localPosition.x, localPosition.y, BULLET_SIZE.x, BULLET_SIZE.y);
	}

	void drawUFO(){
		noStroke();
		fill(colPlayer);
		ellipseMode(CORNER);
		ellipse(localPosition.x, localPosition.y + PLAYER_SIZE.y * 0.25, PLAYER_SIZE.x, PLAYER_SIZE.y * 0.5);
		ellipse(localPosition.x + PLAYER_SIZE.x * 0.25, localPosition.y, PLAYER_SIZE.y  * 0.5, PLAYER_SIZE.y);
	}

	void drawPixel(){
		noStroke();
		fill(colPlayer);
		rect(localPosition.x, localPosition.y, 1, 1);
	}
}