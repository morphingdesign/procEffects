


// Color scheme
color blackSolid = color(0);
color blueSolid = color(0, 0, 255);
color redSolid = color(255, 0, 0);
color greenSolid = color(0, 255, 0);
color whiteSolid = color(255);

color barBack = color(33, 67, 66);
color barLight = color(116, 37, 37);


// Objects
Progress[] progBars = new Progress[10]; 

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

void setup() {
   size(800, 400);
   for(int i=0; i < progBars.length; i++){
      progBars[i] = new Progress(i * 10);
   }
   
}

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

void draw() {
  background(blackSolid);
  pushMatrix();
  translate(width/2, height/2);  
  for(int i=0; i < progBars.length; i++){
     progBars[i].roundRect(barBack);
  }
  popMatrix();
}

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
