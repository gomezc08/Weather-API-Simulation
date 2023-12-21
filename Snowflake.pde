class Snowflake {
    /*
  Cloud simulations.
  
  ATTRIBUTES:
    x: x position of the snowflake.
    y: y position of the snowflake.
    diameter: size of the snowflake (represented as an ellipse so basically snowball)
    speed: snowflake movement speed.
  
  METHODS:
    Snowflake() None: default constructor for snowflake class.
    update() None: performs updates on our set of snowflake based on their positioning attributes.
    display() None: draws out the snowflake at the current position.
  */
  
  float x, y; 
  float diameter; 
  float speed; 

  Snowflake() {
    x = random(200, 700); 
    y = 75; 
    diameter = random(5, 15);
    speed = random(1, 3);  
  }

  void update() {
    y += speed;

    // Reset if the snowflake reaches the bottom
    if (y > 600) {
      y = random(100, 350);
      x = random(200, 700);
    }
  }

  void display() {
    fill(255);
    noStroke();
    ellipse(x, y, diameter, diameter);
  }
}
