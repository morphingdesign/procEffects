// Class for tabbed frame graphics construction
class FrameTab {  
  
  // Class Variables
  int xFramePos;
  int yFramePos;
  int wFrameSize;
  int hFrameSize;
  int cutSize;
  boolean fillOption;
  color frameColor;
  int frameLineWeight;
  color shapeFillColor;
  PShape shape;
   
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  // Used to construct tabbed frame graphics
  FrameTab(int x, int y, int w, int h, int cut, color frameLineColor, int lineWeight, boolean fill, color fillColor){
      this.xFramePos = x;
      this.yFramePos = y;
      this.wFrameSize = w;
      this.hFrameSize = h;
      this.cutSize = cut;
      this.frameColor = frameLineColor;
      this.frameLineWeight = lineWeight;
      this.fillOption = fill;
      this.shapeFillColor = fillColor; 
  }
 
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Methods
 
  // *******************************************************
  // Draw frame shape
  void drawFrame(){
     strokeWeight(frameLineWeight);
     shape = createShape();  // Init shape object
     shape.beginShape();
     if(fillOption){
        shape.fill(shapeFillColor);
     }
     else{
        shape.noFill();
     }   
     shape.stroke(frameColor);
     shape.vertex(xFramePos, yFramePos);
     shape.vertex(xFramePos + wFrameSize - cutSize, yFramePos);
     shape.vertex(xFramePos + wFrameSize, yFramePos + cutSize);
     shape.vertex(xFramePos + wFrameSize, yFramePos + hFrameSize);
     shape.vertex(xFramePos + cutSize, yFramePos + hFrameSize);
     shape.vertex(xFramePos, yFramePos + hFrameSize - cutSize);     
     shape.endShape(CLOSE);
     
     // Position frame
     // shape function args are (shapeName, xPos, yPos)
     shape(shape, xFramePos, yFramePos);  
  }  
}
