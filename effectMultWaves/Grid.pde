// Class for rectangular grid graphics construction
class Grid {  
  
  // Class Variables
  int xGridPos;
  int yGridPos;
  int wGridSize;
  int hGridSize;
  int gridColor;
  int gridSpace;  
   
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  // Used to construct rectangular grid graphics
  Grid(int x, int y, int w, int h, int gridLineColor, int gridSpacing){
      this.xGridPos = x;
      this.yGridPos = y;
      this.wGridSize = w;
      this.hGridSize = h;
      this.gridColor = gridLineColor;
      this.gridSpace = gridSpacing; 
  }
 
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Methods
 
  // *******************************************************
  // Rectangular grid
  void drawGrid(){
      pushMatrix();
          strokeWeight(1);
          stroke(gridColor);
          translate(xGridPos, yGridPos);     // X-value used to vary start position
          for(int i=0; i < hGridSize; i+=gridSpace){
             line(0, i, wGridSize, i);       // Horizontal Lines
          }                                  // Line spacing varies by passed through parameter
          for(int i=0; i < wGridSize; i+=gridSpace){
             line(i, 0, i, hGridSize);       // Vertical Lines
          }
      popMatrix();
  }
  
  // *******************************************************
  // Rectangle frame
  void drawFrame(color frameColor){
      pushMatrix();
          translate(xGridPos, yGridPos);
          noFill();
          stroke(frameColor);
          rect(0, 0, wGridSize, hGridSize);
      popMatrix();  
  }
  
  // *******************************************************
  // Draws 4 corners around rectangular grid
  void drawAllCorners(color lineColor, int lineWeight, int lineLength){
      accentCorner(xGridPos, yGridPos, 0, lineLength, lineWeight, lineColor);
      accentCorner(xGridPos, yGridPos + hGridSize, -HALF_PI, lineLength, lineWeight, lineColor);
      accentCorner(xGridPos + wGridSize, yGridPos, HALF_PI, lineLength, lineWeight, lineColor);
      accentCorner(xGridPos + wGridSize, yGridPos + hGridSize, PI, lineLength, lineWeight, lineColor);  
  }
  
  // *******************************************************
  // Creates a single iteration of a line with short perpendicular lines at both ends
  void accentCorner(int x, int y, float rotAngle, int lineLength, int lineWeight, color lineColor){
      pushMatrix();
          translate(x, y);
          rotate(rotAngle);
          strokeWeight(lineWeight);
          stroke(lineColor);
          line(0, 0, lineLength, 0);     
          line(0, 0, 0, lineLength);     
      popMatrix();
  }
  
}
