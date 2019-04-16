


// Color scheme
color blackSolid = color(0);
color blueSolid = color(0, 0, 255);
color redSolid = color(255, 0, 0);
color greenSolid = color(0, 255, 0);
color whiteSolid = color(255);

color barBack = color(33, 67, 66);
color barLight = color(116, 37, 37);


// Objects
Progress progBar;

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

void setup() {
   size(800, 400);
   progBar = new Progress();
}

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

void draw() {
  background(blackSolid);
  pushMatrix();
  translate(width/2, height/2);  
  progBar.drawBar();
  popMatrix();
}

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
