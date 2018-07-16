noFill();
size(1000,500);
beginShape();
for(int x = 0; x<=6; x++){
  vertex(50+cos(x*PI/3)*30, 50+sin(x*PI/3)*30);
}
endShape();

beginShape();
for(float x = 0; x<=100;x=x+0.1){
  vertex(x*10, cos(x)*10+250);
}
endShape();


beginShape(TRIANGLE_FAN);
vertex(100,100);
for(int x=0; x<=10;x++){
  float angle = x*PI/5;
  float radius = 30;
  if(x%2==0){
    radius = 50;
  }
  vertex(100+cos(angle)*radius, 100+sin(angle)*radius);
}
endShape();

beginShape(TRIANGLE_STRIP);
for(float x=0; x<=1000;x+=10){
  float frac = x/1000.0;
  float angle = -PI/2.0 + frac*PI;
  float height= 100.0*cos(angle);
  vertex(x,400-height);
  vertex(x,400+height);
}
endShape();