

// Color scheme
color blackSolid = color(0);
color blueSolid = color(0, 0, 255);
color redSolid = color(255, 0, 0);
color greenSolid = color(0, 255, 0);
color whiteSolid = color(255);

color barBack = color(33, 67, 66);
color barLight = color(116, 37, 37);

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

void setup() {
   size(800, 400);
   
}

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

void draw() {
  background(blackSolid);
  pushMatrix();
  translate(width/2, height/2);  
  progressBar();
  popMatrix();
}

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

void progressBar(){
  pushMatrix();
  translate(0, 0);
  roundRect();
  popMatrix();
}


void roundRect(){
  int spacing = 10;
  pushMatrix();
  noStroke();
  fill(barBack);
  
  if(keyPressed == true){
     fill(barLight);
  }
  else{
     fill(barBack);
  }

  rectMode(CENTER);
  
  for(int i=0; i < 20 * spacing; i+=spacing){
     //translate(i, 0);
     
     rect(i, 0, 6, 20, 3);
  }
  
  popMatrix();
}
