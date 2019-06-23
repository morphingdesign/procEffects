
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

Grid gridOne, gridTwo, gridThree;                    // Grid objects
FrameTab tabFrameOne, tabFrameTwo, tabFrameThree;    // Tabbed frame objects

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

void setup() {
   size(1000, 1000);
   frameRate(10);
   
   // *******************************************************
   // Grid objects
   // Parameters(xPos, yPos, Width, Height, Line Color, Grid Spacing)
   gridOne = new Grid(50, 150, 900, 200, whiteAlpha15, 10);
   gridTwo = new Grid(50, 400, 900, 200, whiteAlpha15, 10);
   gridThree = new Grid(50, 650, 900, 200, whiteAlpha15, 10);
   // *******************************************************
   // Tabbed frame objects
   // Parameters(xPos, yPos, Width, Height, Cut Size, Line Color, Line Weight, Fill Option, Fill Color)
   tabFrameOne = new FrameTab(440, 80, 60, 30, 10, whiteSolid, 1, true, blackSolid);
   tabFrameTwo = new FrameTab(440, 205, 60, 30, 10, whiteSolid, 1, true, blackSolid);
   tabFrameThree = new FrameTab(440, 330, 60, 30, 10, whiteSolid, 1, true, blackSolid);
   // *******************************************************
}

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

void draw() {
  background(blackSolid);
  pushMatrix();
      // *******************************************************
      // Grid objects
          translate(0, 0);
          gridOne.drawGrid();
          gridTwo.drawGrid();
          gridThree.drawGrid();
          // Parameters(Line Color)
          gridOne.drawFrame(whiteSolid);
          gridTwo.drawFrame(whiteSolid);
          gridThree.drawFrame(whiteSolid);
          // Parameters(Line Color, Stroke Weight, Line Length)
          gridOne.drawAllCorners(whiteSolid, 4, 30);
          gridTwo.drawAllCorners(whiteSolid, 4, 30);
          gridThree.drawAllCorners(whiteSolid, 4, 30);
      // *******************************************************
      // Tabbed frame object
      // No parameters
          tabFrameOne.drawFrame(); 
          tabFrameTwo.drawFrame();
          tabFrameThree.drawFrame();
      // *******************************************************
  popMatrix(); 
  
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
  //println(var);
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
