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

  
  //関節
  int[] joint_color = {0, 0, 240};
  int[] branch_color = {0, 0, 0};
  int joint_size = 40;
  
  //関節オブジェクト作成
  Joint hand = new Joint(150, 150, joint_size, joint_color, branch_color, null);
  Joint elbow = new Joint(100, 100, joint_size, joint_color, branch_color, hand);
  Joint shoulder = new Joint(50, 50, joint_size, joint_color, branch_color, elbow);
  
  //描画
  shoulder.Show();
  elbow.Show();
  hand.Show();
}

void draw() {
}
