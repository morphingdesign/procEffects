color gridColor = color(255, 0, 0, 100);

void setup() {
   size(400, 400);
   
}

void draw() {
  background(0);
  rectGrid(0, 0, 20, gridColor);
  
  pushMatrix();
  translate(width/2, height/2);

  

  radarScanArc(height);
  
  radialGrid(height/4, -3, 10, 1, 1, 150 ,true);
  radialGrid(height/2, 5, 20, 1, 1, 100, true);
  radialGrid(int(height * 0.75), 10, 10, 2, 1, 150, true);
  radialGrid(height, 5, 2, 1, 1, 200, true);
  radialGrid(height, 0, 45, 1, 1, 100, false);
  radialGrid(height, 0, 90, 2, 2, 255, false);
  
  tangoPts(height/2 - height/4);
  
  popMatrix();
}


void radarScanArc(int diameter){
  float rSpeed = 2;
  color scanColorLight = color(255, 0, 0, 10);
  color scanColorDark = color(255, 0, 0, 100);
  int angle = 45;
  pushMatrix();
  float rotateSpeed = map(second(), 0, 59, 0, TWO_PI) * rSpeed;
  rotate(rotateSpeed);                       // Dynamic rotation initiated
  for(float i = 0; i < angle; i+=0.25){
    float gradRange = map(i, 0, angle, 0.0, 1.0);
    color gradient = lerpColor(scanColorLight, scanColorDark, gradRange);
    stroke(gradient);
    rotate(radians(i));
    line(0, 0, diameter/2, 0);
    rotate(radians(-i));
  }
  popMatrix();
}


void radialGrid(int diameter, int projection, int interval, int ringWeight, int tickWeight, int colorAlpha, boolean ticks){
  int lineLength;
  color radarColor = color(255, 0, 0, colorAlpha);
  pushMatrix();
  noFill();
  strokeWeight(ringWeight);
  stroke(radarColor);
  ellipseMode(RADIUS);
  ellipse(0, 0, diameter/2, diameter/2);
  if(ticks){
     lineLength = diameter/2 - projection;
  }
  else{
     lineLength = 0;
  }
  for(int i = 0; i < 360; i+=interval){
    stroke(radarColor);
    strokeWeight(tickWeight);
    rotate(radians(i));
    line(lineLength, 0, diameter/2, 0);
    rotate(radians(-i));
  }
  popMatrix();
}

void rectGrid(int bkgdGridXOrigin, int bkgdGridYOrigin, int spacing, color bkgdGridColor){
  pushMatrix();
  strokeWeight(1);
  stroke(bkgdGridColor);
  translate(bkgdGridXOrigin, bkgdGridYOrigin);
  // Horizontal Lines
  for(int i=0; i < height; i+=spacing){
     line(0, i, width, i);
  }
  // Vertical Lines
  for(int i=0; i < width; i+=spacing){
     line(i, 0, i, height);
  }
  popMatrix();
}

void tangoPts(int diameter){
  pushMatrix();
  float ptXPos, ptYPos, ptRad;
  int numOfTangoes = 10;
  //int alpha = 150;
  
  randomSeed(0);
  ptRad = 2;
  int alpha = int(map(second(), 0, 10, 150, 255));
  for(int i=0; i < numOfTangoes; i++){
     ptXPos = random(-diameter, diameter);
     ptYPos = random(-diameter, diameter);
     
     color tangoColor = color(255, 0, 0, alpha);
     stroke(tangoColor);
     strokeWeight(2);
     ellipse(ptXPos, ptYPos, ptRad, ptRad);
  }
  popMatrix();
}
