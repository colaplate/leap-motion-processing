import de.voidplus.leapmotion.*;
import ddf.minim.*;



Blob[] blobs = new Blob[2];

LeapMotion leap;
Minim minim;
AudioPlayer player;
int t;

AudioPlayer C1;
AudioPlayer C2;
AudioPlayer D1;
AudioPlayer D2;
AudioPlayer F1;
AudioPlayer F2;
AudioPlayer G1;
AudioPlayer G2;
AudioPlayer A1;
AudioPlayer A2;

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
 
  C1 = minim.loadFile( "C1.aif", 512);
  C2 = minim.loadFile( "C2.aif", 512);
  D1 = minim.loadFile( "D1.aif", 512);
  D2 = minim.loadFile( "D2.aif", 512);
  F1 = minim.loadFile( "F1.aif", 512);
  F2 = minim.loadFile( "F2.aif", 512);
  G1 = minim.loadFile( "G1.aif", 512);
  G2 = minim.loadFile( "G2.aif", 512);
  A1 = minim.loadFile( "A1.aif", 512);
  A2 = minim.loadFile( "A2.aif", 512);
 
}


void draw() {

  //background(200);
  cursors.clear();
  
  //println("start");
  //strokeWeight(3);
  
  
  leftX = 0;
  leftY = 0;
  rightX = 0;
  rightY = 0;
    
    
    
    for (Hand hand : leap.getHands()) {
     
        Finger index = hand.getIndexFinger();
    PVector pos = index.getPosition();
      if (hand.isRight()) {
      //println("right hand");
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
      //println("left hand:");
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
     //println("end");
     
     
     //for (int z = 0; z < blobs.length; z++){
   
  
     //blobs[0].show(leftX,leftY);
     //blobs[1].show(rightX,rightY);
     
     //}

     
    //loadPixels();

     
          for (Hand hand : leap.getHands ()) {
     PVector fingerIndex = hand.getIndexFinger().getRawPositionOfJointTip();
      println(fingerIndex.y);
      
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
      ellipse(rightX, rightY, fingerIndex.y, 40*2);
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
      ellipse(width/2, height/2, fingerIndex.y, 40*2);
     
       
     }
      
     
     //C1
          if (fingerIndex.y > 30 && fingerIndex.y < 77) {
   C1.play();
  } 
  
  
   if (fingerIndex.y < 30 || fingerIndex.y > 77) {
   C1.pause();
   C1.rewind();
  } 
  
  
  //D1
  if (fingerIndex.y > 78 && fingerIndex.y < 124) {
   D1.play();
  } 
  
   if (fingerIndex.y < 78 || fingerIndex.y > 124) {
   D1.pause();
   D1.rewind();
  } 
  
  //F1
  if (fingerIndex.y > 125 && fingerIndex.y < 171) {
   F1.play();
  } 
  
  if (fingerIndex.y < 125 || fingerIndex.y > 171) {
   F1.pause();
   F1.rewind();
  } 
  
  //G1
  if (fingerIndex.y > 172 && fingerIndex.y < 218) {
   G1.play();
  } 
  
  if (fingerIndex.y < 172 || fingerIndex.y > 218) {
   G1.pause();
   G1.rewind();
  } 
  
  //A1
  if (fingerIndex.y > 219 && fingerIndex.y < 265) {
   A1.play();
  } 
  
  if (fingerIndex.y < 219 || fingerIndex.y > 265) {
   A1.pause();
   A1.rewind();
  } 
  
  //C2
  if (fingerIndex.y > 266 && fingerIndex.y < 312) {
   C2.play();
  } 
  
  if (fingerIndex.y < 266 || fingerIndex.y > 312) {
   C2.pause();
   C2.rewind();
  } 
  
  //D2
  if (fingerIndex.y > 313 && fingerIndex.y < 359) {
   D2.play();
  } 
  
  if (fingerIndex.y < 313 || fingerIndex.y > 359) {
   D2.pause();
   D2.rewind();
  } 
  
  //F2
  if (fingerIndex.y > 360 && fingerIndex.y < 406) {
   F2.play();
  } 
  
  if (fingerIndex.y < 360 || fingerIndex.y > 406) {
   F2.pause();
   F2.rewind();
  } 
  
  //G2
  if (fingerIndex.y > 407 && fingerIndex.y < 453) {
   G2.play();
  } 
  
  if (fingerIndex.y < 407 || fingerIndex.y > 453) {
   G2.pause();
   G2.rewind();
  } 
  
  //A2
  if (fingerIndex.y > 454 && fingerIndex.y < 500) {
   A2.play();
  } 
  
  if (fingerIndex.y < 454 || fingerIndex.y > 500) {
   A2.pause();
   A2.rewind();
  } 
     }
     
    }
    
    