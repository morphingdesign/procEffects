
void setup() {
   size(1000, 1000);
   frameRate(10);
}


void draw() {
  background(151);
  
  background(256);
  
  noFill();
  stroke(0, 0, 0);
  smooth(4);
  
  //noLoop();
  
  int multiplier = 40;
  int numOfCurves = height / multiplier;
  int curveOffset = height / numOfCurves;
  
  drawCurveArray(numOfCurves, curveOffset, 200);
  drawCurveArray(numOfCurves, curveOffset, 150);
  drawCurveArray(numOfCurves, curveOffset, 100);
  drawCurveArray(numOfCurves, curveOffset, 50); 
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
  int scalar = 10;
  int arrayLength = width/scalar + scalar;
  int shift;
  
  noFill();
  stroke(0, 0, 0);
  noStroke();
  strokeWeight(0.3);
  
  float xList[] = new float[arrayLength];
  float yList[] = new float[arrayLength];
  
  for(int i=0; i < arrayLength; i++){
     shift = int(random(0, 2));
     xList[i] = scalar * i;
     yList[i] = scalar * (sin(i) + shift);
  }
  beginShape();
  //curveVertex(0, 0);
  //curveVertex(0, 0);
  curveVertex(xList[0], yList[0]);
  curveVertex(xList[0], yList[0]);
  
  for(int i=1; i < arrayLength; i++){
     curveVertex(xList[i], yList[i]);
     println(xList[i], yList[i]);
  }

  
  
  curveVertex(xList[xList.length-1], yList[yList.length-1]);
  println(xList[xList.length-1], yList[yList.length-1]);
  
  endShape();
  
  
  
  char[] alphabet = new char[26];
  for(int i = 0; i < 26; i++){
    alphabet[i] = (char)(65 + i);
  }
  
  char[] glyph = new char[95];
  for(int i = 0; i < 95; i++){
    glyph[i] = (char)(33 + i);
  }
  
  for(int i=0; i < arrayLength; i++){
     if(yList[i] > yList[0]){
       noStroke();
       fill(153, 0, 0);
       noFill();
       ellipse(xList[i], yList[i], 3, 3);
       
       textSize(10);
       textAlign(CENTER, CENTER);
       fill(153, 0, 0);
       
       fill(39, 255, 8, alpha);
       text(glyph[int(random(0, 95))], xList[i], yList[i]);
       
     }
  }
  
  
  
  
}
