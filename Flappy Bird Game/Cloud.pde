class Cloud {
  float x, y, speed;
  Cloud() { x = random(width); y = random(50, 200); speed = random(0.2, 0.8); }
  
  void move() {
    x -= speed;
    if (x < -60) { x = width + 60; y = random(50, 200); }
  }
  
  void display() {
    fill(255, 200); noStroke();
    ellipse(x, y, 50, 30);
    ellipse(x+20, y-10, 40, 30);
    ellipse(x-10, y-5, 40, 30);
  }
}
