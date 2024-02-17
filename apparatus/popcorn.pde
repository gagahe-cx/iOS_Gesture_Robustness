import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;
PImage popcorn;
PImage bg;
ArrayList<Popcorn> popcorns = new ArrayList<Popcorn>();
boolean popping = false;
int startTime = 0;
boolean upsideDown = false;
boolean shake = false;
boolean showShakingText = false; // Control whether to display the "shaking" text

void setup() {
  size(1000, 500);
  frameRate(25);
  oscP5 = new OscP5(this, 9999);
  myRemoteLocation = new NetAddress("10.0.0.127", 9999);
  popcorn = loadImage("popcorn.png");
  bg = loadImage("background.png"); // Load the background image
  bg.resize(width, height); // Resize the background image to match the screen
}

void draw() {
  if (!shake) {
    // Set the background only when the phone is not shaking
    background(bg);
  }

  // Render UI and popcorn on the screen
  renderUI();
  renderPopcorn();

  if (popping) {
    if (millis() - startTime >= 1000) {
      popping = false;
      popcorns.clear();
    }
  }
}

void renderUI() {
  textSize(64);
  fill(0, 24, 41, 88);

  if (upsideDown) {
    text("phone upside down", 70, 300);
  } else if (shake) {
    if (showShakingText) {
      text("shaking", 70, 300);
    }

    // Start the popcorn effect when the shake event is triggered
    if (!popping) {
      startTime = millis();
      popping = true;
      for (int i = 0; i < 200; i++) {
        float x = width / 2;
        float y = height;
        float angle = random(TWO_PI); // Generate a random motion angle
        Popcorn p = new Popcorn(x, y, angle);
        popcorns.add(p);
      }
    }
  } 
}

void renderPopcorn() {
  for (int i = popcorns.size() - 1; i >= 0; i--) {
    Popcorn p = popcorns.get(i);
    p.display();
    p.move();
    if (p.y < -popcorn.height) {
      popcorns.remove(i);
    }
  }
}

class Popcorn {
  float x;
  float y;
  float speed;
  float angle;

  Popcorn(float x, float y, float angle) {
    this.x = width/2;
    this.y = y;
    this.speed = random(3, 10); // Randomly initialize speed
    this.angle = angle;
  }

  void display() {
    float imgWidth = 70;
    float imgHeight = 50;
    image(popcorn, x, y, imgWidth, imgHeight);
  }

  void move() {
    float vx = cos(angle) * speed;
    float vy = sin(angle) * speed;
    this.x += vx;
    this.y += vy;
    this.speed *= 1.05; // Gradually accelerate
  }
}

void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.checkAddrPattern("/gyrosc/HCI/accel")) {
    if (theOscMessage.checkTypetag("fff")) {
      float accX = theOscMessage.get(0).floatValue();
      float accY = theOscMessage.get(1).floatValue();
      float accZ = theOscMessage.get(2).floatValue();
      if (accX > 0.50 || accY > 0.35 || accZ > 0.35) {
        shake = true;
        showShakingText = true;
      } else {
        shake = false;
        showShakingText = false;
      }
    }
  } else if (theOscMessage.checkAddrPattern("/gyrosc/HCI/gyro")) {
    if (theOscMessage.checkTypetag("fff")) {
      float x = theOscMessage.get(0).floatValue();
      float y = theOscMessage.get(1).floatValue();
      float z = theOscMessage.get(2).floatValue();
      if (y >= 3.0 || y <= -3.0) {
        upsideDown = true;
      } else {
        upsideDown = false;
      }
    }
  } else if (theOscMessage.checkAddrPattern("/gyrosc/HCI/comp")) {
    if (theOscMessage.checkTypetag("f")) {
      float angle = theOscMessage.get(0).floatValue();
    }
  } else if (theOscMessage.checkAddrPattern("/gyrosc/HCI/rmatrix")) {
    if (theOscMessage.checkTypetag("fffffffff")) {
    }
  } else if (theOscMessage.checkAddrPattern("/gyrosc/HCI/button")) {
    if (theOscMessage.checkTypetag("ii")) {
      int button = theOscMessage.get(0).intValue();
    }
  }
}
