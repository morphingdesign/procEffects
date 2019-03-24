// Class for folder construction
class Folder {

  float rectRad = 5;
  float origXPos;
  float origYPos;
  float targetXPos, targetYPos;
  int folderW, folderH;
  int offset = 1;
  boolean selectFolder;
  boolean expand;
  boolean mouseOverOrig = false;
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
  
  void drawFolder(){
    expandOrig();
    
    pushMatrix();
    if(mouseOverOrig){
      moveOrig(); 
      //translate(targetXPos, targetYPos);
    }
    else{
      translate(origXPos, origYPos);
    }
    
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
  
  void expandF(boolean expand){
    this.expand = expand;
  }
  
  void expandOrig(){
    if(mouseX > origXPos - folderW / 2 && mouseX < origXPos + folderW / 2 && mouseY > origYPos - folderH / 2 && mouseY < origYPos + folderH / 2){
      if(mousePressed){
        mouseOverOrig = true;
        
      }  
    }
  }
  
  void moveOrig(){

    

     
    translate(moveXPos, moveYPos);
     
    println("Orig: " + moveXPos + ", " + moveYPos);
    
    
    if(moveXPos == targetXPos){
       moveXPos = targetXPos;
    }
    else{
       moveXPos++;
    }
    
    if(moveYPos == targetYPos){
       moveYPos = targetYPos;
    }
    else{
       moveYPos++;
    }    
    
    
    println("Target: " + targetXPos + ", " + targetYPos);


    
    

    
    
    
    //translate(targetXPos, targetYPos);
    //for(x=origXPos; x <= targetXPos; x++){
       //float xPos = map(x, 0, maxXPos, moveXPos, targetXPos);
       //float yPos = map(moveYPos, 0, 100, 0, height);
       //origXPos = xPos;
       //origYPos = 0;     
       //translate(x, 500);
       //println(x);
    //}
  }
}
