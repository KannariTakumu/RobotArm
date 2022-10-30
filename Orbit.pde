public class Orbit{
  private ArrayList<ArrayList<Float>> orbit_pos = new ArrayList<>();
  private int limit;
  
  public Orbit(int limit_arg){
    limit = limit_arg;
  }
  
  public void AddOrbitPos(float[] pos){
    ArrayList<Float> pos_list = new ArrayList<>();
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
}
