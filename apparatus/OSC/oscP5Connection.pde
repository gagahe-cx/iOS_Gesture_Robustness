/**
 * it is recommended to take a look at oscP5plug for an alternative way to parse messages.
 * oscP5 website at http://www.sojamo.de/oscP5
 */

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;
float x, y, z;
boolean upsideDown = false;
boolean shake = false; 
float accX, accY, accZ;
float alt; 
float diff;
boolean altDifference = false;
int count;
int shakeCount = 0;



void setup() {
  size(800,600);
  frameRate(25);
  /* start oscP5, listening for incoming messages at port 12000 */
<<<<<<< HEAD
  //oscP5 = new OscP5(this,5000);
  //myRemoteLocation = new NetAddress("10.150.113.111", 5000);
  //oscP5 = new OscP5(this,12000);
  //myRemoteLocation = new NetAddress("172.16.14.87", 12000);
=======
  // oscP5 = new OscP5(this,6000);
  // myRemoteLocation = new NetAddress("10.150.113.111", 6000);
  oscP5 = new OscP5(this,12000);
  myRemoteLocation = new NetAddress("172.16.7.251", 12000);
>>>>>>> e6e5587231a49f846f7dbbf7854aaba292986084
  // println(myRemoteLocation);
  oscP5 = new OscP5(this, 5000);
  myRemoteLocation = new NetAddress("10.150.130.78", 5000);
  /* send an OSC message to this sketch manually */
  oscP5.send("/test",new Object[] {new Integer("1"), new Float(2.0),"test string."}, myRemoteLocation);
}

void draw() {
  // we could draw our UI here
  
  textSize(64);
  fill(0, 24, 41, 88);
  if (upsideDown){
    background(300, 221, 233);
    text("phone upside down", 70, 300);
    return;
  } if (shake){
    background(100, 70, 80);
    text("shaking", 70, 300);
    return;
  }
  background(210, 221, 233);
  text("Nothing is Detected", 70, 400); 

}

void oscEvent(OscMessage theOscMessage) {
  // addrPattern is the address from where we are receiving the oscP5 message, which in our case should start with "/gyrosc" since it is the app we're using to get phone data
  // typetag will pring the type of the message we are receiving. For instance "fff" means 3 floats; "if" means one integer and one float.
  // we can then parse these incoming messages according to their message types
  // println("### Osc message with address pattern "+ theOscMessage.addrPattern()+" typetag "+ theOscMessage.typetag());
  

  // Block of else if to receive data messages and store them locally
  if(theOscMessage.checkAddrPattern("/gyrosc/HCI/accel")==true) {
      // 3 floats
      if(theOscMessage.checkTypetag("fff")) {
        accX = theOscMessage.get(0).floatValue();  // get the first osc argument
        accY = theOscMessage.get(1).floatValue(); // get the second osc argument
        accZ = theOscMessage.get(2).floatValue(); // get the third osc argument
        //println("Acceleration: " + accX + ", " + accY + ", " + accZ);
      }
   } else if(theOscMessage.checkAddrPattern("/gyrosc/HCI/gyro")==true) {
      // 3 floats
     if(theOscMessage.checkTypetag("fff")) {
        x = theOscMessage.get(0).floatValue();  // get the first osc argument
        y = theOscMessage.get(1).floatValue(); // get the second osc argument
        z = theOscMessage.get(2).floatValue(); // get the third osc argument
        //println("Gyroscope: " + x + ", " + y + ", " + z);
        //if ((y>=3.0 || y<=-3.0)){
        //  upsideDown = true;
        //} else{ upsideDown=false;}
      }
   } else if (theOscMessage.checkAddrPattern("/gyrosc/HCI/comp")==true){
     if(theOscMessage.checkTypetag("f")) {
        float angle = theOscMessage.get(0).floatValue();
        println("Rotationº: " + angle);
     }
   } else if (theOscMessage.checkAddrPattern("/gyrosc/HCI/rmatrix")==true){
     if(theOscMessage.checkTypetag("fffffffff")) {
       println("Roation Matrix: TO COMPLETE");
     }
   } else if (theOscMessage.checkAddrPattern("/gyrosc/HCI/button")==true){
     if(theOscMessage.checkTypetag("ii")) {
       int button = theOscMessage.get(0).intValue();
       println("Button Number: " + button);
     } 
   } else if (theOscMessage.checkAddrPattern("/gyrosc/HCI/alt")==true){
       if(theOscMessage.checkTypetag("ff")) {
         float metersHigh = theOscMessage.get(0).floatValue();
         println("Meters high: " + metersHigh);
       }
   }  else if (theOscMessage.checkAddrPattern("/gyrosc/HCI/gps")==true){
       if(theOscMessage.checkTypetag("ffffff")) {
         diff = alt - theOscMessage.get(2).floatValue();
         alt = theOscMessage.get(2).floatValue();
         println("Altitude: " + alt);
         println("Difference: " + nf(diff,0,3));
     }
   }
   
   // Analyze phone status
<<<<<<< HEAD
   if (diff >= 0.003){altDifference= true;}
=======
   if (abs(diff) >= 0.003){altDifference= true;}
>>>>>>> e6e5587231a49f846f7dbbf7854aaba292986084
   if ((y>=3.0 || y<=-3.0) && altDifference){
        upsideDown = true;
        // altDifference= true;
   } else{ upsideDown=false; altDifference=false;}
   if (abs(accX) > 0.15 || abs(accY) > 0.15 || abs(accZ) > 0.15){
     count++;
     if (count>=10){
      shake= true;
      }
    } else{
      shake = false;
      count = 0;
    }
}
