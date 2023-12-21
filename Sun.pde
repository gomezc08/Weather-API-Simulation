class Sun {
  /*
  Sun simulation.
  
  ATTRIBUTES:
    x: x position of the sun.
    y: y position of the sun.
    diameter: size of the sun.
  
  METHODS:
    Sun() None: default constructor for Sun class.
    display() None: draws out the snowflake at the current position.
  */
  
  float x, y; 
  float diameter; 

  Sun() {
    x = 625; 
    y = 160; 
    diameter = 80;
  }

  void display() {
    // Draw the sun.
    fill(255, 255, 0); 
    noStroke();
    ellipse(x, y, diameter, diameter);
  
    // Draw the sun ray things.
    for (int i = 0; i < 25; i++) {
      stroke(random(240, 255), random(240,255), 0); 
      line(random(400, 650), random(220, 500), x-10, y+20);
    }
  }
}
