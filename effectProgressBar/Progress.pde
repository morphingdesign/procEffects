// Class for grid construction
class Progress {  
  
  // Class Variables 
  // No local class variables defined
  int x;
  
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  // Used to construct progress bar
  Progress(int x){
     this.x = x; 
  }
 
  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Methods

  
  // *******************************************************
  // Create a single rounded rectangle
  void roundRect(color barColor){
    noStroke();
    fill(barColor); 
    rectMode(CENTER);  
    rect(x, 0, 6, 20, 3);
  }
}  
