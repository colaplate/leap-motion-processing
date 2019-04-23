/**
  * This sketch demonstrates how to create synthesized sound with Minim 
  * using an AudioOutput and an Oscil. An Oscil is a UGen object, 
  * one of many different types included with Minim. By using 
  * the numbers 1 thru 5, you can change the waveform being used
  * by the Oscil to make sound. These basic waveforms are the 
  * basis of much audio synthesis. 
  * 
  * For many more examples of UGens included with Minim, 
  * have a look in the Synthesis folder of the Minim examples.
  * <p>
  * For more information about Minim and additional features, 
  * visit http://code.compartmental.net/minim/
  */

//import ddf.minim.*;
//import ddf.minim.ugens.*;
import de.voidplus.leapmotion.*;
import arb.soundcipher.*;

//Minim      minim;
//AudioOutput out;
//Oscil       wave;
LeapMotion leap;
SoundCipher sc;

int notes;

void setup()
{
  size(800, 600, P3D);
  
  leap = new LeapMotion(this);
  //sc = new SoundCipher(this);
  
  
  //minim = new Minim(this);
  
  //// use the getLineOut method of the Minim object to get an AudioOutput object
  //out = minim.getLineOut();
  
  //// create a sine wave Oscil, set to 440 Hz, at 0.5 amplitude
  //wave = new Oscil( 440, 0.5f, Waves.SINE );
  //// patch the Oscil to the output
  //wave.patch( out );
}

// ======================================================
// 1. Callbacks

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



