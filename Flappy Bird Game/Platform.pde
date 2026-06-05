class Platform {
  float x, y;
  boolean isBrown;
  boolean isActive = true;
  
  Platform(float xP, float yP, boolean b) { x = xP; y = yP; isBrown = b; }
  
  void display() {
    if (isActive) {
      noStroke();
      if (isBrown) {
        fill(120, 60, 20); // Brown for broken
        rect(x, y, 60, 12, 5);
        stroke(0, 100); line(x+30, y, x+30, y+12); // Crack detail
      } else {
        fill(50, 205, 50); // Green for normal
        rect(x, y, 60, 12, 5);
      }
    }
  }
  
  void update() {
    // Scrolling effect
    if (player.y < height/2 && player.vy < 0) y -= player.vy;
    
    // Recycle platforms
    if (y > height) {
      y = 0;
      x = random(width-60);
      isActive = true;
      score++;
    }
  }
}
