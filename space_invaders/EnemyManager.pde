class EnemyManager{
	public ArrayList<Enemy> enemyList;

	public EnemyManager(){
		enemyList = new ArrayList<Enemy>();
	}


	public ArrayList getListOfEnemys(){
		return(enemyList);
	} 


	public void addEnemyToList(PVector position, PVector direction, PVector size, float speed){
		enemyList.add(new Enemy(position, direction, size, speed));
	}

	public void addEnemyToList(float posX, float posY, float dirX, float dirY, float sizeX, float sizeY, float speed){
		enemyList.add(new Enemy(new PVector(posX, posY), new PVector(dirX, dirY), new PVector(sizeX, sizeY), speed));
	}


	public void removeEnemyFromList(Enemy e){
		enemyList.remove(e);
	}


	public void update(float deltaTime){
		for (int i = 0; i < enemyList.size(); i++){
			enemyList.get(i).update(deltaTime);
		}
	}


	public void draw(){
		for (int i = 0; i < enemyList.size(); i++){
			enemyList.get(i).draw();
		}
	}
}