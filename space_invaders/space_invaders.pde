// Jonatan, Robert

import processing.sound.*;

enum State { MENU, PLAYING, PAUSED, GAME_OVER }

Clock clock = new Clock();
Input input = new Input();
BulletManager bulletManager = new BulletManager();
EnemyManager enemyManager = new EnemyManager();
WaveManager waveManager = new WaveManager();
VFXManager vFXManager = new VFXManager();
ShieldManager shieldManager = new ShieldManager();
Sounds sounds;
UserInterface ui;
Player player;

PShader vhsShader;

// State
State gameState;
int score;
int highScore;
int killCount;

void setup() {
	size(600, 800, P2D);

	vhsShader = loadShader("vhs.glsl");
	vhsShader.set("iResolution", width, height, 1.0f);

	sounds = new Sounds(this);
	sounds.music.loop();

	loadHighScore();
	ui = new UserInterface();
	player = new Player(400, 740, PLAYER_SIZE.x, PLAYER_SIZE.y, 240);

	gameState = State.MENU;
}

void update() {
	float deltaTime = clock.tick();

	input.update();

	if(gameState == State.MENU){
		if(input.anyKeyDown){
			startGame();
		}

	}else if (gameState == State.PLAYING || gameState == State.GAME_OVER) {
		player.update(deltaTime);
		enemyManager.update(deltaTime);
		bulletManager.update(deltaTime);
		vFXManager.update(deltaTime);
	}

	if(gameState == State.GAME_OVER){
		if(input.anyKeyDown){
			gameState = State.MENU;
		}
	}

	if (gameState == State.PLAYING) {
		if (input.pauseDown)
			gameState = State.PAUSED;
	}
	else if (gameState == State.PAUSED) {
		if (input.pauseDown)
			gameState = State.PLAYING;
	}
}

void draw() {
	update();
	background(0);
	drawBackGround();

	if(gameState == State.MENU){
		ui.drawTitle();
	}else if (gameState == State.PLAYING || gameState == State.GAME_OVER || gameState == State.PAUSED) {
		bulletManager.draw();
		shieldManager.draw();
		enemyManager.draw();
		player.draw();
		vFXManager.draw();
	}

	if(gameState == State.GAME_OVER){
		ui.drawGameOver();
	}

	if(gameState == State.PLAYING || gameState == State.PAUSED){
		ui.drawHUD();
	}

	if (gameState == State.PAUSED) {
		ui.drawPaused();
	}

	// Apply VHS filter.
	vhsShader.set("iTime", clock.time());
	filter(vhsShader);
}

void keyPressed() { input.keyPressed(); }
void keyReleased() { input.keyReleased(); }


void startGame() {
	reset();
	waveManager.nextWave();
	gameState = State.PLAYING;
}

void reset() {
	bulletManager.reset();
	enemyManager.reset();
	waveManager.reset();
	vFXManager.reset();
	player.reset();
	player.position.set((width - player.size.x) / 2, 740);
	ui.reset();

	shieldManager = new ShieldManager();
	score = 0;
	killCount = 0;
}

void gameOver() {
	if (gameState == State.GAME_OVER) return;

	println("Game over!");
	gameState = State.GAME_OVER;

	if (score > highScore) {
		highScore = score;
		saveHighScore();
	}
}

void loadHighScore() {
	if (!dataFile("../save.json").isFile()) return;

	JSONObject json = loadJSONObject("save.json");
	highScore = json.getInt("highScore");
}

void saveHighScore() {
	JSONObject json = new JSONObject();
	json.setInt("highScore", highScore);
	saveJSONObject(json, "save.json");
}


void drawBackGround(){
		stroke(color(0,0,255,255));
		strokeWeight(2);
		line(0,700,width,700);
		line(0,710,width,710);
		line(0,730,width,730);
		line(0,770,width,770);

		line(width * 0.2,700,0,height);
		line(width * 0.4,700,width * 0.3,height);
		line(width * 0.6,700,width * 0.7,height);
		line(width * 0.8,700,width,height);
}
