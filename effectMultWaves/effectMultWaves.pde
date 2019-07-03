
// Color scheme
color blackSolid = color(0);
color redSolid = color(255, 0, 0);
color greenSolid = color(0, 255, 0);
color whiteAlpha100 = color(255, 100);
color whiteAlpha50 = color(255, 50);
color whiteAlpha15 = color(255, 15);
color whiteAlpha5 = color(255, 5);
color whiteSolid = color(255);

int frameWidth = 900;      // Width of wave curve
int startXPos = 50;
int curveXOffset = 25;

int multiplier = 40;

Grid gridOne, gridTwo, gridThree;                    // Grid objects
FrameTab tabFrameOne, tabFrameTwo, tabFrameThree;    // Tabbed frame objects
Wave waveOne, waveTwo, waveThree;                    // Wave option objects

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

void setup() {
   size(1000, 1000);
   frameRate(10);
   
   // *******************************************************
   // Grid objects
   // Parameters(xPos, yPos, Width, Height, Line Color, Grid Spacing)
   gridOne = new Grid(50, 150, 900, 200, whiteAlpha15, 10);
   gridTwo = new Grid(50, 400, 900, 200, whiteAlpha15, 10);
   gridThree = new Grid(50, 650, 900, 200, whiteAlpha15, 10);
   // *******************************************************
   // Tabbed frame objects
   // Parameters(xPos, yPos, Width, Height, Cut Size, Line Color, Line Weight, Fill Option, Fill Color)
   tabFrameOne = new FrameTab(875, 163, 60, 30, 10, whiteSolid, 1, true, blackSolid);
   tabFrameTwo = new FrameTab(875, 413, 60, 30, 10, whiteSolid, 1, true, blackSolid);
   tabFrameThree = new FrameTab(875, 663, 60, 30, 10, whiteSolid, 1, true, blackSolid);
   // *******************************************************
   // Wave option objects
   // Parameters(xPos, yPos, Line Color, Line Alpha, Alpha Delta, Option)
   waveOne = new Wave(50, height/4, whiteSolid, 150, 50, 1);
   waveTwo = new Wave(50, height/2, whiteSolid, 200, 150, 2);
   waveThree = new Wave(50, height - height/4, whiteSolid, 200, 150, 3);
   // *******************************************************
}

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

void draw() {
  background(blackSolid);
  pushMatrix();
      // *******************************************************
      // Grid objects
          translate(0, 0);
          gridOne.drawGrid();
          gridTwo.drawGrid();
          gridThree.drawGrid();
          // Parameters(Line Color)
          gridOne.drawFrame(whiteSolid);
          gridTwo.drawFrame(whiteSolid);
          gridThree.drawFrame(whiteSolid);
          // Parameters(Line Color, Stroke Weight, Line Length)
          gridOne.drawAllCorners(whiteSolid, 4, 30);
          gridTwo.drawAllCorners(whiteSolid, 4, 30);
          gridThree.drawAllCorners(whiteSolid, 4, 30);
      // *******************************************************
      // Tabbed frame object
      // No parameters
          tabFrameOne.drawFrame(); 
          tabFrameTwo.drawFrame();
          tabFrameThree.drawFrame();
      // Add centered text to frame object
      // Parameters: Text Color, Text Size, Text Value
          tabFrameOne.drawText(whiteAlpha100, 20, int(random(62, 65)));    
          tabFrameTwo.drawText(whiteAlpha100, 20, int(random(85, 189))); 
          tabFrameThree.drawText(whiteAlpha100, 20, int(random(124, 138)));         
      // *******************************************************
      // Wave option objects
      // No parameters
          waveOne.drawWave();
          waveTwo.drawWave();
          waveThree.drawWave();
      // ******************************************************* 
  popMatrix();  
}
