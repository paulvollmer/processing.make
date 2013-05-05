void setup() {
  size(500, 400);
}

void draw() {
  background(0, 0, 255);
  
  stroke(255);
  line(0, 0, width, height);
  line(0, height, width, 0);
}
