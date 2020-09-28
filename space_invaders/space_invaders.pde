BulletManeger b;

Shield shield;

void setup() {
	size(800, 800);

	robbansTest();	
}

void draw() {
	background(0);

	robbansTestUpt();
}


void robbansTest(){
	b = new BulletManeger();
	b.createBullet(100,100,1,1,1,1);
	b.createBullet(110,110,1,1,1,1);
	b.createBullet(120,120,1,1,1,1);
	b.createBullet(130,130,1,1,1,1);
	b.createBullet(255,255,1,1,1,1);
	b.createBullet(200,200,1,1,1,1);
	b.createBullet(210,210,1,1,1,1);
	b.createBullet(220,220,1,1,1,1);
	b.createBullet(230,230,1,1,1,1);
	b.createBullet(240,240,1,1,1,1);
	b.createBullet(250,250,1,1,1,1);
	b.createBullet(260,260,1,1,1,1);
	b.createBullet(270,270,1,1,1,1);
	b.createBullet(280,280,1,1,1,1);
	b.createBullet(290,290,1,1,1,1);
	b.createBullet(255,255,1,1,1,1);
	b.createBullet(300,300,1,1,1,1);
	b.createBullet(400,400,1,1,1,1);
	b.createBullet(400,400,0,1,1,1);
	b.createBullet(400,400,1,0,1,1);

	shield = new Shield(new PVector(500,500),128);
}

void robbansTestUpt(){
	b.moveStep(1);
	b.draw();

	b.checkCollision();
	shield.draw();
}