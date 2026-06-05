// Main Game File
Bird player;
Platform[] platforms = new Platform[10];
Obstacle[] gears = new Obstacle[3];
boolean isGameOver = false;
int score = 0;

void setup() {
  size(400, 600);
  player = new Bird();
  
  // Initialize Objects
  for (int i = 0; i < platforms.length; i++) {
    platforms[i] = new Platform(random(width-60), i * 70, (random(1) > 0.8));
  }
  for (int i = 0; i < gears.length; i++) {
    gears[i] = new Obstacle(random(width), random(-height, 0));
  }
}

void draw() {
  if (!isGameOver) {
    drawJungleBackground(); // Draw the jungle and sky logic
    
    for (Platform p : platforms) { p.display(); p.update(); }
    for (Obstacle g : gears) {
      g.display(); g.update();
      if (g.checkCollision(player)) isGameOver = true;
    }
    
    player.update();
    player.display();
    checkPlatformCollisions();
    
    // UI - Score Display
    fill(255); textSize(22); textAlign(LEFT);
    text("Score: " + score, 20, 40);
  } else {
    displayGameOver();
  }
}

void mousePressed() {
  if (!isGameOver) {
    if (player.vy > -2) player.flap();
  } else {
    resetGame();
  }
}

// Logic to draw Jungle and Sky without external images
void drawJungleBackground() {
  // 1. Draw Sky (Gradient)
  for (int i = 0; i < height; i++) {
    float inter = map(i, 0, height/2, 0, 1);
    stroke(135, 206, 235 - (inter * 50)); // Light blue to slightly darker
    line(0, i, width, i);
  }
  
  // 2. Draw Distant Mountains/Trees (Simplified)
  noStroke();
  fill(34, 139, 34, 150); // Forest green with transparency
  ellipse(100, 550, 400, 200);
  ellipse(350, 560, 350, 180);
  
  // 3. Draw Ground
  fill(20, 80, 20);
  rect(0, 550, width, 50);
}

void checkPlatformCollisions() {
  for (Platform p : platforms) {
    if (player.vy > 0 && player.x + 15 > p.x && player.x - 15 < p.x + 60 && 
        player.y + 14 > p.y && player.y + 14 < p.y + 12) {
      if (p.isBrown) p.isActive = false;
      else player.flap();
    }
  }
}

void displayGameOver() {
  background(20, 40, 20);
  fill(255, 50, 50); textAlign(CENTER); textSize(40);
  text("GAME OVER", width/2, height/2);
  fill(255); textSize(20);
  text("Score: " + score, width/2, height/2 + 40);
  text("Click to Restart", width/2, height/2 + 80);
}

void resetGame() { isGameOver = false; score = 0; setup(); }
