class UserInterface{
	PFont fontLarge;
	PFont fontSmall;	
	color colMainBG = color(0,0,0,255);
	color colGameOverBG = color(0,0,0,255);
	color colText = color(0,0,0,255);



	UserInterface(){
		fontLarge = loadFont("LargeText-24.vlw");
		fontSmall = loadFont("SmallText-12.vlw");
	}

	void drawTitle(){
		//TODO: this
	}

	void drawHUD(){
		//TODO: this
		fill(255);
		textFont(fontSmall, 12);
		text("BLALALAL", width * 0.1, height * 0.1);
		textFont(fontLarge, 24);
		text("BLALALAL",200,100);
	}

	public void drawUI() {
		if (gameOver) {
			fill(255);
			textAlign(CENTER, CENTER);
			textSize(42);
			text("Game Over", width / 2, height / 2);
		}
	}

	void drawCredits(){
		//TODO: This
	}

}