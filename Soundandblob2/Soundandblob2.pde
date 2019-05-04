import codeanticode.syphon.*;
import de.voidplus.leapmotion.*;
import ddf.minim.*;
import ddf.minim.spi.*; // for AudioRecordingStream
import ddf.minim.ugens.*;



Blob[] blobs = new Blob[2];

LeapMotion leap;
Minim minim;
TickRate rateControl;
FilePlayer filePlayer;
FilePlayer filePlayer2;
AudioPlayer player; // My method of playing sound
AudioOutput out;
AudioOutput out2;

//String fileName = "panVocal.mp3";
//String fileName2 = "panned_vocal.mp3";
int t;
float radius1;
float radius2;
float rate;
float leftX = 0;
float leftY = 0;
float rightX = 0;
float rightY = 0;
float leftMidX = 0;
float leftMidY = 0;
float rightMidX = 0;
float rightMidY = 0;


ArrayList<PVector> cursors = new ArrayList<PVector>();

// My sounds
AudioSample C1;
AudioSample C2;
AudioSample D1;
AudioSample D2;
AudioSample F1;
AudioSample F2;
AudioSample G1;
AudioSample G2;
AudioSample A1;
AudioSample A2;

//AudioPlayer C1;
//AudioPlayer C2;
//AudioPlayer D1;
//AudioPlayer D2;
//AudioPlayer F1;
//AudioPlayer F2;
//AudioPlayer G1;
//AudioPlayer G2;
//AudioPlayer A1;
//AudioPlayer A2;

void setup(){
    //size(1000, 600, P3D);
 fullScreen(P3D);
  colorMode(HSB);

    
    minim = new Minim(this);
    //filePlayer = new FilePlayer( minim.loadFileStream(fileName) );

    //filePlayer.loop();

    //rateControl = new TickRate(1.f);
    //out = minim.getLineOut();
    //filePlayer.patch(rateControl).patch(out);
  
    
    leap = new LeapMotion(this);
    
    
    
    
  for (int i = 0; i < blobs.length; i++){
    blobs[i] = new Blob(); 
  }
 
 // Loading my sound files
  C1 = minim.loadSample( "C1.aif", 512);
  C2 = minim.loadSample( "C2.aif", 512);
  D1 = minim.loadSample( "D1.aif", 512);
  D2 = minim.loadSample( "D2.aif", 512);
  F1 = minim.loadSample( "F1.aif", 512);
  F2 = minim.loadSample( "F2.aif", 512);
  G1 = minim.loadSample( "G1.aif", 512);
  G2 = minim.loadSample( "G2.aif", 512);
  A1 = minim.loadSample( "A1.aif", 512);
  A2 = minim.loadSample( "A2.aif", 512);
  
  //C1 = minim.loadFile( "C1.aif", 512);
  //C2 = minim.loadFile( "C2.aif", 512);
  //D1 = minim.loadFile( "D1.aif", 512);
  //D2 = minim.loadFile( "D2.aif", 512);
  //F1 = minim.loadFile( "F1.aif", 512);
  //F2 = minim.loadFile( "F2.aif", 512);
  //G1 = minim.loadFile( "G1.aif", 512);
  //G2 = minim.loadFile( "G2.aif", 512);
  //A1 = minim.loadFile( "A1.aif", 512);
  //A2 = minim.loadFile( "A2.aif", 512);
 
}


//void keyPressed()
//{
//  if ( key == 'i' || key == 'I' )
//  {
//    // with interpolation on, it will sound as a record would when slowed down or sped up
//    rateControl.setInterpolation( true );
//  }
//}

//void keyReleased()
//{
//  if ( key == 'i' || key == 'I' )
//  {
//    // with interpolation off, the sound will become "crunchy" when playback is slowed down
//    rateControl.setInterpolation( false );
//  }
//}


