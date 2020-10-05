// Robert

class ShieldManager{
	Shield[] shields;
	int step;
	int sizeX;
	int sizeY;

	ShieldManager(){
		shields = new Shield[4];
		int numberOfShields = 4;
		step =(int)(width / (numberOfShields +1));
		sizeX = 50;
		sizeY = 70;

		shields[0] = new Shield(new PVector(step   - sizeX *0.5,630), sizeX, sizeY);
		shields[1] = new Shield(new PVector(step*2 - sizeX *0.5,630), sizeX, sizeY);
		shields[2] = new Shield(new PVector(step*3 - sizeX *0.5,630), sizeX, sizeY);
		shields[3] = new Shield(new PVector(step*4 - sizeX *0.5,630), sizeX, sizeY);
	}


	public boolean colliderTest(PVector otherPos){
		boolean hit = false;
		for(int i = 0; i < shields.length; i++){
			if(shields[i].colliderTest(otherPos))
				hit = true;
		}
		return hit;
	}


	void draw(){
		for(int i = 0; i < shields.length; i++){
			shields[i].draw();
		}
		windows();
	}


	void windows(){
		for(int i = 0; i < shields.length; i++){
			int min = step * (i+1) + 2;
			min -= sizeX * 0.5;
			int max = min + sizeX;

			fill(color(0,0,0,128));
			rect(min-2, 630, sizeX*0.35, sizeY);

			for(int x = min; x < max; x += 10){
				for(int y = 633; y < 630 + sizeY; y += 10){
					fill(0,255);
					rect(x,y,5,5);
				}
			}
		}
	}
}