// Class for folder construction
class Folder {

  float rectRad = 5;
  float targetXPos, targetYPos;
  int folderW, folderH;
  int offset = 1;
  boolean selectFolder;
  boolean expand;

  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  // 
  Folder(int folderW, int folderH, float targetXPos, float targetYPos) {
    this.folderW = folderW;
    this.folderH = folderH;
    this.targetXPos = targetXPos;
    this.targetYPos = targetYPos;
  }

  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Methods
  
  // *******************************************************
  // 
  
  void expandSingle(int numOfFolders){
    pushMatrix();
    translate(targetXPos, targetYPos);
    if(expand){
      for(int i=-2; i <= numOfFolders-2; i++){
         drawSingle(-i * 6, i * 6);
      }   
    }
    else{
      drawSingle(0, 0);  
    }
    
    
    popMatrix();
  }
  
  
  void drawSingle(int offsetPosX, int offsetPosY){
    
    pushMatrix();
    //translate(targetXPos, targetYPos);
    translate(offsetPosX, offsetPosY);
    noStroke();
    rectMode(CENTER);
    fill(whiteSolid);
    rect(0, 0, folderW, folderH, 0, rectRad, rectRad, rectRad);
    fill(blackSolid);
    rect(0, 0, folderW - offset * 2, folderH - offset * 2, 0, rectRad, rectRad, rectRad); 
    fill(whiteSolid);
    rectMode(CORNER);
    // rect args: xOrigin, yOrigin, width, height, topLeftRad, topRightRad, botLeftRad, botRightRad
    rect(-folderW/2, -folderH/2-7.5, folderW/3, folderH/5, rectRad, rectRad, 0, 0);
    if(selectFolder){
       fill(whiteSolid);
    }
    else{
       fill(blackSolid);
    }
    rect(-folderW/2 + offset, -folderH/2-7 + offset, folderW/3 - offset * 2, folderH/5 - offset, rectRad, rectRad, 0, 0);
    popMatrix();
  }

  
  
  void select(boolean selectFolder){
    this.selectFolder = selectFolder;
    
  }
  
  void expand(boolean expand){
    this.expand = expand;
  }
  
}
