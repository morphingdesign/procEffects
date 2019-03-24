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
    folders = new Folder[iteration * iteration];
    col = 1;
    row = 1;
    for(int x=spacing; x < width; x+=spacing){
      for(int y=spacing; y < height; y+=spacing){
         folders[index] = new Folder(60, 40, 100, 100, x, y);
         index++;
         col++;
      }
      index = (iteration) * row;
      row++;   
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
