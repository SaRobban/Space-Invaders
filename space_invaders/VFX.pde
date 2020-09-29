class VFX extends Entity{
	boolean alive = true;
	float maxSize;
	float size = 0;
	float mulScale = 0.0;

	color yellow = color(255, 255, 0, 255);
	color gray = color(64, 64, 64, 255);
	float colAlphaA = 255;
	float colAlphaB = 255;

	PVector randPosA;
	PVector randPosB;
	PVector randPosC;
	PVector randPosD;
	PVector randPosE;

	public VFX(PVector pos, int size, float life){
		super(pos, new PVector(0,1), new PVector(size, size));
		this.maxSize = size;
		this.mulScale = 1 / life;
		this.alive = true;
		randomPos(maxSize *0.5);
	}

	public VFX(float posX, float posY, int size, float life){
		super(new PVector(posX, posY), new PVector(0,1), new PVector(size, size));
		this.maxSize = size;
		this.mulScale = 1 / life;
		randomPos(maxSize *0.5);
	}


	private void randomPos(float value){
		
		float off = size * 0.5;
		randPosA = new PVector(random(-value, value) -off, random(-value, value) -off);
		randPosB = new PVector(random(-value, value) -off, random(-value, value) -off);
		randPosC = new PVector(random(-value, value) -off, random(-value, value) -off);
		randPosD = new PVector(random(-value, value) -off, random(-value, value) -off);
		randPosE = new PVector(random(-value, value) -off, random(-value, value) -off);

	}

	public boolean isAlive(){
		return alive;
	}

	@Override
	public void update(float deltaTime){
		size += maxSize * mulScale * mulScale * deltaTime; 
		colAlphaA -= 319 * mulScale * deltaTime * 2; 
		colAlphaB -= 255 * mulScale * mulScale * deltaTime; 
		
		yellow = color (255, 255 - colAlphaA * 0.5,128 - colAlphaA, colAlphaA);
		gray = color (64,64,64, 225);// colAlphaB);

		if(size >= maxSize){
			alive = false;
		}
	}

	@Override
	public void draw(){
		noStroke();
		

		pushMatrix();
		translate(position.x, position.y);
		//rotate(frameCount / -100.0);
		

		fill(gray);
		star(randPosA.x, randPosA.y, size, size, 12);
		star(randPosB.x, randPosB.y, size * 0.75, size * 0.75f, 12);
		star(randPosC.x, randPosC.y, size * 0.5, size * 0.5f, 12);
		star(randPosD.x, randPosD.y, size * 0.25, size * 0.25f, 12);
		star(randPosE.x, randPosE.y, size * 0.25, size * 0.25f, 12);	
			
		
		fill(yellow);
		star(0, 0, size * 0.5, size * 1.5f, 5); 

		popMatrix();
	}


	//copy from P3 sample
	void star(float x, float y, float radius1, float radius2, int npoints) {
		float angle = TWO_PI / npoints;
		float halfAngle = angle/2.0;
		beginShape();

		for (float a = 0; a < TWO_PI; a += angle) {
			float sx = x + cos(a) * radius2;
			float sy = y + sin(a) * radius2;
			vertex(sx, sy);
			sx = x + cos(a+halfAngle) * radius1;
			sy = y + sin(a+halfAngle) * radius1;
			vertex(sx, sy);
		}
		endShape(CLOSE);
	}
}