/**
    CSci-4611 Assignment #1 Text Rain
**/


import processing.video.*;

// Global variables for handling video data and the input selection screen
String[] cameras;
Capture cam;
Movie mov;
PImage inputImage;
boolean inputMethodSelected = false;

int current = 0;
float x_size = 1280;
float y_size = 720;

int between = 5;
int dark = 128;

String fp;

int videoScale = 8;
// Number of columns and rows in the system
int cols, rows;

Letter[] letters;
PShader blur;
int debug = -1;


void setup() {
  size(1280, 720);  
  inputImage = createImage(width, height, RGB);
  //colorMode(HSB, 360, 100, 100);
  loadFont("TrebuchetMS-Bold-20.vlw");
  fp = loadStrings("francisponge.txt")[0];
  cols = width / videoScale;  
  rows = height / videoScale;  
  letters = new Letter[fp.length()];
    for (int i = 0; i < fp.length(); i++) {
      int rand_x = (int)random(x_size);
      //println("Random"+rand_x);
      letters[i] = new Letter(rand_x, 0, fp.charAt(i));
    }
}

void draw() {
  // When the program first starts, draw a menu of different options for which camera to use for input
  // The input method is selected by pressing a key 0-9 on the keyboard
  if (!inputMethodSelected) {
    cameras = Capture.list();
    int y=40;
    text("O: Offline mode, test with TextRainInput.mov movie file instead of live camera feed.", 20, y);
    y += 40; 
    for (int i = 0; i < min(9,cameras.length); i++) {
      text(i+1 + ": " + cameras[i], 20, y);
      y += 40;
    }
    return;
  }


  // This part of the draw loop gets called after the input selection screen, during normal execution of the program.

  
  // STEP 1.  Load an image, either from a movie file or from a live camera feed. Store the result in the inputImage variable
  
  if ((cam != null) && (cam.available())) {
    cam.read();
    inputImage.copy(cam, 0,0,cam.width,cam.height, 0,0,inputImage.width,inputImage.height);
  }
  else if ((mov != null) && (mov.available())) {
    mov.read();
    inputImage.copy(mov, 0,0,mov.width,mov.height, 0,0,inputImage.width,inputImage.height);
  }


  // Fill in your code to implement the rest of TextRain here..

  // Tip: This code draws the current input image to the screen
  
  if(debug == 1){
    inputImage.loadPixels();  
    for (int i = 0; i < cols; i++) {    
      // Begin loop for rows    
      for (int j = 0; j < rows; j++) {      
        // Where are you, pixel-wise?      
        int x = i*videoScale;      
        int y = j*videoScale;    
        
        // Reverse the column to mirro the image.
        int loc = (inputImage.width - i - 1) + j * inputImage.width;       
        
        color c = inputImage.pixels[loc];
        // A rectangle's size is calculated as a function of the pixel’s brightness. 
        // A bright pixel is a large rectangle, and a dark pixel is a small one.
        float sz = (brightness(c)/255) * videoScale;       
        
        rectMode(CENTER);      
        fill(255);      
        noStroke();      
        rect(x + videoScale/2, y + videoScale/2, sz, sz);    
      }  
    }
    fill(51, 204, 255);
    text("Debug Mode: On", 10, 10);
  } else{
    set(0, 0, inputImage);
  }
  
  
  for(int i = 0; i < current/between; i++){//(int)(current/between); i++){
    letters[i].display();
    letters[i].drop();
  }
  current=(current+1)%(between*letters.length);

}


//modified version of the letter class from the Processing String tutorial
class Letter {
  char letter;
  float homex,homey;
  //its current location
  int x,y;
  float count;

  Letter (int x_, int y_, char letter_) {
    homex = x = x_;
    homey = y = y_;
    letter = letter_; 
    count = -y_size;
  }

  // Display the letter
  void display() {
    float alpha = 255;
    count++;
    if(count > 0){
      alpha = 255-count;
    }
    textAlign(LEFT);
    fill(51, 204, 255, alpha);
    text(letter,x,y);
    if(count == y_size){
      count = 0;
      x=(int)homex;
      y=(int)homey;
    }
  }
  
  void drop() {
    color up = get(x,y-1);
    color left = get(x-1,y);
    color right = get(x+1,y);
    //color bottom_left = get(x-1,y+1);
    //color bottom_right = get(x-1,y+1);
    color bottom = get(x,y+1);
    color here = get(x, y);
    
    if(brightness(bottom) > dark){ //Bright below
      y++;
     } else if (brightness(here) < dark){ //Dark here
        y=y-9;
    } else if (brightness(left) < dark ) { //Dark Below, Dark Left
      if(brightness(right) > dark){ //Dark Left, Bright Right
         x++;
       } else{ //Dark Left, Dark Right, nowhere to go
         return;
       }
    } else if (brightness(right) < dark){ //Dark Right, Bright Left
      x--;
    } 
  }
}

void keyPressed() {
  
  if (!inputMethodSelected) {
    // If we haven't yet selected the input method, then check for 0 to 9 keypresses to select from the input menu
    if ((key >= '0') && (key <= '9')) { 
      int input = key - '0';
      if (input == 0) {
        println("Offline mode selected.");
        mov = new Movie(this, "TextRainInput.mov");
        mov.loop();
        inputMethodSelected = true;
      }
      else if ((input >= 1) && (input <= 9)) {
        println("Camera " + input + " selected.");           
        // The camera can be initialized directly using an element from the array returned by list():
        cam = new Capture(this, cameras[input-1]);
        cam.start();
        inputMethodSelected = true;
      }
    }
    return;
  }


  // This part of the keyPressed routine gets called after the input selection screen during normal execution of the program
  // Fill in your code to handle keypresses here..
  
  if (key == CODED) {
    if (keyCode == UP) {
      // up arrow key pressed
      dark += 8;
      if (dark > 256){
        dark = 256;
      }
    }
    else if (keyCode == DOWN) {
      // down arrow key pressed
      dark -= 8;
      if (dark < 0){
        dark = 0;
      }
    }
  }
  else if (key == ' ') {
    // space bar pressed
    debug = debug*-1;
  } 
}