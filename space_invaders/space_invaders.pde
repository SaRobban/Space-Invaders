Clock clock = new Clock();
Input input = new Input();
BulletManager bulletManager = new BulletManager();
EnemyManager enemyManager = new EnemyManager();
VFXManager vFXManager = new VFXManager();
Shield shield;
Player player;

UserInterface ui;
// State
boolean gameOver;
int score;
int highScore;

void setup() {
	size(600, 800);
	loadHighScore();

	player = new Player(400, 740, PLAYER_SIZE.x, PLAYER_SIZE.y, 240);
	shield = new Shield(new PVector(500, 500), 50);

	enemyManager.createEnemyGroup(100, ENEMY_SIZE, ENEMY_SPEED, 8, 4);

	ui = new UserInterface(); 
}

void update() {
	float deltaTime = clock.tick();

	player.update(deltaTime);
	enemyManager.update(deltaTime);
	bulletManager.update(deltaTime);
	vFXManager.update(deltaTime);
}

void draw() {
	update();

	background(0);
	bulletManager.draw();
	shield.draw();
	enemyManager.draw();
	player.draw();
	vFXManager.draw();
	ui.drawUI();
	ui.drawHUD();
}

void keyPressed() {
	input.keyPressed();
}

void keyReleased() {
	input.keyReleased();
}

void gameOver() {
	if (gameOver) return;

	println("Game over!");
	gameOver = true;
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
