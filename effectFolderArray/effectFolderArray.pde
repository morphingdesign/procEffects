
// Color scheme
color blackSolid = color(0);
color blackGrad0 = color(0, 0);
color blueGrad50 = color(0, 0, 255, 50);
color blueGrad10 = color(0, 0, 255, 10);
color blueSolid = color(0, 0, 255);
color blueSolid150 = color(0, 0, 150);
color redSolid = color(255, 0, 0);
color greenSolid = color(0, 255, 0);  
color whiteGrad50 = color(255, 50);
color whiteGrad15 = color(255, 15);
color whiteGrad5 = color(255, 5);
color whiteSolid = color(255);


// Confirmed with specific spacing intervals: 100, 200, 250, 500
// Since it is divided by width, it requires certain intervals
// to generate an appropriate matrix structure
int spacing = 100;
int iteration;
int index = 0;
int col, row;


Folder[] folders;


void setup() {
   size(1000, 1000);
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

void draw() {
   background(blackSolid);
   
   noFill();
   stroke(whiteSolid);

   
   for(int i=0; i < folders.length; i++){

      folders[i].drawStart();

   }
   
   
   pushMatrix();
   translate(width/2, height/2);
   
   popMatrix();
   
}
