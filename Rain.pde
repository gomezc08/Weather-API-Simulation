class Rain {
    /*
  Rain simulations.
  
  ATTRIBUTES:
    x: x position of the rain droplet.
    y: y position of the rain droplet.
    rain_height: size of the rain droplet.
    speed: rain droplet movement speed.
  
  METHODS:
    Rain() None: default constructor for rain class.
    update() None: performs updates on our set of rain droplets based on their positioning attributes.
    display() None: draws out the rain droplet at the current position.
  */
  
  float x, y;
  float rain_height;
  float speed;
  
  Rain() {
    x = random(210, 680); 
    y = 100;
    rain_height = random(10,12);
    speed = random(4,7);
  }
  
  void update() {
    y += speed;

    // Reset if the snowflake reaches the bottom
    if (y > 570) {
      x = random(210, 680);
      y = 100;
    }
  }

  void display() {
    fill(19, 24, 98);
    noStroke();
    rect(x, y, 1, rain_height);
  }
}
