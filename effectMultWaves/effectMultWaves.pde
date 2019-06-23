
// Color scheme
color blackSolid = color(0);
color redSolid = color(255, 0, 0);
color greenSolid = color(0, 255, 0);
color whiteAlpha100 = color(255, 100);
color whiteAlpha50 = color(255, 50);
color whiteAlpha15 = color(255, 15);
color whiteAlpha5 = color(255, 5);
color whiteSolid = color(255);

int frameWidth = 900;      // Width of wave curve
int startXPos = 50;
int curveXOffset = 25;

int multiplier = 40;
int numOfCurves = 1;
int curveOffset = 1;

float curveH = 0;
int var = 0;
float shiftH = 0;

PShape tabFolder1, tabFolder2, tabFolder3;

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

void setup() {
   size(1000, 1000);
   frameRate(10);
   
   tabFolder1 = createShape();
   tabFolder2 = createShape();
   tabFolder3 = createShape();
   structureTab(tabFolder1, 60, 30, 10, whiteAlpha50, true);
   structureTab(tabFolder2, 60, 30, 10, whiteAlpha50, true);
   structureTab(tabFolder3, 60, 30, 10, whiteAlpha50, true);
}

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

void draw() {
  background(blackSolid);

  rectGrid(startXPos, 150, 900, 200, whiteAlpha15, 10);
  rectFrame(startXPos, 150, 900, 200, whiteAlpha50);
  rectGrid(startXPos, 400, 900, 200, whiteAlpha15, 10);
  rectFrame(startXPos, 400, 900, 200, whiteAlpha50);
  rectGrid(startXPos, 650, 900, 200, whiteAlpha15, 10);
  rectFrame(startXPos, 650, 900, 200, whiteAlpha50);
  
  accentCorner(startXPos, 400, 0, 30, whiteSolid);
  accentCorner(startXPos, 600, -HALF_PI, 30, whiteSolid);
  accentCorner(950, 400, HALF_PI, 30, whiteSolid);
  accentCorner(950, 600, PI, 30, whiteSolid);
  
  accentCorner(startXPos, 650, 0, 30, whiteSolid);
  accentCorner(startXPos, 850, -HALF_PI, 30, whiteSolid);
  accentCorner(950, 650, HALF_PI, 30, whiteSolid);
  accentCorner(950, 850, PI, 30, whiteSolid);
  
  accentCorner(startXPos, 150, 0, 30, whiteSolid);
  accentCorner(startXPos, 350, -HALF_PI, 30, whiteSolid);
  accentCorner(950, 150, HALF_PI, 30, whiteSolid);
  accentCorner(950, 350, PI, 30, whiteSolid);  
  
  posTab(tabFolder1, 880, 160);
  posTab(tabFolder2, 880, 410);
  posTab(tabFolder3, 880, 660);
  
  pushMatrix();
  translate(startXPos, height/4);
  drawCurveArray(numOfCurves, curveOffset, 150, 1);
  drawCurveArray(numOfCurves, curveOffset, 100, 1);
  popMatrix();  
  
  pushMatrix();
  translate(startXPos, height/2);
  drawCurveArray(numOfCurves, curveOffset, 200, 2);
  drawCurveArray(numOfCurves, curveOffset, 50, 2);
  popMatrix();
  
  pushMatrix();
  translate(startXPos, height - height/4);
  drawCurveArray(numOfCurves, curveOffset, 200, 3);
  drawCurveArray(numOfCurves, curveOffset, 50, 3);
  popMatrix();   

  pushMatrix();
  translate(0, 0);
  fill(whiteAlpha100);
  println(var);
  textSize(20);
  textAlign(CENTER, CENTER);
  text(var, 910, 173);
  text(int(random(85, 189)), 910, 423);
  text(int(random(124, 138)), 910, 673);
  popMatrix();   
}

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

