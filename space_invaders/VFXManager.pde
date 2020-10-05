// Robert

class VFXManager{
	ArrayList<VFX> vfxList;

	VFXManager(){
		vfxList = new ArrayList<VFX>();
	}


	public void createABoom(PVector pos){
		vfxList.add(new VFX(pos, 20, 0.5));
	}


	public void remove(VFX vfx){
		vfxList.remove(vfx);
	}


	public void update(float deltaTime){
		for(int i = vfxList.size() - 1; i >= 0; i--){
			if(vfxList.get(i).isAlive()){
				vfxList.get(i).update(deltaTime);
			}else{
				vfxList.remove(i);
			}
		}
	}


	public void draw(){
		for(int i = 0; i < vfxList.size(); i++){
			vfxList.get(i).draw();
		}
	}


	public void reset() {
		vfxList.clear();
	}
}