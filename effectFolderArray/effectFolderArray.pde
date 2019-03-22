
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

int spacing = 20;
int iteration;

PShape folder, folderBody, folderTab;

void setup() {
   size(400, 400);
   iteration = width / spacing;
   drawFolder(width/2, height/2, 0, 0);
}

void draw() {
   background(blackSolid);
   
   noFill();
   stroke(whiteSolid);
   for(int x=0; x <= width; x+=spacing){
      for(int y=0; y <= height; y+=spacing){
         
         point(x, y);
         //println("(" + x + ", " + y + ")");
      }
      
   }
   
   pushMatrix();
   shape(folder);
   
   popMatrix();
   
}


void drawFolder(int x, int y, int w, int h){
  
  
  pushMatrix();
  translate(x, y);
  
  folder = createShape(GROUP);
  
  rectMode(CENTER);
  folderBody = createShape(RECT, 0, 0, 80, 40);
  folderBody.setFill(whiteSolid);
  folderTab = createShape(RECT, -40, -30, -20, -20);
  folderBody.setFill(whiteSolid);
  
  folder.addChild(folderBody);
  folder.addChild(folderTab);
  
  popMatrix();
}
