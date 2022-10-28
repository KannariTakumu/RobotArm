public class Arm {
  Joint hand;
  Joint elbow;
  Joint shoulder;

  private float shoulder_branch_length;
  private float elbow_branch_length;
  private int joint_size;
  private int[] joint_color;
  private int[] branch_color;
  private int background_color;
  private float shoulder_angle;
  private float elbow_angle;
  private float[] shoulder_pos;
  private float[] target_pos;


  Arm(float shoulder_branch_length_arg, float elbow_branch_length_arg, int joint_size_arg, int[] joint_color_arg, int[] branch_color_arg, int background_color_arg) {
    //メンバ変数初期化
    shoulder_branch_length = shoulder_branch_length_arg;
    elbow_branch_length = elbow_branch_length_arg;
    joint_size = joint_size_arg;
    joint_color = joint_color_arg;
    branch_color = branch_color_arg;
    background_color = background_color_arg;
    shoulder_angle = 0.0;
    elbow_angle = 0.0;
    shoulder_pos = new float[2];
    shoulder_pos[0] = 0;
    shoulder_pos[1] = height / 2.0;
    hand = new Joint(AngleToPosHand()[0], AngleToPosHand()[1], joint_size, joint_color, branch_color, null);
    elbow = new Joint(AngleToPosElbow()[0], AngleToPosElbow()[1], joint_size, joint_color, branch_color, hand);
    shoulder = new Joint(shoulder_pos[0], shoulder_pos[1], joint_size, joint_color, branch_color, elbow);
    target_pos = hand.Pos();
  }

  //描画
  public void Show() {
    MouseRangeShow();
    shoulder.Show();
    elbow.Show();
    hand.Show();
  }

  //マウスで座標を指定できる範囲を描画
  private void MouseRangeShow() {
    noFill();
    ellipse(shoulder_pos[0], shoulder_pos[1], 2*(shoulder_branch_length + elbow_branch_length), 2*(shoulder_branch_length + elbow_branch_length));
  }
  
  //座標指定バリデーション
  private boolean ValidTarget(){
    float x_distance = target_pos[0] - shoulder_pos[0];
    float y_distance = target_pos[1] - shoulder_pos[1];
    float distance = sqrt(x_distance * x_distance + y_distance * y_distance);
    float range = (shoulder_branch_length + elbow_branch_length);
    if (distance > range){
      return false;
    }
    return true;
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

  //位置更新
  public void UpdatePosition() {
    //角度更新
    PosToAngle();

    //位置更新
    hand = new Joint(AngleToPosHand()[0], AngleToPosHand()[1], joint_size, joint_color, branch_color, null);
    elbow = new Joint(AngleToPosElbow()[0], AngleToPosElbow()[1], joint_size, joint_color, branch_color, hand);
    shoulder = new Joint(shoulder_pos[0], shoulder_pos[1], joint_size, joint_color, branch_color, elbow);
    
    //画面リセット
    background(background_color);
    
    //表示
    Show();
    text(target_pos[0] + " , " + (shoulder_pos[1] - target_pos[1]), 250, 200);
    text(shoulder_angle * 180.0 / PI + " , " + elbow_angle * 180.0 / PI, 250, 250);
  }

  //座標から角度
  private void PosToAngle() {
    float x = target_pos[0];
    float y = shoulder_pos[1] - target_pos[1];
    float l1 = shoulder_branch_length;
    float l2 = elbow_branch_length;

    float numerator = x * x + y * y + l1 * l1 - l2 * l2;
    float denominator = 2 * l1 * sqrt(x * x + y * y);
    shoulder_angle = acos(numerator / denominator) + atan(y / x);

    numerator = y - l1 * sin(shoulder_angle);
    denominator = x - l1 * cos(shoulder_angle);
    float temp_angle = atan(numerator / denominator);
    if (target_pos[1] > shoulder_pos[1]) {
      if (temp_angle > (0 * PI / 180)) {
        temp_angle = -PI + temp_angle;
      }
    }
    elbow_angle = temp_angle - shoulder_angle;
  }

  //target_posに代入
  public void TargetPos(float[] pos) {
    float[] buf_target = target_pos;
    target_pos = pos;
    if (!ValidTarget()){
      target_pos = buf_target;
    }
  }

  //target_posを取得
  public float[] TargetPos() {
    return target_pos;
  }

  //joint_color取得
  public int[] JointColor() {
    return joint_color;
  }

  //branch_color取得
  public int[] BranchColor() {
    return branch_color;
  }

  //joint_size取得
  public int JointSize() {
    return joint_size;
  }
}
