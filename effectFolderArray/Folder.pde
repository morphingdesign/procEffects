// Class for folder construction
class Folder {

  float rectRad = 5;
  int folderW, folderH;

  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  // 
  Folder(int w, int h) {
    folderW = w;
    folderH = h;
  }

  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Methods
  
  // *******************************************************
  // 
  void drawGeo(float x, float y){
    pushMatrix();
    translate(x, y);
    
    noStroke();
    rectMode(CENTER);
    fill(whiteSolid);
    rect(0, 0, folderW, folderH, 0, rectRad, rectRad, rectRad);
    rectMode(CORNER);
    // rect args: xOrigin, yOrigin, width, height, topLeftRad, topRightRad, botLeftRad, botRightRad
    rect(-folderW/2, -folderH/2-5, folderW/3, folderH/4, rectRad, rectRad, 0, 0);
    
    popMatrix();
  }
}
