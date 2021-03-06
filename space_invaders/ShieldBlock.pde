// Robert

class Shield extends Entity{
	int pixsLengthX, pixsLengthY;
	DestructiblePixel[][] pixs;

	Shield(PVector pos, int sizeX, int sizeY){
		super(pos, new PVector(sizeX, sizeY));
		this.pixsLengthX = sizeX;
		this.pixsLengthY = sizeY;
		pixs = new DestructiblePixel[sizeX][sizeY];

		for(int x = 0; x < pixsLengthX -1; x++){
			for(int y = 0; y < pixsLengthY -1; y++){
				pixs[x][y] = new DestructiblePixel(PVector.add(pos, new PVector(x, y)));
			}
		}
	}

	//Collider Test against pixels in shield, returns true if thats the case //can clip trogh if to small
	public boolean colliderTest(PVector otherPos){
		if(checkRect(otherPos)){
			if(checkCollision(otherPos)){
				return true;
			}else{
				return false;
			}
		}else{
			return false;
		}
	}

	//Check if inside square
	private boolean checkRect(PVector otherPos) {
		if(otherPos.x > position.x && otherPos.x < position.x + size.x){
			if(otherPos.y > position.y && otherPos.y < position.y + size.y){
				return true;
			}else{
				return false;
			}
		}else{
			return false;
		}
	}


	private boolean checkCollision(PVector otherPos){
		int otherX = (int)otherPos.x;
		int otherY = (int)otherPos.y;

		//TODO: Extra checkup to prevent collision overshoot in pixel collision due to frameTime
		boolean collided = false;
		for(int x = 0; x < pixsLengthX -1; x++){
			for(int y = 0; y < pixsLengthY -1; y++){
				if(pixs[x][y].active){
					if(otherX == pixs[x][y].position.x && otherY == pixs[x][y].position.y){
						makeHole(otherPos);
						collided = true;
					}
				}
			}
		}
		return collided;
	}


	private void makeHole(PVector otherPos) {
		PVector localPos = PVector.sub(otherPos, position);
		int boomSize = 10;
		int boomSqr = boomSize * boomSize;

		int minX = (int)localPos.x - boomSize;
		int maxX = (int)localPos.x + boomSize;
		int minY = (int)localPos.y - boomSize;
		int maxY = (int)localPos.y + boomSize;

		if(minX < 0)
			minX = 0;

		if(maxX >= pixsLengthX)
			maxX = pixsLengthX-1;

		if(minY < 0)
			minY = 0;

		if(maxY >= pixsLengthY)
			maxY = pixsLengthY-1;

		for(int x = minX; x < maxX; x++){
			for(int y = minY; y < maxY; y++){
				PVector dir = PVector.sub(otherPos, pixs[x][y].position);
				float sqr = dir.magSq();
				if(sqr < boomSqr){
					pixs[x][y].active = false;
				}
			}
		}
	}

	@Override
	public void draw(){
		for(int x = 0; x < pixsLengthX -1; x++){
			for(int y = 0; y < pixsLengthY -1; y++){
				pixs[x][y].draw();
			}
		}
	}
}


class DestructiblePixel{
	PVector position;
	boolean active = true;
	Sprite sprite;

	public DestructiblePixel(PVector position){
		this.position = position;
		this.sprite = new Sprite("Pixel");
	}


	public void draw(){
		if(active)
			sprite.draw(position, new PVector(1,1));
	}
}