
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

int spacing = 200;
int iteration;
int index = 0;
int row;

Folder[] folders;
PVector[] targetPos;

//Folder folder0;

void setup() {
   size(1000, 1000);
   iteration = width / spacing;
   folders = new Folder[iteration * iteration];
   //folder0 = new Folder(60, 40);
   row = 1;
   
   println("Folder Length: " + folders.length);
   
   for(int x=spacing; x < width; x+=spacing){
      println("Pre index[" + index + "]");
      for(int y=spacing; y < height; y+=spacing){
         
         //point(x, y);
         println("index[" + index + "]: (" + x + ", " + y + ")");
         //folder0.drawGeo(x, y);
         folders[index] = new Folder(60, 40, x, y);
         index++;
      }
      
      index = (iteration - 1) * row;
      row++;
      println("Post index[" + index + "]");
      
   }


   
   
}

void draw() {
   background(blackSolid);
   
   noFill();
   stroke(whiteSolid);
   /**
   for(int x=spacing; x < width; x+=spacing){
      for(int y=spacing; y < height; y+=spacing){
         
         point(x, y);
         //println("(" + x + ", " + y + ")");
         //folder0.drawGeo(x, y);
         folders[index].drawGeo(x, y);
      }
   }
   if(index == iteration){
      index = 0;
   }
   else{
      index++;
   }
   **/
   
   pushMatrix();
   translate(width/2, height/2);
   
   popMatrix();
   
}
