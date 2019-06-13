// Requires access to Processing Video library
import processing.video.*; 

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
// Variables
Movie movie;     // Movie object

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
void setup() {  
  size(1920, 1080);  

  // Locate movie file in data folder. Proc automatically recognizes it
  movie = new Movie(this, "lightOrb_take001.webm");  // Init Movie object
  
  //movie.loop();  // Play movie on loop
  movie.play();  // Play movie once
}

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
void movieEvent(Movie movie) {  
  movie.read();    // Read new movie frames; called automatically
}

// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
void draw() {
  image(movie, 0, 0);    // Call movie using image(); x- & y-pos
  
  // Grid in foreground
  int xCount = 50;
  int yCount = 30;
  int xSpacing = width/xCount;
  int ySpacing = height/yCount;
  stroke(255, 25);
  strokeWeight(1);
  for(int i=0; i < yCount; i++){
      line(0, ySpacing + i * ySpacing, width, ySpacing + i * ySpacing);
  }
  for(int i=0; i < xCount; i++){
      line(xSpacing + i * xSpacing, 0, xSpacing + i * xSpacing, height);
  }
}
