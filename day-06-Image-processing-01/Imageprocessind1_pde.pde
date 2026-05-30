PImage img;

void setup(){
size(500,600);
img=loadImage("image2.jpg");
img.resize(width,height);
background(0);
}

void draw(){
//image(img,0,0);
color C=img.get(mouseX,mouseY);

if (mouseButton == RIGHT ){
  C= color (0);
}
else{
C = img.get(mouseX,mouseY);
}



float speed=dist(pmouseX,pmouseY,mouseX,mouseY);
float size=map(speed,0,50,5,40);

stroke(C);
strokeWeight(20);
//fill (C);
//ellipse(mouseX,mouseY, 20,20);
line(pmouseX,pmouseY,mouseX,mouseY);
}

void keyPressed(){

if (key == 'c' || key == 'C'){
background(0);
}

if (key == 's' || key == 'S'){
save("file.png");
}
}
