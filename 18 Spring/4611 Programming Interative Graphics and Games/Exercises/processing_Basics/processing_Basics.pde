

int x = 0;
float p1 = 255;
float p2 = 255;
PImage jiggly;
void setup(){
  size(1024,1024);
  textFont(loadFont("BellMTItalic-48.vlw"));
  jiggly = loadImage("GoodTokenJigglyBits.png");
  
}

void draw(){
  background((x/2)%255,(x/4)%255,(x/8)%255);
  fill((x/4)%255,(x/8)%255,x%255);
  
  image(jiggly, x,255);
  x=(x+8)%1275;
  text(x,x,x);
  arc(mouseX, mouseY, 255, 255, x%QUARTER_PI,(x%QUARTER_PI)+7*QUARTER_PI, PIE);
  ellipse(p1, p2, 25,25);
  if(mouseX >= p1-25 && mouseY >= p2-25 && mouseX <= p1+25 && mouseY <= p2+25){
    p1 = random(1024);
    p2 = random(1024);
  }
}