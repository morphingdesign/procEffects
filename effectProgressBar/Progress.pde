// Class for grid construction
class Progress {  
  
  // Class Variables 
  // No local class variables defined
  
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  // Used to construct progress bar
  Progress(){  
    
  }
 
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Methods
  
  // *******************************************************
  // Create series of rounded rectangles
  void drawBar(){
    pushMatrix();
    int count = 10;
    int spacing = 10;
    for(int i=0; i < count; i++){      
       roundRect(barLight, i * spacing);
    }
    popMatrix();
  }
  
  // *******************************************************
  // Create a single rounded rectangle
  void roundRect(color barColor, int xPos){
    noStroke();
    fill(barColor); 
    rectMode(CENTER);  
    rect(xPos, 0, 6, 20, 3);
  }
}  
