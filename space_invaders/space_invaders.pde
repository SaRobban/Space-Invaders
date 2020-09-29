final float BULLET_SPEED = 150;
final PVector BULLET_SIZE = new PVector(5, 5);
final PVector PLAYER_SIZE = new PVector(20, 20);

Clock clock = new Clock();
Input input = new Input();
BulletManager bulletManager = new BulletManager();
EnemyManager enemyManager = new EnemyManager();
Shield shield;
Player player;

// State
boolean gameOver;

void setup() {
	size(800, 800);

	player = new Player(400, 650, PLAYER_SIZE.x, PLAYER_SIZE.y, 240);
	shield = new Shield(new PVector(500,500), 16);
}

void update() {
	float deltaTime = clock.tick();

	player.update(deltaTime);
	bulletManager.update(deltaTime);
}

void draw() {
	update();

	background(0);
	bulletManager.draw();
	shield.draw();
	player.draw();

	if (gameOver) {
		fill(255);
		textAlign(CENTER, CENTER);
		textSize(42);
		text("Game Over", width / 2, height / 2);
	}
}

void keyPressed() {
	input.keyPressed();
}

void keyReleased() {
	input.keyReleased();
}