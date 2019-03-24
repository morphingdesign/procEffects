// Class for folder construction
class FolderArray {

  // Confirmed with specific spacing intervals: 100, 200, 250, 500
  // Since it is divided by width, it requires certain intervals
  // to generate an appropriate matrix structure
  int spacing = 100;
  int iteration;
  int index = 0;
  int col, row;
  Folder[] folders;
  

      

  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Constructor
  // 
  FolderArray() {
  iteration = width / spacing - 1;
     //println("Iterations: " + iteration);
     folders = new Folder[iteration * iteration];
  
     col = 1;
     row = 1;
     
     //println("Folder Length: " + folders.length);
     
     for(int x=spacing; x < width; x+=spacing){
        //println("Pre index[" + index + "]");
        for(int y=spacing; y < height; y+=spacing){
           
  
           //println("index[" + index + "]: (" + x + ", " + y + ")");
  
           folders[index] = new Folder(60, 40, 100, 100, x, y);
           index++;
           col++;
        }
        
        index = (iteration) * row;
        row++;
        //println("Post index[" + index + "]");
        
     }

  }
  

  // %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  // Class Methods
  
  // *******************************************************
  // 
  
  void drawArray(){
     noFill();
     stroke(whiteSolid);
  
     
     for(int i=0; i < folders.length; i++){
  
        folders[i].drawStart();
  
     }
    
   
  }
  
}
