public class Arm{
  Joint hand;
  Joint elbow;
  Joint shoulder;
  
  private float root_branch_length;
  private float end_branch_length;
  private int joint_size;
  private int[] joint_color;
  private int[] branch_color;
  private float shoulder_angle;
  private float elbow_angle;
  
  
  Arm(float root_branch_length_arg, float end_branch_length_arg, int joint_size_arg, int[] joint_color_arg, int[] branch_color_arg){
    root_branch_length = root_branch_length_arg;
    end_branch_length = end_branch_length_arg;
    joint_size = joint_size_arg;
    joint_color = joint_color_arg;
    branch_color = branch_color_arg;
    shoulder_angle = 0.0;
    elbow_angle = 0.0;
    
    hand = new Joint(150, 150, joint_size, joint_color, branch_color, null);
    elbow = new Joint(100, 100, joint_size, joint_color, branch_color, hand);
    shoulder = new Joint(0, 0, joint_size, joint_color, branch_color, elbow);
  }
  
  private float[] AngleToPosElbow(){
    float[] pos = new float[2];
    return pos;
  }
  
  private float[] AngleToPosHand(){
    float[] pos = new float[2];
    return pos;
  }
  
  private float[] PosToAngle(){
    float[] angle = new float[2];
    return angle;
  }
}
