Clock clock = new Clock();
Input input = new Input();
Player player;

void setup() {
	size(800, 800);

	player = new Player(400, 650, 40, 240);
}

void update() {
	float deltaTime = clock.tick();

	player.update(deltaTime);
}

void draw() {
	update();

	background(30);
	player.draw();
}

void keyPressed() {
	input.keyPressed();
}

void keyReleased() {
	input.keyReleased();
}