void draw()
{
  background(200);
  stroke(255);
  strokeWeight(1);
  //sc = new SoundCipher(this);
  //sc.playNote(notes, 200, 1.0); //!!!????
  
  //int fps = leap.getFrameRate();
 
  //// draw the waveform of the output
  //for(int i = 0; i < out.bufferSize() - 1; i++)
  //{
  //  line( i, 50  - out.left.get(i)*50,  i+1, 50  - out.left.get(i+1)*50 );
  //  line( i, 150 - out.right.get(i)*50, i+1, 150 - out.right.get(i+1)*50 );
  //}

  //// draw the waveform we are using in the oscillator
  //stroke(0);
  //strokeWeight(4);
  //for( int i = 0; i < width-1; ++i )
  //{
  //  point( i, height/2 - (height*0.49) * wave.getWaveform().value( (float)i / width ) );
  //}
  
  
  
  
  for (Hand hand : leap.getHands ()) {


    // ==================================================
    // 2. Hand

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

    // --------------------------------------------------
    // Drawing
    //hand.draw();


    // ==================================================
    // 3. Arm

    if (hand.hasArm()) {
      Arm     arm              = hand.getArm();
      float   armWidth         = arm.getWidth();
      PVector armWristPos      = arm.getWristPosition();
      PVector armElbowPos      = arm.getElbowPosition();
    }


    //// ==================================================
    //// 4. Finger

    //Finger  fingerThumb        = hand.getThumb();
    //// or                        hand.getFinger("thumb");
    //// or                        hand.getFinger(0);

    //Finger  fingerIndex        = hand.getIndexFinger();
    //// or                        hand.getFinger("index");
    //// or                        hand.getFinger(1);

    //Finger  fingerMiddle       = hand.getMiddleFinger();
    //// or                        hand.getFinger("middle");
    //// or                        hand.getFinger(2);

    //Finger  fingerRing         = hand.getRingFinger();
    //// or                        hand.getFinger("ring");
    //// or                        hand.getFinger(3);

    //Finger  fingerPink         = hand.getPinkyFinger();
    //// or                        hand.getFinger("pinky");
    //// or                        hand.getFinger(4);

   PVector fingerIndex = hand.getIndexFinger().getRawPositionOfJointTip();
    PVector fingerThumb = hand.getThumb().getRawPositionOfJointTip();
    PVector fingerMiddle = hand.getMiddleFinger().getRawPositionOfJointTip();
    PVector fingerRing = hand.getRingFinger().getRawPositionOfJointTip();
    PVector fingerPinky = hand.getPinkyFinger().getRawPositionOfJointTip();
    
    

 //float amp = map( fingerIndex.y, 0, height, 1, 0 );
  //wave.setAmplitude( amp );
  
  //float freq = map( fingerIndex.x, 0, width, 110, 880 );
  //wave.setFrequency( freq );
    float indexPos = (fingerIndex.x + 200)  * 2;
    sc = new SoundCipher(this);
  sc.playNote(notes, 200, 1.0); //!!!????
  if((0< indexPos ) && (indexPos< 100)){
  rect(0, 0, 100, 600);
  notes = 30;
}
else if((100 < indexPos ) && (indexPos< 200)){
  notes = 40;
  rect(100,0, 100, 600);
}

else if((200< indexPos) && (indexPos< 300)){
  notes = 50;
   rect(200,0, 100, 600);
}

else if((300< indexPos) && (indexPos< 400)){
  notes = 60;
   rect(300,0, 100, 600);
}
else if((400< indexPos) && (indexPos< 500)){
  notes = 70;
   rect(400,0, 100, 600);
}

else if((500< indexPos) && (indexPos< 600)){
  notes = 80;
   rect(500,0, 100, 600);
}

else if((600< indexPos) && (indexPos< 700)){
  notes = 90;
   rect(600,0, 100, 600);
}

else if((700<indexPos) && (indexPos< 800)){
  notes = 100;
   rect(700,0, 100, 600);
}

print(indexPos);



    for (Finger finger : hand.getFingers()) {
      // or              hand.getOutstretchedFingers();
      // or              hand.getOutstretchedFingersByAngle();

      int     fingerId         = finger.getId();
      PVector fingerPosition   = finger.getPosition();
      PVector fingerStabilized = finger.getStabilizedPosition();
      PVector fingerVelocity   = finger.getVelocity();
      PVector fingerDirection  = finger.getDirection();
      float   fingerTime       = finger.getTimeVisible();
    




      // ------------------------------------------------
      // Drawing

      // Drawing:
      // finger.draw();  // Executes drawBones() and drawJoints()
      // finger.drawBones();
      // finger.drawJoints();

      // ------------------------------------------------
      // Selection

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


      // ================================================
      // 5. Bones
      // --------
      // https://developer.leapmotion.com/documentation/java/devguide/Leap_Overview.html#Layer_1

      Bone    boneDistal       = finger.getDistalBone();
      // or                      finger.get("distal");
      // or                      finger.getBone(0);

      Bone    boneIntermediate = finger.getIntermediateBone();
      // or                      finger.get("intermediate");
      // or                      finger.getBone(1);

      Bone    boneProximal     = finger.getProximalBone();
      // or                      finger.get("proximal");
      // or                      finger.getBone(2);

      Bone    boneMetacarpal   = finger.getMetacarpalBone();
      // or                      finger.get("metacarpal");
      // or                      finger.getBone(3);

      // ------------------------------------------------
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
    
    
    


    // ==================================================
    // 6. Tools

    for (Tool tool : hand.getTools()) {
      int     toolId           = tool.getId();
      PVector toolPosition     = tool.getPosition();
      PVector toolStabilized   = tool.getStabilizedPosition();
      PVector toolVelocity     = tool.getVelocity();
      PVector toolDirection    = tool.getDirection();
      float   toolTime         = tool.getTimeVisible();

      // ------------------------------------------------
      // Drawing:
      // tool.draw();

      // ------------------------------------------------
      // Touch emulation

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


  // ====================================================
  // 7. Devices

  for (Device device : leap.getDevices()) {
    float deviceHorizontalViewAngle = device.getHorizontalViewAngle();
    float deviceVericalViewAngle = device.getVerticalViewAngle();
    float deviceRange = device.getRange();
  }
}
  
 
//void mouseMoved()
//{
//  // usually when setting the amplitude and frequency of an Oscil
//  // you will want to patch something to the amplitude and frequency inputs
//  // but this is a quick and easy way to turn the screen into
//  // an x-y control for them.
  
//  float amp = map( mouseY, 0, height, 1, 0 );
//  wave.setAmplitude( amp );
  
//  float freq = map( mouseX, 0, width, 110, 880 );
//  wave.setFrequency( freq );
//}






//void keyPressed()
//{ 
//  switch( key )
//  {
//    case '1': 
//      wave.setWaveform( Waves.SINE );
//      break;
     
//    case '2':
//      wave.setWaveform( Waves.TRIANGLE );
//      break;
     
//    case '3':
//      wave.setWaveform( Waves.SAW );
//      break;
    
//    case '4':
//      wave.setWaveform( Waves.SQUARE );
//      break;
      
//    case '5':
//      wave.setWaveform( Waves.QUARTERPULSE );
//      break;
     
//    default: break; 
//  }
//}
