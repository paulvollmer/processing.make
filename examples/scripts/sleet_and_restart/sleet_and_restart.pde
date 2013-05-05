
void setup() {
  println("Start sleet_and_restart.pde");
  size(640, 360);
}

void draw() {
  println("-- Begin Draw");
  background(0);
  for (int i=0; i<500; i++){
    fill(255, 127);
    noStroke();
    rect(random(0, width), random(0, height), 20, 20);
  }
  noStroke();
  fill(200);
  rect(0, height-30, 100, height);
  fill(0);
  text(hour()+":"+minute()+":"+second(), 20, height-10);
  println("-- End Draw");

  saveFrame("filename_"+hour()+"_"+minute()+"_"+second()+".png");
  println("save image ready");

  exit();
  println("exit sleet_and_restart.pde");
}
