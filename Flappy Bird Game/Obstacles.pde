class Obstacle {
  float x, y, angle;
  float spinSpeed = 0.2; // High speed rotation
  
  Obstacle(float xPos, float yPos) { x = xPos; y = yPos; }
  
  void display() {
    pushMatrix();
    translate(x, y);
    rotate(angle);
    fill(150); stroke(50);
    // Draw 8 teeth using a for loop
    for (int i = 0; i < 8; i++) {
      pushMatrix();
      rotate(TWO_PI * i / 8);
      rect(12, -4, 8, 8, 2);
      popMatrix();
    }
    ellipse(0, 0, 32, 32); // Main body
    fill(100); ellipse(0, 0, 10, 10); // Center
    angle += spinSpeed;
    popMatrix();
  }
  
  void update() {
    y += 3; // Falling speed
    if (y > height) { y = random(-800, -200); x = random(width); }
  }
  
  boolean checkCollision(Bird b) { return dist(x, y, b.x, b.y) < 30; }
}
