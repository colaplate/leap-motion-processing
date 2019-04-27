
import ddf.minim.*;
import processing.sound.*;
  
Blob b;
SCScore score = new SCScore();
float[] r = new float[4];
float gain;
LeapMotion leap;
Minim minim;
int t;

float leftX = 0;
float leftY = 0;
float rightX = 0;
float rightY = 0;

ArrayList<PVector> cursors = new ArrayList<PVector>();


AudioPlayer f0;
AudioPlayer f1;
AudioPlayer f2;
//AudioPlayer f3;
//AudioPlayer f4;
//AudioPlayer f5;
//AudioPlayer a1;
//AudioPlayer a2;
//AudioPlayer a1;
//AudioPlayer a2;



//String fileName;

void setup() {
  size(1000, 600, P3D);
  //fullScreen()
  b = new Blob(100,100);
  leap = new LeapMotion(this);
  minim = new Minim(this);

  //file = minim.loadFile( fileName, 512);
  //a1 = minim.loadFile( "beat2.mp3", 512);
  //a2 = minim.loadFile( "beat3.mp3", 512);
  f0 = minim.loadFile( "beat3.mp3");
  f1 = minim.loadFile( "f1.mp3");
  f2 = minim.loadFile( "f2.mp3");
  //f3 = minim.loadFile( "f3.mp3", 512);
  //f4 = minim.loadFile( "f4.mp3", 512);
  //f5 = minim.loadFile( "f5.mp3", 512);
  
  
}
 

void draw() {
  background(50);
  
  cursors.clear();

  // handle buttons
 
  loadPixels();
  //for (int i = 0; i < width; i++){
  //   for (int j = 0; j < width; j++){
  //     int index = i + j * width;
  //     float d = dist(i, j, width/2, height/2);
  //     pixels[index] = color(d); 
       
  //   }
  //}
  //updatePixels();
 
  //b.show();
 
println("start");
  strokeWeight(3);
  noFill();
  
  leftX = 0;
  leftY = 0;
  rightX = 0;
  rightY = 0;
    
  
  
    
  for (Hand hand : leap.getHands()) {
  loadPixels();
  

    
    //PVector spherepos = hand.getSpherePosition();
    Finger index = hand.getIndexFinger();
    PVector pos = index.getPosition();
    if (hand.isRight()) {
      println("right hand");
      stroke(255, 200, 200);
      leftX = pos.x;
      leftY = pos.y;
      
    }
 
     else if (hand.isLeft()) {
      stroke(200, 255, 200);
      println("left hand:");
      rightX = pos.x;
      rightY = pos.y;
      
      
       int numOut = hand.getOutstretchedFingers().size();
   // println(numOut);
    if(numOut == t ) {
      //return;
    }
    else{
      t = numOut;
    
    
      //println(t);
      //println(pos.x);
     // println(hand.getId());
     // println(hand.isLeft());
     
     if(t == 0){
       if ( f1.isPlaying() ) {
       f1.pause(); 
       }else if ( f2.isPlaying() ) {
       f2.pause();
       //}else if ( f3.isPlaying() ) {
       //f3.pause();
       //}else if ( f4.isPlaying() ) {
       //f4.pause();
       //}else if ( f5.isPlaying() ) {
       //f5.pause();
       }
       
       f1.loop();
       //println("no finger");
     } 
     
     else if(t == 1 ){
     if ( f0.isPlaying() ) {
       f0.pause(); 
       }else if ( f2.isPlaying() ) {
       f2.pause();
       //}else if ( f3.isPlaying() ) {
       //f3.pause();
       //}else if ( f4.isPlaying() ) {
       //f4.pause();
       //}else if ( f5.isPlaying() ) {
       //f5.pause();
       }
       gain = f1.getGain();
       f1.loop();
       println(gain);
       //println("one finger");
  }
  
     else if(t == 2 ){
       if ( f1.isPlaying() ) {
       f1.pause(); 
       }else if ( f0.isPlaying() ) {
       f0.pause();
       //}else if ( f3.isPlaying() ) {
       //f3.pause();
       //}else if ( f4.isPlaying() ) {
       //f4.pause();
       //}else if ( f5.isPlaying() ) {
       //f5.pause();
       }
       f2.setGain(gain);
       f2.loop();
       //println("two finger");
       
  }
  
    }
 
    }
    else {
      stroke(255);
      
      
     }
     println("draw");
     
    ellipse(pos.x, pos.y, 30, 30);  
    cursors.add(pos);
    
  
    
       
    //println("pitch ", hand.getPitch(), " roll ", hand.getRoll(), " yaw ", hand.getYaw());
  }
  println("end");
  
  

  
  println("leftX: " + leftX);
  println("leftY: " +leftY);
  println("rightX: " +rightX);
  println("rightY: " +rightY);

  
  if((leftX!= 0) && (rightX != 0)){
     //if ( f1.isPlaying() ) {
     //  f1.pause(); 
     //  }else if ( f0.isPlaying() ) {
     //  f0.pause();
     //  }else if( f2.isPlaying() ) {
     //  f2.pause();
     //  }
       
  stroke(255);
  line(leftX, leftY, rightX, rightY);
  float distOfHands = dist(leftX, leftY, rightX, rightY);
  gain = map(distOfHands, 0, 700, 0, 2);
  println("dist: " + distOfHands);
  //println("gain: " + gain);
  
 
  
  }else{
  
  }
  
   
 //loadPixels();
 // for (int i = 0; i < width; i++){
 //    for (int j = 0; j < width; j++){
 //      int index = i + j * width;
 //      float d = dist(i, j, width/2, height/2);
 //      pixels[index] = color(d); 
 //    }
 // }
 // updatePixels();
 
 // b.show();
  
  
  

  fill(255);
  textSize(20);
  textAlign(CENTER);
  text("test",width/2,50);
  rect(r[0], r[1], r[2], r[3]);

}
