
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

FolderArray folderStructure;
FrameGeo frame001, frame002;

void setup() {
   size(1920, 1080);  
   folderStructure = new FolderArray();
   frame001 = new FrameGeo();
   frame002 = new FrameGeo();
   frame001.structureFrame(1040, 1040, 120);
   frame002.structureFrame(1030, 1030, 118);
}

void draw() {
   background(blackSolid);
   folderStructure.drawArray();
   frame001.posFrame(20, 20); 
   frame002.posFrame(25, 25); 
}
