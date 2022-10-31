public class Orbit{
  private ArrayList<ArrayList<Float>> orbit_pos = new ArrayList<ArrayList<Float>>();
  private int limit;
  
  public Orbit(int limit_arg){
    limit = limit_arg;
  }
  
  public void AddOrbitPos(float[] pos){
    ArrayList<Float> pos_list = new ArrayList<Float>();
    pos_list.add(pos[0]);
    pos_list.add(pos[1]);
    orbit_pos.add(pos_list);
  }
  
  public float[] GetEachOrbitPos(int i){
    float[] pos = new float[2];
    pos[0] = orbit_pos.get(i).get(0);
    pos[1] = orbit_pos.get(i).get(1);
    return pos;
  }
  
  public boolean Limit(){
    if (orbit_pos.size() > limit){
      return true;
    }
    return false;
  }
  
  public boolean InRange(int i){
    if (i <= orbit_pos.size() - 1){
      return true;
    }
    return false;
  }
      
  
  public boolean Empty(){
    if (orbit_pos.size() == 0){
      return true;
    }
    return false;
  }
  
  public void Reset(){
    orbit_pos.clear();
  }
  
  //軌道の描画
  public void Show(){
    for (int i = 0; i < orbit_pos.size() - 1; i++){
      fill(240, 0, 0);
      ellipse(orbit_pos.get(i).get(0), orbit_pos.get(i).get(1), 4, 4);
    }
  }
}
