class Sprite{
	String type;
	PVector localPosition;
	PVector localSize;

	String enemy = 	new String("Enemy");
	String player = new String("Player");
	String bullet = new String("Bullet");
	String ufo = new String("UFO");

	color colEnemy =  			color(255, 0, 0, 255);
	color colPlayer = 			color(0, 255, 0, 255);
	color colBullet = 			color(255, 255, 255, 255);
	color colBulletOutline = 	color(0, 0, 255, 255);
	color colUFO = 				color(0, 0, 255, 255);

	Sprite(String type){
		this.type = type;
		this.localPosition = new PVector(0,0);
	}

/*
	void draw(PVector pos){

		localPosition = pos;
		localSize = ENEMY_SIZE.copy();

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
*/
	void draw(PVector pos, PVector size){

		localPosition = pos;
		localSize = size;

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
		ellipse(0, 0, localSize.x, localSize.y *0.75);	
		//fill(255);
		pushMatrix();
		fill(255,128);
		translate(localSize.x * 0.25, localSize.y * 0.05);
		rotate(PI*0.3);
		ellipse(0, 0, localSize.y *0.15, localSize.x * 0.35);
		popMatrix();

		ellipse(localSize.x * 0.35, localSize.y * 0.15, localSize.x * 0.15, localSize.y *0.1);		
		strokeWeight(4);
		stroke(colEnemy);
		//arms
		line(localSize.x *0.5, localSize.y *0.5, localSize.x, localSize.y);
		line(localSize.x *0.5, localSize.y *0.5, localSize.x *0.5, localSize.y);
		line(localSize.x *0.5, localSize.y *0.5, 0, localSize.y);			
		stroke(0);
		line(localSize.x *0.2, localSize.y *0.4, localSize.x *0.4, localSize.y *0.6);
		line(localSize.x *0.6, localSize.y *0.6, localSize.x *0.8, localSize.y *0.4);
		popMatrix();
	}

	void drawPlayer(){
		noStroke();
		fill(colPlayer);
		ellipseMode(CORNER);
		ellipse(localPosition.x, localPosition.y, localSize.x, localSize.y);
	}

	void drawBullet(){
		noStroke();
		fill(colBullet);		
		ellipseMode(CORNER);
		ellipse(localPosition.x, localPosition.y, localSize.x, localSize.y);
	}

	void drawEnemyBullet(PVector pos, PVector size){
		localPosition = pos;
		localSize = size;

		float toTheLeft = sin(localPosition.y);
		float toTheRight = toTheLeft *-1;

		pushMatrix();
		translate(localPosition.x, localPosition.y);
		strokeWeight(4);
		stroke(color(255,0,0,128));

		line(0					, 0					,toTheLeft	, localSize.y * 0.5);
		line(toTheLeft			, localSize.y *0.5	,-toTheLeft	, localSize.y);
		line(-toTheLeft			,localSize.y 		,toTheLeft	, localSize.y * 1.5);
		line(toTheLeft			,localSize.y *1.5	,0			, localSize.y * 2);

		strokeWeight(2);
		stroke(color(255,255,200,255));
		
		line(0					, 0					,localSize.x * 0.5	, localSize.y * 0.5);
		line(localSize.x * 0.5, localSize.y *0.5,-localSize.x * 0.5	, localSize.y);
		line(-localSize.x * 0.5,localSize.y 	,localSize.x * 0.5	, localSize.y * 1.5);
		line(localSize.x * 0.5 ,localSize.y *1.5,0						, localSize.y * 2);
		popMatrix();
	}

	void drawUFO(){
		noStroke();
		fill(colPlayer);
		ellipseMode(CORNER);
		ellipse(localPosition.x, localPosition.y + localSize.y * 0.25, localSize.x, localSize.y * 0.5);
		ellipse(localPosition.x + localSize.x * 0.25, localPosition.y, localSize.y  * 0.5, localSize.y);
	}

	void drawPixel(){
		noStroke();
		fill(colPlayer);
		rect(localPosition.x, localPosition.y, 1, 1);
	}
}