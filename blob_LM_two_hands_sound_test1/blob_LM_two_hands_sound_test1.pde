import de.voidplus.leapmotion.*;
import ddf.minim.*;



Blob[] blobs = new Blob[2];

LeapMotion leap;
Minim minim;
int t;

float leftX = 0;
float leftY = 0;
float rightX = 0;
float rightY = 0;

ArrayList<PVector> cursors = new ArrayList<PVector>();
  

void setup(){
   // size(1000, 600, P3D);
  fullScreen(P3D);
  colorMode(HSB);
    leap = new LeapMotion(this);
  minim = new Minim(this);
  for (int i = 0; i < blobs.length; i++){
    blobs[i] = new Blob(); 
  }
 
 
}


void draw() {

  background(200);
  cursors.clear();
  
  println("start");
  //strokeWeight(3);
  
  
  leftX = 0;
  leftY = 0;
  rightX = 0;
  rightY = 0;
    
    
    
    for (Hand hand : leap.getHands()) {
     
        Finger index = hand.getIndexFinger();
    PVector pos = index.getPosition();
      if (hand.isRight()) {
      println("right hand");
     //stroke(255, 200, 200);
       noStroke();
      fill(255,100,200);
      leftX = pos.x;
      leftY = pos.y;
      
    }
 
     else if (hand.isLeft()) {
      //stroke(200, 255, 200);
      noStroke();
      fill(255,200,100);
      println("left hand:");
      rightX = pos.x;
      rightY = pos.y;
    
       int numOut = hand.getOutstretchedFingers().size();
    
      if(numOut == t ) {
      //return;
    }
    else{
      t = numOut;
    
    if(t == 0){
      println("left: 0 finger");
    } else if(t == 5){
      println("left: 5 fingers");
    } 
    
    } 
    
     } //left hand ends
    
    } //for loop ends
     println("end");
     
     
     //for (int z = 0; z < blobs.length; z++){
   
  
     //blobs[0].show(leftX,leftY);
     //blobs[1].show(rightX,rightY);
     
     //}
     
    //loadPixels();
 if ((leftX != 0) && (rightX != 0)){
   for (int f = 0; f < blobs.length; f++){
          blobs[1].show(rightX,rightY);
          blobs[0].show(leftX,leftY);  
   }
     loadPixels();
     for (int i = 0; i < width; i++){
     for (int j = 0; j < height; j++){
       int ind = i + j * width;
       float sum = 0;
       for (Blob b : blobs) {
       float d = dist(i, j, b.pos.x, b.pos.y);
       sum += 500 * blobs[0].r/d;
       }
      pixels[ind] = color(constrain(sum,155,220), 100, 255); 
     
     }
    }
updatePixels();
 
     blobs[0].display();
     blobs[1].display();
     
     }

  
  if ((leftX == 0) && (rightX != 0)){
     loadPixels();
     for (int i = 0; i < width; i++){
     for (int j = 0; j < height; j++){
       int ind = i + j * width;
       float sum = 0;
       float d = dist(i, j, rightX, rightY);
       sum += 500 * 40/d;
      pixels[ind] = color(constrain(sum,155,220), 100, 255); 
     }
    }
 updatePixels();
     noFill();
    noStroke();
      ellipse(rightX, rightY, 40*2, 40*2);
     }

   if ((leftX != 0) && (rightX == 0)){
     loadPixels();
     for (int i = 0; i < width; i++){
     for (int j = 0; j < height; j++){
       int ind = i + j * width;
       float sum = 0;
       float d = dist(i, j, leftX, leftY);
       sum += 500 * 40/d;
      pixels[ind] = color(constrain(sum,155,220), 100, 255); 
     }
    }
    
    
 updatePixels();
     noFill();
    noStroke();
      ellipse(leftX, leftY, 40*2, 40*2);
      
     } else {
       
        loadPixels();
     for (int i = 0; i < width; i++){
     for (int j = 0; j < height; j++){
       int ind = i + j * width;
       float sum = 0;
       float d = dist(i, j, width/2, height/2);
       sum += 500 * 40/d;
      pixels[ind] = color(constrain(sum,155,220), 100, 255); 
     }
    }
 
 updatePixels();
     noFill();
    noStroke();
      ellipse(width/2, height/2, 40*2, 40*2);
     
       
     }
    }
    
    
