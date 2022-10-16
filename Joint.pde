public class Joint{
  private int xp, yp;
  private int radius;
  private int[] joint_color_rgb;
  private int[] arm_color_rgb;
  private Joint next;
  
  public Joint(int xp_arg, int yp_arg, int radius_arg, int[] joint_color_rgb_arg, int[] arm_color_rgb_arg, Joint next_arg){
    xp = xp_arg;
    yp = yp_arg;
    radius = radius_arg;
    joint_color_rgb = joint_color_rgb_arg;
    arm_color_rgb = arm_color_rgb_arg;
    next = next_arg;
  }
  
  public void Show(){
    //半腕
    if (next != null){
      stroke(arm_color_rgb[0], arm_color_rgb[1], arm_color_rgb[2]);
      strokeWeight(5);
      line(xp, yp, next.Xp(), next.Yp());
      strokeWeight(0);
      //line(0, 0, 500, 500);
    }
    
    fill(joint_color_rgb[0], joint_color_rgb[1], joint_color_rgb[2]);
    ellipse(xp, yp, radius, radius);  
  }
  
  public int Xp(){
    return xp;
  }
  
  public int Yp(){
    return yp;
  }
  
  public void UpdatePos(int x, int y){
    xp = x;
    yp = y;
  }
}
