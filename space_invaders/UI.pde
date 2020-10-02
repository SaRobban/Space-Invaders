// Robert

class UserInterface{
	PFont fontLarge;
	PFont fontSmall;
	PFont fontTitle;

	color colMainBG = color(0,0,0,255);
	color colGameOverBG = color(0,0,0,255);
	color colTextDefault = color(255,255,255,255);
	color colTextScore = color(0,202,0,255);
	color colTextHiScore = color(255,230,0,255);
	float timeSinceDeath = 0.0;
	boolean newHiScore = true;

	Sprite healthIcon = new Sprite("Player");
	PVector healthIconPos = new PVector();
	PVector healthIconSize = new PVector(30, 30);

	Sprite icon;

	UserInterface(){
		fontLarge = loadFont("LargeText-24.vlw");
		fontSmall = loadFont("SmallText-18.vlw");
		fontTitle = loadFont("Title-72.vlw");
		icon = new Sprite("Enemy");
	}

	void drawTitle(){
		background(colMainBG);

		//Title text
		fill(colTextDefault);
		textAlign(CENTER, BOTTOM);
		textFont(fontTitle, 84);
		text("SPÄJS INVÄDORS", width * 0.5, 355);
		stroke(colTextDefault);
		strokeWeight(4);
		line(0, 340, 93, 340);
		line(120, 340, 175, 340);
		line(203, 340, width, 340);

		//Sub text
		textFont(fontLarge, 18);
		float animV = sin(millis() * 0.01) +1;
		color animHiS = lerpColor(colTextHiScore, color (255,255,255,255), animV * 0.5);
		fill(animHiS);
		textAlign(CENTER, TOP);
		text("PRESS ANY KEY", width * 0.5, height * 0.45);
		textFont(fontSmall, 18);
		text("Credits : 3", width * 0.5, height * 0.45 + 22);

		drawCredits();

		float sine = sin(millis() * 0.0005);
		float cosi = cos(millis() * 0.0005);
		icon.draw(new PVector(width *0.5 - 12 - sine * 300, 300 - cosi * 100), new PVector(24,24));
	}

	void drawHUD(){
		newHiScore = false;
		fill(colTextScore);
		textFont(fontSmall, 18);
		textAlign(LEFT, TOP);
		text("Score : " + score + "\n" + "Wave : " + waveManager.wave, 10, 50);
		textFont(fontLarge, 24);
		textAlign(CENTER, TOP);

		if(score < highScore){
			text("---+HiScore : " + highScore + " +---", width * 0.5, 20);
		}else{
			newHiScore = true;
			float animV = sin(millis() * 0.01) +1;
			color animHiS = lerpColor(colTextHiScore, color (255,255,255,255), animV * 0.5);
			fill(animHiS);
			textFont(fontLarge, 24);


			text("---+NewHiScore : " + score + " +---", width * 0.5, 20);
		}

		for(int i = 0; i < player.health; i++){
			healthIconPos.set(450 + i*50, 50);
			healthIcon.draw(healthIconPos, healthIconSize);
		}
	}

	public void drawGameOver() {
		timeSinceDeath += clock.deltaTime();
		color fade = lerpColor(color(0,0,0,0), colMainBG, timeSinceDeath * 0.5);


		fill(fade);
		rect(0,0,width,height);

		float yOffset = -50;

		fill(colTextDefault);
		textAlign(CENTER, CENTER);
		textFont(fontLarge, 24);
		text("Game Over", width / 2, height / 2 + yOffset);
		textFont(fontSmall, 18);

		if(newHiScore){
			text("Your new HiScore", width * 0.5, height * 0.6 + yOffset);
			textFont(fontLarge, 24);
			float animV = sin(millis() * 0.01) +1;
			color animHiS = lerpColor(colTextHiScore, color (255,255,255,255), animV * 0.5);
			fill(animHiS);
			text(score, width * 0.5, height * 0.6 + 20 + yOffset);
		}else{
			text("Your score", width * 0.5, height * 0.6 + yOffset);
			textFont(fontLarge, 24);
			float animV = sin(millis() * 0.01) +1;
			color animHiS = lerpColor(colTextHiScore, color (255,255,255,255), animV * 0.5);
			fill(animHiS);
			text(score, width * 0.5, height * 0.6 + 20 + yOffset);
		}
	}

	void drawPaused() {
		textAlign(CENTER, CENTER);
		textSize(42);
		text("PAUSED", width / 2, height / 2);
	}

	void drawCredits(){
		fill(hueColorCycle(millis() * 0.0001));
		float screenY = height * 0.8;
		float row = 21;
		text("Made by:", width * 0.5, screenY);
		textAlign(RIGHT,TOP);
		text("Deep thoughts:", width * 0.5, screenY + row);
		text("Coffee drinking:", width * 0.5, screenY + row * 2);
		textAlign(LEFT,TOP);
		text("Jonatan Johansson", width * 0.5, screenY + row);
		text("Robert Sandh", width * 0.5, screenY + row * 2);
		textAlign(CENTER,TOP);
		text("Noize by:", width * 0.5, screenY + row * 4);
		textFont(fontSmall, 11);
		text("https://www.classicgaming.cc/classics/space-invaders/sounds", width * 0.5, screenY + row * 5);
		text("https://www.shadertoy.com/user/FMS_Cat", width * 0.5, screenY + row * 6);
	}

	color hueColorCycle(float hue) {
		colorMode(HSB, 1);
		color col = color(hue % 1, 1, 1);
		colorMode(RGB, 255);
		return col;
	}

	void reset(){
		timeSinceDeath = 0;
		newHiScore = false;
	}
}