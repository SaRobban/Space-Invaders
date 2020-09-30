enum State { MENU, PLAYING, GAME_OVER }

Clock clock = new Clock();
Input input = new Input();
BulletManager bulletManager = new BulletManager();
EnemyManager enemyManager = new EnemyManager();
VFXManager vFXManager = new VFXManager();
UserInterface ui;
Shield shield;
Player player;

// State
State gameState;
boolean gameOver; // TODO: Remove this.
int score;
int highScore;

void setup() {
	size(600, 800);
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
}

void draw() {
	update();

	background(0);

	if(gameState == State.MENU){
		ui.drawTitle();
	}else if (gameState == State.PLAYING || gameState == State.GAME_OVER) {
		bulletManager.draw();
		shield.draw();
		enemyManager.draw();
		player.draw();
		vFXManager.draw();
	}

	if(gameState == State.GAME_OVER){
		ui.drawGameOver();
	}

	if(gameState == State.PLAYING){
		ui.drawHUD();
	}
}

void keyPressed() { input.keyPressed(); }
void keyReleased() { input.keyReleased(); }


void startGame() {
	reset();

	enemyManager.createEnemyGroup(100, ENEMY_SIZE, ENEMY_SPEED, 7, 4);

	gameOver = false;
	gameState = State.PLAYING;
}

void reset() {
	bulletManager.reset();
	enemyManager.reset();
	vFXManager.reset();
	player.reset();
	player.position.set((width - player.size.x) / 2, 740);
	ui.reset();

	shield = new Shield(new PVector(500, 500), 50);
}

void gameOver() {
	if (gameOver) return;

	println("Game over!");
	gameOver = true;
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
