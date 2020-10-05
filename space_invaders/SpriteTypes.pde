// Robert

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
	color colFrendlyBullet = 	color(0, 255, 200, 255);
	color colEnemyBullet =	 	color(255, 64, 0, 255);
	color colUFO = 				color(255, 0, 255, 255);

	Sprite(String type){
		this.type = type;
	}


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
		pushMatrix();
		translate(localPosition.x, localPosition.y);

		float animOne;
		float animTwo;
		ellipseMode(CORNER);
		
		//Head BG
		fill(color(200,0,0,255));
		noStroke();
		ellipse(0, 0, localSize.x, localSize.y *0.75);

		//arms BG
		strokeWeight(6);
		stroke(color(200,0,0,255));
		animTwo = sin(localPosition.y + localSize.y * 0.52) * 2;
		line(localSize.x *0.7, localSize.y *0.7, localSize.x *0.8 + animTwo, localSize.y *0.8);
		line(localSize.x *0.5, localSize.y *0.7, localSize.x *0.5 - animTwo, localSize.y *0.8);
		line(localSize.x *0.3, localSize.y *0.7, localSize.x *0.2 + animTwo, localSize.y *0.8);

		//arms link root
		strokeWeight(4);
		stroke(colEnemy);
		line(localSize.x *0.7, localSize.y *0.7, localSize.x *0.8 + animTwo, localSize.y *0.8);
		line(localSize.x *0.5, localSize.y *0.7, localSize.x *0.5 - animTwo, localSize.y *0.8);
		line(localSize.x *0.3, localSize.y *0.7, localSize.x *0.2 + animTwo, localSize.y *0.8);

		//arms BG
		strokeWeight(5);
		stroke(color(200,0,0,255));
		animOne = animTwo;
		animTwo = sin(localPosition.y + localSize.y * 0.56) * 2;
		line(localSize.x *0.8 + animOne, localSize.y *0.8,localSize.x *0.9 + animTwo, localSize.y *0.9);
		line(localSize.x *0.5 - animOne, localSize.y *0.8, localSize.x *0.5 - animTwo, localSize.y *0.9);
		line(localSize.x *0.2 + animOne, localSize.y *0.8, localSize.x *0.1 + animTwo, localSize.y *0.9);

		//arms link 1
		strokeWeight(3);
		stroke(colEnemy);
		line(localSize.x *0.8 + animOne, localSize.y *0.8,localSize.x *0.9 + animTwo, localSize.y *0.9);
		line(localSize.x *0.5 - animOne, localSize.y *0.8, localSize.x *0.5 - animTwo, localSize.y *0.9);
		line(localSize.x *0.2 + animOne, localSize.y *0.8, localSize.x *0.1 + animTwo, localSize.y *0.9);

		//arms BG
		strokeWeight(4);
		stroke(color(200,0,0,255));
		animOne = animTwo;
		animTwo = sin(localPosition.y + localSize.y *0.6) * 2;
		line(localSize.x *0.9 + animOne, localSize.y *0.9,localSize.x + animTwo, localSize.y);
		line(localSize.x *0.5 - animOne, localSize.y *0.9, localSize.x *0.5 - animTwo, localSize.y);
		line(localSize.x *0.1 + animOne, localSize.y *0.9, animTwo, localSize.y);

		//arms link 2
		strokeWeight(2);
		stroke(colEnemy);
		line(localSize.x *0.9 + animOne, localSize.y *0.9,localSize.x + animTwo, localSize.y);
		line(localSize.x *0.5 - animOne, localSize.y *0.9, localSize.x *0.5 - animTwo, localSize.y);
		line(localSize.x *0.1 + animOne, localSize.y *0.9, animTwo, localSize.y);

		//Head
		noStroke();
		fill(colEnemy);
		ellipse(1, 1, localSize.x-2, localSize.y *0.75-2);
		pushMatrix();

		fill(255,128);
		translate(localSize.x * 0.25, localSize.y * 0.05);
		rotate(PI*0.3);
		ellipse(0, 0, localSize.y *0.15, localSize.x * 0.35);
		popMatrix();
		ellipse(localSize.x * 0.35, localSize.y * 0.15, localSize.x * 0.15, localSize.y *0.1);

		//Eyes
		strokeWeight(5);
		stroke(color(128,0,0,255));
		line(localSize.x *0.4 -1, localSize.y *0.6 -3, localSize.x *0.2, localSize.y *0.4);
		line(localSize.x *0.6 +1, localSize.y *0.6 -3, localSize.x *0.8, localSize.y *0.4);
		strokeWeight(3);
		stroke(0);
		line(localSize.x *0.4, localSize.y *0.6, localSize.x *0.2, localSize.y *0.4);
		line(localSize.x *0.6, localSize.y *0.6, localSize.x *0.8, localSize.y *0.4);

		popMatrix();
	}


	void drawPlayer(){
		pushMatrix();
		translate(localPosition.x, localPosition.y);
		//Track low
		stroke(color(colPlayer));
		strokeWeight(2);
		fill(color(colPlayer));
		line(localSize.x * 0.1, localSize.y * 0.6 +1, localSize.x * 0.9, localSize.y * 0.6 +1);
		line(localSize.x * 0.26, localSize.y -1, localSize.x * 0.74, localSize.y -1);
		line(localSize.x *0.05, localSize.y * 0.74, localSize.x * 0.22, localSize.y * 0.96);
		line(localSize.x *0.95, localSize.y * 0.74, localSize.x * 0.78, localSize.y * 0.96);

		//wheels
		noStroke();
		circle(0, localSize.y * 0.6	, localSize.x * 0.2);
		circle(localSize.x - localSize.x * 0.2, localSize.y * 0.6, localSize.x * 0.2);
		circle(localSize.x * 0.2, localSize.y * 0.9 -localSize.x * 0.1, localSize.x * 0.2);
		circle(localSize.x * 0.8 -localSize.x * 0.2, localSize.y * 0.9 -localSize.x * 0.1, localSize.x * 0.2);

		//chassi
		quad(0, localSize.y *0.5, localSize.x, localSize.y *0.5, localSize.x, localSize.y *0.4, 0, localSize.y *0.4);
		quad(localSize.x *0.15, localSize.y *0.2, localSize.x *0.85, localSize.y *0.2, localSize.x, localSize.y *0.4, 0, localSize.y *0.4);

		//Tower
		stroke(0);
		strokeWeight(2);
		quad(
			localSize.x *0.3	, 0,
			localSize.x	*0.7	, 0,
			localSize.x	*0.8	, localSize.y *0.4,
			localSize.x *0.2	, localSize.y *0.4
		);
		line(localSize.x*0.2, localSize.y * 0.2, localSize.x *0.8 , localSize.y * 0.2);
		
		popMatrix();
	}


	void drawBullet(){
		pushMatrix();
		translate(localPosition.x, localPosition.y);

		noStroke();
		fill(colFrendlyBullet);
		ellipseMode(CENTER);
		ellipse(0,0, localSize.x, localSize.y);
		triangle(-localSize.x, 0, localSize.x, 0, 0, localSize.y * 4);
		fill(color(255,255,255,255));
		ellipse(0, 0, localSize.x -2, localSize.y -2);
		
		popMatrix();

	}


	void drawEnemyBullet(PVector pos, PVector size){
		
		localPosition = pos;
		localSize = size;

		float toTheLeft = sin(localPosition.y *0.1) * localSize.x;
		float toTheRight = toTheLeft *-1;

		pushMatrix();
		translate(localPosition.x, localPosition.y);
		strokeWeight(4);
		stroke(colEnemyBullet);

		line(0					, 0					,toTheLeft	, localSize.y * 0.5);
		line(toTheLeft			, localSize.y *0.5	,-toTheLeft	, localSize.y);
		line(-toTheLeft			,localSize.y 		,toTheLeft	, localSize.y * 1.5);
		line(toTheLeft			,localSize.y *1.5	,0			, localSize.y * 2);

		strokeWeight(2);
		stroke(color(255,255,200,255));

		line(0					, 0					,toTheLeft	, localSize.y * 0.5);
		line(toTheLeft			, localSize.y *0.5	,-toTheLeft	, localSize.y);
		line(-toTheLeft			,localSize.y 		,toTheLeft	, localSize.y * 1.5);
		line(toTheLeft			,localSize.y *1.5	,0			, localSize.y * 2);

		popMatrix();
	}


	void drawUFO(){
		pushMatrix();
		translate(localPosition.x, localPosition.y);

		noStroke();
		ellipseMode(CORNER);
		fill(color(128,0,128,255));
		ellipse(0, localSize.y * 0.25, localSize.x, localSize.y * 0.5);
		ellipse(localSize.x * 0.25, 0, localSize.y  * 0.5, localSize.y * 0.5);
		ellipse(localSize.x * 0.25, localSize.y * 0.5, localSize.y  * 0.5, localSize.y * 0.5);
		
		fill(colUFO);
		ellipse(1, localSize.y * 0.25 +1, localSize.x -2, localSize.y * 0.5 -2);
		ellipse(localSize.x * 0.25 +1, 1, localSize.y  * 0.5 -2, localSize.y * 0.5 -2);
		ellipse(localSize.x * 0.25 +1, localSize.y * 0.5 +1, localSize.y  * 0.5 -2, localSize.y * 0.5 -2);

		rotate(PI *0.1);
		fill(color(255,255,255,128));
		ellipse(localSize.x * 0.35, localSize.y * -0.1, localSize.y  * 0.3, localSize.y * 0.25);
		ellipse(localSize.x * 0.2, localSize.y * 0.25, localSize.x * 0.4, localSize.y * 0.2);

		popMatrix();
	}


	void drawPixel(){
		noStroke();
		fill(colPlayer);
		rect(localPosition.x, localPosition.y, 1, 1);
	}
}