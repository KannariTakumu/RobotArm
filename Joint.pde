public class Joint{
  private float xp, yp;
  private int size;
  private int[] joint_color;
  private int[] branch_color;
  private Joint next;
 
  public Joint(float xp_arg, float yp_arg, int size_arg, int[] joint_color_arg, int[] branch_color_arg, Joint next_arg){
    xp = xp_arg;
    yp = yp_arg;
    size = size_arg;
    joint_color = joint_color_arg;
    branch_color = branch_color_arg;
    next = next_arg;
  }
  
  //描画
  public void Show(){
    //腕の描画
    if (next != null){
      stroke(branch_color[0], branch_color[1], branch_color[2]);
      strokeWeight(5);
      line(xp, yp, next.Pos()[0], next.Pos()[1]);
      strokeWeight(1);
    }
    
    //関節の描画
    fill(joint_color[0], joint_color[1], joint_color[2]);
    ellipse(xp, yp, size, size);  
  }
  
  //座標取得
  public float[] Pos(){
    return new float[] {xp, yp};
  }
  
  //座標更新
  public void UpdatePos(int x, int y){
    xp = x;
    yp = y;
  }
}
