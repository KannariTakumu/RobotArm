public class Arm {
  Joint hand;
  Joint elbow;
  Joint shoulder;

  private float shoulder_branch_length;
  private float elbow_branch_length;
  private int joint_size;
  private int[] joint_color;
  private int[] branch_color;
  private float shoulder_angle;
  private float elbow_angle;
  private float[] shoulder_pos;


  Arm(float shoulder_branch_length_arg, float elbow_branch_length_arg, int joint_size_arg, int[] joint_color_arg, int[] branch_color_arg) {
    //メンバ変数初期化
    shoulder_branch_length = shoulder_branch_length_arg;
    elbow_branch_length = elbow_branch_length_arg;
    joint_size = joint_size_arg;
    joint_color = joint_color_arg;
    branch_color = branch_color_arg;
    shoulder_angle = 0.0;
    elbow_angle = 0.0;
    shoulder_pos = new float[2];
    shoulder_pos[0] = float(joint_size) / 2.0;
    shoulder_pos[1] = height - float(joint_size) / 2.0;
    hand = new Joint(AngleToPosHand()[0], AngleToPosHand()[1], joint_size, joint_color, branch_color, null);
    elbow = new Joint(AngleToPosElbow()[0], AngleToPosElbow()[1], joint_size, joint_color, branch_color, hand);
    shoulder = new Joint(shoulder_pos[0], shoulder_pos[1], joint_size, joint_color, branch_color, elbow);
  }
  
  //描画
  public void Show() {
    shoulder.Show();
    elbow.Show();
    hand.Show();
  }

  //Elbow 角度から座標
  private float[] AngleToPosElbow() {
    float[] pos = new float[2];
    pos[0] = shoulder_branch_length * cos(shoulder_angle) + shoulder_pos[0];
    pos[1] = -shoulder_branch_length * sin(shoulder_angle) + shoulder_pos[1];
    return pos;
  }
  
  //Hand 角度から座標
  private float[] AngleToPosHand() {
    float[] pos = new float[2];
    pos[0] = AngleToPosElbow()[0] + elbow_branch_length * cos(shoulder_angle + elbow_angle);
    pos[1] = AngleToPosElbow()[1] - elbow_branch_length * sin(shoulder_angle + elbow_angle);
    return pos;
  }
  
  //座標から角度（未完成）
  private float[] PosToAngle() {
    float[] angle = new float[2];
    return angle;
  }
}
