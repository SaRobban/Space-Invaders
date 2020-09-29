Clock clock = new Clock();
Input input = new Input();
BulletManager bulletManager = new BulletManager();
Shield shield;
Player player;

void setup() {
	size(800, 800);

	player = new Player(400, 650, 40, 240);
	shield = new Shield(new PVector(500,500), 128);
}

void update() {
	float deltaTime = clock.tick();

	player.update(deltaTime);
}

void draw() {
	update();

	background(30);
	player.draw();
	shield.draw();
}

void keyPressed() {
	input.keyPressed();
}

void keyReleased() {
	input.keyReleased();
}