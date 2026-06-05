class Bird {
  float x, y, vy;
  float gravity = 0.5;
  
  Bird() { x = width/2; y = height/2; vy = 0; }
  
  void update() {
    vy += gravity;
    y += vy;
    if (keyPressed) {
      if (keyCode == LEFT) x -= 6;
      if (keyCode == RIGHT) x += 6;
    }
    // Screen Wrapping
    if (x < -15) x = width + 15;
    if (x > width + 15) x = -15;
    if (y > height) isGameOver = true;
  }
  
  void display() {
    pushMatrix();
    translate(x, y);
    stroke(0); strokeWeight(1);
    fill(255, 220, 0); ellipse(0, 0, 34, 28); // Body
    fill(255, 250, 150); arc(-5, 5, 20, 15, 0, PI+QUARTER_PI, CHORD); // Wing
    fill(255); ellipse(8, -5, 10, 10); // Eye
    fill(0); ellipse(10, -5, 4, 4); // Pupil
    fill(255, 100, 0); triangle(15, -2, 15, 6, 25, 2); // Beak
    popMatrix();
  }
  
  void flap() { vy = -10; }
}
