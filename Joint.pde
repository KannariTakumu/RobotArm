public class Joint{
  private int xp, yp;
  private int size;
  private int[] joint_color_rgb;
  private int[] arm_color_rgb;
  private Joint next;
 
  public Joint(int xp_arg, int yp_arg, int size_arg, int[] joint_color_rgb_arg, int[] arm_color_rgb_arg, Joint next_arg){
    xp = xp_arg;
    yp = yp_arg;
    size = size_arg;
    joint_color_rgb = joint_color_rgb_arg;
    arm_color_rgb = arm_color_rgb_arg;
    next = next_arg;
  }
  
  //描画
  public void Show(){
    //腕の描画
    if (next != null){
      stroke(arm_color_rgb[0], arm_color_rgb[1], arm_color_rgb[2]);
      strokeWeight(5);
      line(xp, yp, next.Xp(), next.Yp());
      strokeWeight(0);
    }
    
    //関節の描画
    fill(joint_color_rgb[0], joint_color_rgb[1], joint_color_rgb[2]);
    ellipse(xp, yp, size, size);  
  }
  
  //X座標取得
  public int Xp(){
    return xp;
  }
  
  //Y座標取得
  public int Yp(){
    return yp;
  }
  
  //座標更新
  public void UpdatePos(int x, int y){
    xp = x;
    yp = y;
  }
}
