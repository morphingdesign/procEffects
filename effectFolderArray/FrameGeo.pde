// Class for folder construction
class FrameGeo {

  PShape frame1;
  
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  // 
  FrameGeo() {
     frame1 = createShape();
  }

  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Methods
  
  // *******************************************************
  // Position frame in canvas
  void posFrame(int x, int y){
     // shape function args are (shapeName, xPos, yPos)
     shape(frame1, x, y);
  }
  
  // *******************************************************
  // Structure frame
  void structureFrame(int frameW, int frameH, int cutSize){
     frame1.beginShape();
     frame1.noFill();
     frame1.stroke(whiteSolid);
     frame1.vertex(0, 0);
     frame1.vertex(frameW - cutSize, 0);
     frame1.vertex(frameW, cutSize);
     frame1.vertex(frameW, frameH);
     frame1.vertex(cutSize, frameH);
     frame1.vertex(0, frameH - cutSize);
     frame1.endShape(CLOSE);
  }
}
