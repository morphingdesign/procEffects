
// Color scheme
color blackSolid = color(0);
color blackGrad0 = color(0, 0);
color blueGrad50 = color(0, 0, 255, 50);
color blueGrad10 = color(0, 0, 255, 10);
color blueSolid = color(0, 0, 255);
color blueSolid150 = color(0, 0, 150);
color redSolid = color(255, 0, 0);
color greenSolid = color(0, 255, 0);  
color whiteGrad50 = color(255, 50);
color whiteGrad15 = color(255, 15);
color whiteGrad5 = color(255, 5);
color whiteSolid = color(255);

void setup() {
   size(1000, 1000);
   frameRate(10);
}


void draw() {
  background(blackSolid);
  noFill();
  stroke(0, 0, 0);
  
  int multiplier = 40;
  int numOfCurves = 1;
  int curveOffset = 1;
  
  pushMatrix();
  translate(0, height/2);
  //drawCurveArray(numOfCurves, curveOffset, 200);
  //drawCurveArray(numOfCurves, curveOffset, 150);
  //drawCurveArray(numOfCurves, curveOffset, 100);
  drawCurveArray(numOfCurves, curveOffset, 50);
  popMatrix();
}

void drawCurveArray(int numOfCurves, int offset, int alpha){
  for(int i=0; i < numOfCurves; i++){
    pushMatrix();
    translate(0, (i * offset));
    drawCurve(alpha);
    popMatrix();
  }
  
}

void drawCurve(int alpha){
  int scalar = 5;
  int arrayLength = width/scalar + scalar;
  int shift;
  float freq;
  
  float freqH;
  float curveH;
  
  noFill();
  stroke(whiteSolid);
  strokeWeight(1);
  
  float xList[] = new float[arrayLength];
  float yList[] = new float[arrayLength];
  
  for(int i=0; i < arrayLength; i++){
     shift = int(random(0, 1));
     freq = (random(1, 1));
     //freqH = random(0, 0);
     if(second()%2 == 0){
        freqH = 50;
     }
     else{
        freqH = 0;
     }
     
     curveH = random(0, 50);
     xList[i] = scalar * i;
     
     // Eq. for typical sin curve 
     //yList[i] = scalar * (sin(i * freq) + shift);
     
     // Eq. for ekg graph
     //yList[i] = pow(sin(i), 63) * sin(i + curveH) * freqH;
     // Source: https://mathoverflow.net/questions/119280/is-there-any-heartbeat-like-function
     // sin(x)^63 * sin(x+1.5)*8
     
     float a = 0.2;
     float d = 1.4;
     float h = 3;
     float s = 0.05;
     float w = 0.02;
     
     yList[i] = a * (exp((-(pow((i + d), 2))) / (2 * w)) + exp(-(pow((i - d), 2)) / (2 * w))) + (h - abs(i / s) - i) * exp(-(pow((7 * i), 2)) / 2);
     
     // Source: https://www.reddit.com/r/Physics/comments/30royq/whats_the_equation_of_a_human_heart_beat/
     // egc(x) = a*(e^((-(x + d)^2) / (2*w)) + e^((-(x - d)^2) / (2*w))) + (h - abs(x / s) - x) e^((-(7*x)^2) / 2)
     // For: a = 0.2, d = 1.4, h = 3, s = 0.05, w = 0.02.
     // To make it periodic:
     // saw(x) = x - ceil(x/L - 0.5)*L
     // periodic_ecg(x) = ecg(saw(x))
     // With L >= 2d
     
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
