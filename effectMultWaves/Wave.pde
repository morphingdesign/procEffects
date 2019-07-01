// Class for rectangular grid graphics construction
class Wave {  
  
  // Class Variables  
  int xPos;
  int yPos;
  int waveColor;
  int waveAlpha;
  int waveAlphaDelta;
  int waveOption;
  
  // Local Variables
  int numOfCurves = 1;
  int curveOffset = 1;
   
   // params: int x, int y, int lineColor, int lineAlpha, int option
   // first curve params(50, height/4, whiteSolid, 150, 1)
   
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  // Used to construct rectangular grid graphics
  Wave(int x, int y, int lineColor, int lineAlpha, int alphaDelta, int option){
      this.xPos = x;
      this.yPos = y;
      this.waveColor = lineColor;
      this.waveAlpha = lineAlpha;
      this.waveAlphaDelta = alphaDelta;
      this.waveOption = option; 
  }
 
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Methods
 
  void drawWave(){
      pushMatrix();
          translate(xPos, yPos);
          drawCurveArray(numOfCurves, curveOffset, waveAlpha);
          drawCurveArray(numOfCurves, curveOffset, waveAlpha - waveAlphaDelta);
      popMatrix();  
  }
 
 
  // *******************************************************
  // Wave array  
  void drawCurveArray(int numOfCurves, int offset, int alpha){
      for(int i=0; i < numOfCurves; i++){
          pushMatrix();
          translate(0, (i * offset));
          drawCurve(alpha);
          popMatrix();
      }
  }
  
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Options for curve types
  void drawCurve(int alpha){
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
      stroke(waveColor, alpha);
      strokeWeight(1);
      
      switch(waveOption){
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
  
}
