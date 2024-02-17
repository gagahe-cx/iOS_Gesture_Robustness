float gyroscopeX, gyroscopeY, gyroscopeZ;
float lastX, lastY, lastZ; // Store the last accelerometer values
float shakeThreshold = 2.0;

void setup() {
   size(screenWidth, screenHeight, P3D);
}

void draw() {
   background(0,0,255);
   translate(width/2,height/2,0);
   translate(100*gyroscopeX,100*gyroscopeY,100*gyroscopeZ);
   box(30);
   if (isShakeDetected(gyroscopeX, gyroscopeY, gyroscopeZ)) {
     background(255,0,0); // Change background to red if shake is detected
 }
   
}

boolean isShakeDetected(float x, float y, float z) {
   float deltaX = abs(lastX - x);
   float deltaY = abs(lastY - y);
   float deltaZ = abs(lastZ - z);
   
   // Update last accelerometer values
   lastX = x;
   lastY = y;
   lastZ = z;
   
   // If any of the changes in acceleration are above the threshold, return true
   if (deltaX > shakeThreshold || deltaY > shakeThreshold || deltaZ > shakeThreshold) {
       return true;
   }
   return false;
}

//experimental feature
void gyroscopeUpdated(float x, float y, float z) {
   
}

//experimental feature
void accelerometerUpdated(float x, float y, float z) {
   gyroscopeX = x;
   gyroscopeY = y;
   gyroscopeZ = z;	   
}
