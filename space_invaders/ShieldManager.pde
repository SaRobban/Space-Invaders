class ShieldManager{
	Shield[] shields;

	ShieldManager(){
		shields = new Shield[4];
		int numberOfShields = 4;
		int step =(int)(width / (numberOfShields +1));
		int bredd = 100;

		shields[0] = new Shield(new PVector(step   - bredd *0.5,600), bredd);
		shields[1] = new Shield(new PVector(step*2 - bredd *0.5,600), bredd);
		shields[2] = new Shield(new PVector(step*3 - bredd *0.5,600), bredd);
		shields[3] = new Shield(new PVector(step*4 - bredd *0.5,600), bredd);
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
	}
}