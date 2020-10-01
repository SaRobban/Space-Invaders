// Robert

class ShieldManager{
	Shield[] shields;
	int step;
	int bredd;
	int hojd;

	ShieldManager(){
		shields = new Shield[4];
		int numberOfShields = 4;
		step =(int)(width / (numberOfShields +1));
		bredd = 50;
		hojd = 70;

		shields[0] = new Shield(new PVector(step   - bredd *0.5,630), bredd, hojd);
		shields[1] = new Shield(new PVector(step*2 - bredd *0.5,630), bredd, hojd);
		shields[2] = new Shield(new PVector(step*3 - bredd *0.5,630), bredd, hojd);
		shields[3] = new Shield(new PVector(step*4 - bredd *0.5,630), bredd, hojd);
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
			windows();
		}
	}


	void windows(){
		for(int i = 0; i < shields.length; i++){
			int min = step * (i+1) + 2;
			min -= bredd * 0.5;
			int max = min + bredd;

			fill(color(0,0,0,64));
			rect(min-2, 630, bredd*0.35, hojd);
			for(int x = min; x < max; x += 10){
				for(int y = 633; y < 630 + hojd; y += 10){
					fill(0,255);
					rect(x,y,5,5);
				}
			}
		}
	}
}