void draw() {

  background(200);
  cursors.clear();
  
  println("start");
  //strokeWeight(3);
  

  leftX = 0;
  leftY = 0;
  rightX = 0;
  rightY = 0;
  leftMidX = 0;
  leftMidY = 0;
  rightMidX = 0;
  rightMidY = 0;


    
    for (Hand hand : leap.getHands()) {
       
     Finger index = hand.getIndexFinger();
     Finger  thumb        = hand.getThumb();
     Finger  middle       = hand.getMiddleFinger();
     Finger  pinky         = hand.getPinkyFinger();
     PVector thumbPos = thumb.getPosition();
     //PVector middlePos = middle.getPosition();
     PVector pinkyPos = pinky.getPosition();
     PVector pos = index.getPosition();
     
     //radius = dist(pinkyPos.x, pinkyPos.y,thumbPos.x, thumbPos.y )/2;
     
      if (hand.isRight()) {
      println("right hand");
     //stroke(255, 200, 200);
       noStroke();
      fill(255,100,200);
      leftX = pos.x;
      leftY = pos.y;
      leftMidX = (pinkyPos.x +  thumbPos.x)/2;
      leftMidY = (pinkyPos.y +  thumbPos.y)/2;
      
      PVector fingerIndex = hand.getIndexFinger().getRawPositionOfJointTip();
      println(fingerIndex.y);
      radius1 = fingerIndex.y;
      
      // Scale
      
       if (fingerIndex.y > 30 && fingerIndex.y < 77) {
   C1.trigger();
  } 
  
  if (fingerIndex.y > 78 && fingerIndex.y < 124) {
   D1.trigger();
  } 
  
  if (fingerIndex.y > 125 && fingerIndex.y < 171) {
   F1.trigger();
  } 
  
  if (fingerIndex.y > 172 && fingerIndex.y < 218) {
   G1.trigger();
  } 
  
  if (fingerIndex.y > 219 && fingerIndex.y < 265) {
   A1.trigger();
  } 
  
  if (fingerIndex.y > 266 && fingerIndex.y < 312) {
   C2.trigger();
  } 
  
  if (fingerIndex.y > 313 && fingerIndex.y < 359) {
   D2.trigger();
  } 
  
  if (fingerIndex.y > 360 && fingerIndex.y < 406) {
   F2.trigger();
  } 
  
  if (fingerIndex.y > 407 && fingerIndex.y < 453) {
   G2.trigger();
  } 
  
  if (fingerIndex.y > 454 && fingerIndex.y < 500) {
   A2.trigger();
  } 
    }
 
     else if (hand.isLeft()) {
      //stroke(200, 255, 200);
      noStroke();
      fill(255,200,100);
      println("left hand:");
      rightX = pos.x;
      rightY = pos.y;
      rightMidX = (pinkyPos.x +  thumbPos.x)/2;
      rightMidY = (pinkyPos.y +  thumbPos.y)/2;
      
      PVector fingerIndex = hand.getIndexFinger().getRawPositionOfJointTip();
      println(fingerIndex.y);
      radius2 = fingerIndex.y;
      
      
      // Scale
    
     if (fingerIndex.y > 30 && fingerIndex.y < 77) {
   C1.trigger();
  } 
  
  if (fingerIndex.y > 78 && fingerIndex.y < 124) {
   D1.trigger();
  } 
  
  if (fingerIndex.y > 125 && fingerIndex.y < 171) {
   F1.trigger();
  } 
  
  if (fingerIndex.y > 172 && fingerIndex.y < 218) {
   G1.trigger();
  } 
  
  if (fingerIndex.y > 219 && fingerIndex.y < 265) {
   A1.trigger();
  } 
  
  if (fingerIndex.y > 266 && fingerIndex.y < 312) {
   C2.trigger();
  } 
  
  if (fingerIndex.y > 313 && fingerIndex.y < 359) {
   D2.trigger();
  } 
  
  if (fingerIndex.y > 360 && fingerIndex.y < 406) {
   F2.trigger();
  } 
  
  if (fingerIndex.y > 407 && fingerIndex.y < 453) {
   G2.trigger();
  } 
  
  if (fingerIndex.y > 454 && fingerIndex.y < 500) {
   A2.trigger();
  } 
    
    
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
   
     //both hands detected
    
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
       
       sum += 500 * radius1/d ;
       }
       
      pixels[ind] = color(constrain(sum,155,220), random(100,150), 255); 
      
     }
    }
updatePixels();
 
     blobs[0].display();
     blobs[1].display();
     float distOfHands = dist(leftX, leftY, rightX, rightY);
     //rate = map(distOfHands, 0, 1000, 0.5f, 2.f);
     //  rateControl.value.setLastValue(rate);
     }

  //right hands detected
  
  else if ((leftX == 0) && (rightX != 0)){
    
     loadPixels();
     for (int i = 0; i < width; i++){
     for (int j = 0; j < height; j++){
       int ind = i + j * width;
       float sum = 0;
       float d = dist(i, j, rightX, rightY);
       sum += 500 * radius2/d;
      pixels[ind] = color(constrain(sum,155,220), random(100,150), 255); 
     }
    }
 updatePixels();
     noFill();
    noStroke();
      ellipse(rightX, rightY, radius2, radius2);
       //rate = 0.5;
       //  rateControl.value.setLastValue(rate);
     }

  //left hands detected
   else if ((leftX != 0) && (rightX == 0)){
    
     loadPixels();
     for (int i = 0; i < width; i++){
     for (int j = 0; j < height; j++){
       int ind = i + j * width;
       float sum = 0;
       float d = dist(i, j, leftX, leftY);
       sum += 500 * radius1/d;
       
      pixels[ind] = color(constrain(sum,155,220),random(100,150), 255); 
     }
    }
    
    
 updatePixels();
     noFill();
    noStroke();
      ellipse(leftX, leftY, 40*2, 40*2);
       //rate = 1.5;
       //  rateControl.value.setLastValue(rate);
     } 
     
     //no hands detected
     else if ((leftX == 0) && (rightX == 0)) {
        
        loadPixels();
     for (int i = 0; i < width; i++){
     for (int j = 0; j < height; j++){
       int ind = i + j * width;
       float sum = 0;
       float d = dist(i, j, width/2, height/2);
       sum += 500 * radius1/d;
      pixels[ind] = color(constrain(sum,155,220), random(100,150), 255); 
     }
     
      //rate = 1;
      //rateControl.value.setLastValue(rate);
    }
 
 updatePixels();
     noFill();
    noStroke();
      ellipse(width/2, height/2, radius1, radius1);
     
      //float rate = map(mouseX, 0, width, 0.0f, 3.f);
  

  
  //stroke( 255 );
  //// draw the waveforms
  //for( int i = 0; i < out.bufferSize() - 1; i++ )
  //{
  //  // find the x position of each buffer value
  //  float x1  =  map( i, 0, out.bufferSize(), 0, width );
  //  float x2  =  map( i+1, 0, out.bufferSize(), 0, width );
   
  //  // draw a line from one buffer position to the next for both channels
  //  line( x1, 200  - out.left.get(i)*50,  x2, 200  - out.left.get(i+1)*50);
  //  line( x1, 300 - out.right.get(i)*50, x2, 300 - out.right.get(i+1)*50);
  //  line( x1, 400  - out.left.get(i)*50,  x2, 400  - out.left.get(i+1)*50);
  //  line( x1, 500 - out.right.get(i)*50, x2, 500 - out.right.get(i+1)*50);
    
  //}  
       
     }
     
  } 

    
    