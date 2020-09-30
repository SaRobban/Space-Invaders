class UserInterface{
	PFont fontLarge;
	PFont fontSmall;	
	color colMainBG = color(0,0,0,255);
	color colGameOverBG = color(0,0,0,255);
	color colTextDefault = color(255,255,255,255);
	color colTextScore = color(0,202,0,255);
	color colTextHiScore = color(255,230,0,255);

	float timeSinceDeath = 0.0;

	boolean newHiScore = true;

	UserInterface(){
		fontLarge = loadFont("LargeText-24.vlw");
		fontSmall = loadFont("SmallText-12.vlw");
	}

	void drawTitle(){
		//TODO: this
	}

	void drawHUD(){
		if(score < highScore){
			newHiScore = false;
			fill(colTextScore);
			textFont(fontSmall, 12);
			textAlign(LEFT, TOP);
			text("Score : " + score, 10, 10);
			textFont(fontLarge, 24);
			textAlign(CENTER, TOP);
			text("HiScore : " + highScore, width * 0.5, 30);
		}else{
			newHiScore = true;
			fill(colTextScore);
			textFont(fontSmall, 12);
			textAlign(LEFT, TOP);
			text("OldHiScore : " + highScore, 10, 10);

			float animV = sin(millis() * 0.01) +1;
			color animHiS = lerpColor(colTextHiScore, color (255,255,255,255), animV * 0.5);

			fill(animHiS);
			textFont(fontLarge, 24);
			textAlign(CENTER, TOP);
			text("NewHiScore : " + score, width * 0.5, 30);
		}
	}

	public void drawUI() {
//TODO: reset timeSinceDeath on new Game.
		timeSinceDeath += clock.deltaTime();
	
		color fade = lerpColor(color(0,0,0,0), color (0, 0, 0, 255), timeSinceDeath * 0.1);
		if (gameOver) {
			fill(fade);
			rect(0,0,width,height);

			fill(colTextDefault);
			textAlign(CENTER, CENTER);
			textSize(42);
			textFont(fontLarge, 24);
			text("Game Over", width / 2, height / 2);
			textFont(fontSmall, 12);
			text("Your score", width * 0.5, height * 0.6);
			textFont(fontLarge, 24);

			float animV = sin(millis() * 0.01) +1;
			color animHiS = lerpColor(colTextHiScore, color (255,255,255,255), animV * 0.5);
			fill(animHiS);
			text(score, width * 0.5, height * 0.6 + 20);
		}
	}

	void drawCredits(){
		//TODO: This
		// Set the stroke color by hue.
	/*
	void hueColor(float hue) {
		colorMode(HSB, 1);
		stroke(hue % 1, 1, 1);
		colorMode(RGB);
	}
	*/
	}

}