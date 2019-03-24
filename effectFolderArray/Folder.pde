// Class for folder construction
class Folder {

  
  
  float rectRad = 5;
  float origXPos;
  float origYPos;
  float targetXPos, targetYPos;
  int folderW, folderH;
  int offset = 1;
  boolean selectFolder;
  boolean expand, collapse;
  boolean mouseOverOrig = false;
  boolean mouseOverTarget = false;
  int numOfFolders = 5;
  float moveXPos;
  float moveYPos;
      

  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  // 
  Folder(int folderW, int folderH, float origXPos, float origYPos, float targetXPos, float targetYPos) {
    this.folderW = folderW;
    this.folderH = folderH;
    this.targetXPos = targetXPos;
    this.targetYPos = targetYPos;
    this.origXPos = origXPos;
    this.origYPos = origYPos;
    moveXPos = origXPos;
    moveYPos = origYPos;
  }

  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Methods
  
  // *******************************************************
  // 
  
  void drawStart(){
    mouseOverOrigTest();
    
    pushMatrix();
    if(mouseOverOrig){
      moveOrig(); 
      mouseOverTargetTest();
    }
    else{
      translate(origXPos, origYPos);
    }
    
    if(expand && !collapse){
      for(int i=-2; i <= numOfFolders-2; i++){
         drawSingle(-i * 6, i * 6);
      }
    }
    else if(!expand && collapse){
      drawSingle(0, 0); 
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

  
  
  
  void mouseOverOrigTest(){
    if(mouseX > origXPos - folderW / 2 && mouseX < origXPos + folderW / 2 && mouseY > origYPos - folderH / 2 && mouseY < origYPos + folderH / 2){
      if(mousePressed){
        mouseOverOrig = true;
      }  
    }
  }
  
  void mouseOverTargetTest(){
    if(mouseX > targetXPos - folderW / 2 && mouseX < targetXPos + folderW / 2 && mouseY > targetYPos - folderH / 2 && mouseY < targetYPos + folderH / 2 && !expand){
        mouseOverTarget = true;
        selectFolder = true;
      if(mousePressed){
        if(!expand){
           expand = true;
        }
        else{
           collapse = true;
        }
      }
    }
    else{
       selectFolder = false;
    }
  }
  
  void moveOrig(){
    // Speed needs to be multiple of the array
    // The following have been confirmed: 1, 2, 5, 10
    float speed = 10;
    translate(moveXPos, moveYPos);
    //println("Orig: " + moveXPos + ", " + moveYPos);
    if(moveXPos == targetXPos){
       moveXPos = targetXPos;
    }
    else{
       moveXPos = moveXPos + speed;
    }
    if(moveYPos == targetYPos){
       moveYPos = targetYPos;
    }
    else{
       moveYPos = moveYPos + speed;
    }    
    //println("Target: " + targetXPos + ", " + targetYPos);
  }
}
