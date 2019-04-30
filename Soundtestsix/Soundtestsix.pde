import ddf.minim.*;
import de.voidplus.leapmotion.*;

Minim minim;
AudioPlayer player;
LeapMotion leap;

int position;

//AudioSample C1;
//AudioSample C2;
//AudioSample D1;
//AudioSample D2;
//AudioSample F1;
//AudioSample F2;
//AudioSample G1;
//AudioSample G2;
//AudioSample A1;
//AudioSample A2;

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

//+++

void setup(){
  
  size(1600, 1000, P3D);
  
  minim = new Minim(this);
  leap = new LeapMotion(this);
  
  //C1 = minim.loadSample( "C1.aif", 512);
  //C2 = minim.loadSample( "C2.aif", 512);
  //D1 = minim.loadSample( "D1.aif", 512);
  //D2 = minim.loadSample( "D2.aif", 512);
  //F1 = minim.loadSample( "F1.aif", 512);
  //F2 = minim.loadSample( "F2.aif", 512);
  //G1 = minim.loadSample( "G1.aif", 512);
  //G2 = minim.loadSample( "G2.aif", 512);
  //A1 = minim.loadSample( "A1.aif", 512);
  //A2 = minim.loadSample( "A2.aif", 512);
  
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

//+++

void leapOnInit() {
  // println("Leap Motion Init");
}
void leapOnConnect() {
  // println("Leap Motion Connect");
}
void leapOnFrame() {
  // println("Leap Motion Frame");
}
void leapOnDisconnect() {
  // println("Leap Motion Disconnect");
}
void leapOnExit() {
  // println("Leap Motion Exit");
}

//+++

void draw()
{
  background(255, 170, 240);
  
  
   // use the mix buffer to draw the waveforms.
  for (int i = 0; i < A1.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, A1.bufferSize(), 0, width);
    float x2 = map(i+1, 100, A1.bufferSize(), 100, width);
   
   //higher octave
   
    //stroke(168, 196, 237);
    stroke(255);
    line(x1, -90 - A2.mix.get(i)*50, x2, 1000 - A2.mix.get(i+1)*50);
    
    //stroke(160, 195, 247);
    stroke(255);
    line(x1, -50 - G2.mix.get(i)*50, x2, 1000 - G2.mix.get(i+1)*50);
    
    //stroke(164, 164, 232);
    stroke(255);
    line(x1, -50 - F2.mix.get(i)*50, x2, 1000 - F2.mix.get(i+1)*50);
    
    //stroke(189, 158, 226);
    stroke(255);
    line(x1, -50 - D2.mix.get(i)*50, x2, 1000 - D2.mix.get(i+1)*50);
    
    //stroke(182, 137, 198);
    stroke(255);
    line(x1, -50 - C2.mix.get(i)*50, x2, 1000 - C2.mix.get(i+1)*50);
    
    // lower octave
    
    //stroke(182, 137, 198);
    stroke(151, 192, 252);
    line(x1, -50 - A1.mix.get(i)*50, x2, 1000 - A1.mix.get(i+1)*50);
    
    //stroke(165, 114, 168);
    stroke(151, 192, 252);
    line(x1, -50 - G1.mix.get(i)*50, x2, 1000 - G1.mix.get(i+1)*50);
    
    //stroke(127, 85, 130);
    stroke(151, 192, 252);
    line(x1, -50 - F1.mix.get(i)*50, x2, 1000 - F1.mix.get(i+1)*50);
    
    //stroke(101, 65, 104);
    stroke(151, 192, 252);
    line(x1, -50 - D1.mix.get(i)*50, x2, 1000 - D1.mix.get(i+1)*50);
    
    //stroke(83, 51, 84);
    stroke(88, 138, 211);
    line(x1, -50 - C1.mix.get(i)*50, x2, 1000 - C1.mix.get(i+1)*50);
  }
  
  
  int fps = leap.getFrameRate();
  
  for (Hand hand : leap.getHands ()) {

    
    // Hand

    int     handId             = hand.getId();
    PVector handPosition       = hand.getPosition();
    PVector handStabilized     = hand.getStabilizedPosition();
    PVector handDirection      = hand.getDirection();
    PVector handDynamics       = hand.getDynamics();
    float   handRoll           = hand.getRoll();
    float   handPitch          = hand.getPitch();
    float   handYaw            = hand.getYaw();
    boolean handIsLeft         = hand.isLeft();
    boolean handIsRight        = hand.isRight();
    float   handGrab           = hand.getGrabStrength();
    float   handPinch          = hand.getPinchStrength();
    float   handTime           = hand.getTimeVisible();
    PVector spherePosition     = hand.getSpherePosition();
    float   sphereRadius       = hand.getSphereRadius();
    
    //hand.draw();
    
    
     // Arm

    if (hand.hasArm()) {
      Arm     arm              = hand.getArm();
      float   armWidth         = arm.getWidth();
      PVector armWristPos      = arm.getWristPosition();
      PVector armElbowPos      = arm.getElbowPosition();
    }
    
    PVector fingerIndex = hand.getIndexFinger().getRawPositionOfJointTip();
    PVector fingerThumb = hand.getThumb().getRawPositionOfJointTip();
    PVector fingerMiddle = hand.getMiddleFinger().getRawPositionOfJointTip();
    PVector fingerRing = hand.getRingFinger().getRawPositionOfJointTip();
    PVector fingerPinky = hand.getPinkyFinger().getRawPositionOfJointTip();
    
    
     // Fingers (I switched the syntax from trigger to play to fix the issue of the audio continuously playing)
     
    println(fingerIndex.y);
    
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
     
    for (Finger finger : hand.getFingers()) {
      
       int     fingerId         = finger.getId();
      PVector fingerPosition   = finger.getPosition();
      PVector fingerStabilized = finger.getStabilizedPosition();
      PVector fingerVelocity   = finger.getVelocity();
      PVector fingerDirection  = finger.getDirection();
      float   fingerTime       = finger.getTimeVisible();
      
      //if fingerIndex.y 
      
      switch(finger.getType()) {
      case 0:
        // System.out.println("thumb");
        break;
      case 1:
        // System.out.println("index");
        break;
      case 2:
        // System.out.println("middle");
        break;
      case 3:
        // System.out.println("ring");
        break;
      case 4:
        // System.out.println("pinky");
        break;
      }
      
      
        // Bones
      
      Bone    boneDistal       = finger.getDistalBone();

      Bone    boneIntermediate = finger.getIntermediateBone();

      Bone    boneProximal     = finger.getProximalBone();

      Bone    boneMetacarpal   = finger.getMetacarpalBone();
      
      
        // Touch emulation

      int     touchZone        = finger.getTouchZone();
      float   touchDistance    = finger.getTouchDistance();
      
       switch(touchZone) {
      case -1: // None
        break;
      case 0: // Hovering
        // println("Hovering (#" + fingerId + "): " + touchDistance);
        break;
      case 1: // Touching
        // println("Touching (#" + fingerId + ")");
        break;
      }
    }
    
    
       // Tools
       
  for (Tool tool : hand.getTools()) {
      int     toolId           = tool.getId();
      PVector toolPosition     = tool.getPosition();
      PVector toolStabilized   = tool.getStabilizedPosition();
      PVector toolVelocity     = tool.getVelocity();
      PVector toolDirection    = tool.getDirection();
      float   toolTime         = tool.getTimeVisible();

      int     touchZone        = tool.getTouchZone();
      float   touchDistance    = tool.getTouchDistance();

      switch(touchZone) {
      case -1: // None
        break;
      case 0: // Hovering
        // println("Hovering (#" + toolId + "): " + touchDistance);
        break;
      case 1: // Touching
        // println("Touching (#" + toolId + ")");
        break;
      }
    }
  }
  
  // Devices

  for (Device device : leap.getDevices()) {
    float deviceHorizontalViewAngle = device.getHorizontalViewAngle();
    float deviceVericalViewAngle = device.getVerticalViewAngle();
    float deviceRange = device.getRange();
  }
  
}


//void keyPressed()
//{
//  if ( key == 'd' ) Test1.trigger();
//  if ( key == 'd' )rect(30, 20, 55, 55);
  
//}