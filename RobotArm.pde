Arm robot_arm;

//テスト用フラグ
boolean target_mode = false;
boolean orbit_mode = true;


void settings(){
   //スクリーン
  int screen_height = 500;
  int screen_width = 500;
  size(screen_height, screen_width);
  
}

void setup() {
  //スクリーン
  int frame_rate = 60;
  int background_color = 240;
  frameRate(frame_rate);
  background(background_color);

  
  //Arm 値設定
  float shoulder_branch_length = 200.0;
  float elbow_branch_length = 200.0;
  int joint_size = 40;
  int[] joint_color = {0, 0, 240};
  int[] branch_color = {0, 0, 0};
  
  //Armオブジェクト作成
  robot_arm = new Arm(shoulder_branch_length, elbow_branch_length, joint_size, joint_color, branch_color, background_color);
  
  //描画
  robot_arm.Show();
}

void draw() {
  //直線的に目標まで移動
  robot_arm.Update();
  
  if (mousePressed && orbit_mode){
    //軌道を描く
    robot_arm.MouseOrbitPos(new float[]{mouseX,mouseY});
  }else{
    //軌道上を動く
    robot_arm.MouseOrbitStart();
  }
}

void mousePressed(){
  if (target_mode){
    robot_arm.TargetPos(new float[]{mouseX,mouseY});
  }
  
}