void drawCurveArray(int numOfCurves, int offset, int alpha, int option){
  for(int i=0; i < numOfCurves; i++){
    pushMatrix();
    translate(0, (i * offset));
    drawCurve(alpha, option);
    popMatrix();
  }
}

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Options for curve types
void drawCurve(int alpha, int option){
  int scalar = 5;
  
  // Adding the scalar at the end projects the wave beyond the x-bound limit
  //int arrayLength = frameWidth/scalar + scalar;
  int arrayLength = frameWidth/scalar;
  
  float xList[] = new float[arrayLength];
  float yList[] = new float[arrayLength];
  int shift;
  float freq;
  float freqH;
  float var2 = 0;
  
  noFill();
  stroke(whiteSolid, alpha);
  strokeWeight(1);
  
  switch(option){
      case 1:
          for(int i=0; i < arrayLength; i++){             
             //freqH = 50;
             //freqH = random(-50, 50);
             
             if(second()%2 == 0){
                freqH = random(-25, 25);
             }
             else if(second()%5 == 0){
                freqH = -50;
             }
             else{
                freqH = random(-50, 50);
             }
             
             //curveH = random(0, 10);
             //curveH++;             
             
             if(curveH == 200){
                curveH = random(0, 10);
             }
             else{
                curveH+=.1;
             }
             
             xList[i] = scalar * i;
             var = int(random(62, 65));
             shiftH+=.3;
             
             // Eq. for ekg graph
             // Convert var variable to int from float, but leave float for var to output to text
             yList[i] = pow(sin(i + shiftH), var) * sin(i + curveH) * freqH;
             //yList[i] = pow(sin(i), 63) * sin(i + curveH) * freqH;
             // Source: https://mathoverflow.net/questions/119280/is-there-any-heartbeat-like-function
             // sin(x)^63 * sin(x+1.5)*8
          }     
          break;
      case 2:
          for(int i=0; i < arrayLength; i++){
             shift = int(random(0, 10));
             freq = (random(1, 1));
             var2++;
             
             xList[i] = scalar * i;
             
             // Eq. for typical sin curve 
             yList[i] = scalar * (sin(i * freq + var2) * shift);             
          }       
          break;
      case 3:
          for(int i=0; i < arrayLength; i++){
             float a = 0.2;
             float d = 1.4;
             float h = 3;
             float s = 0.05;
             float w = 0.02;
             float L;

             xList[i] = scalar * i;
             // Eq. for varying wave
             L = random(2 * d, 10 * d);
             yList[i] = a * (exp((-(pow((i + d), 2))) / (2 * w)) + exp(-(pow((i - d), 2)) / (2 * w))) + (h - abs(i / s) - i) * exp(-(pow((7 * i), 2)) / 2);
             yList[i] = i - ceil(i/L - 0.5) * L;
             
             // Source: https://www.reddit.com/r/Physics/comments/30royq/whats_the_equation_of_a_human_heart_beat/
             // egc(x) = a*(e^((-(x + d)^2) / (2*w)) + e^((-(x - d)^2) / (2*w))) + (h - abs(x / s) - x) e^((-(7*x)^2) / 2)
             // For: a = 0.2, d = 1.4, h = 3, s = 0.05, w = 0.02.
             // To make it periodic:
             // saw(x) = x - ceil(x/L - 0.5)*L
             // periodic_ecg(x) = ecg(saw(x))
             // With L >= 2d
          }       
          break;          
      default:
  }

  beginShape();
  curveVertex(0, 0);
  curveVertex(0, 0);
  curveVertex(xList[0], yList[0]);
  curveVertex(xList[0], yList[0]);
  for(int i=1; i < arrayLength; i++){
     curveVertex(xList[i], yList[i]);
  }
  curveVertex(xList[xList.length-1], yList[yList.length-1]);  
  endShape();
}

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Rectangle frame for each wave display
void rectFrame(int x, int y, int w, int h, int frameColor){
  pushMatrix();
  translate(x, y);
  noFill();
  stroke(frameColor);
  rect(0, 0, w, h);
  popMatrix();  
}

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// 
void rectGrid(int x, int y, int w, int h, int bkgdGridColor, int gridSpace){
    pushMatrix();
    strokeWeight(1);
    stroke(bkgdGridColor);
    translate(x, y);           // X-value used to vary start position
    for(int i=0; i < h; i+=gridSpace){
       line(0, i, w, i);       // Horizontal Lines
    }                              // Line spacing varies by passed through parameter
    for(int i=0; i < w; i+=gridSpace){
       line(i, 0, i, h);       // Vertical Lines
    }
    popMatrix();
}

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// 
void posTab(PShape shape, int x, int y){
   // shape function args are (shapeName, xPos, yPos)
   shape(shape, x, y);
}

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Structure tab
void structureTab(PShape shape, int frameW, int frameH, int cutSize, color strokeColor, boolean fillOpt){
   shape.beginShape();
   if(fillOpt){
      shape.fill(blackSolid);
   }
   else{
      shape.noFill();
   }   
   shape.stroke(strokeColor);
   shape.vertex(0, 0);
   shape.vertex(frameW - cutSize, 0);
   shape.vertex(frameW, cutSize);
   shape.vertex(frameW, frameH);
   shape.vertex(cutSize, frameH);
   shape.vertex(0, frameH - cutSize);
   shape.endShape(CLOSE);
}

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Creates a single iteration of a line with short perpendicular lines at both ends
void accentCorner(int x, int y, float rotAngle, int length, color lineColor){  // Length of long line defined by parameter
    pushMatrix();
    translate(x, y);
    rotate(rotAngle);
    strokeWeight(2);
    stroke(lineColor);
    line(0, 0, length, 0);     
    line(0, 0, 0, length);     
    popMatrix();
}
