class Fog {
  /*
  Fog  simulations.
  
  ATTRIBUTES:
    x: x position of each fog ellipse.
    y: y position of each fog ellipse.
    r: size of each fog ellipse.
  
  METHODS:
    Fog() None: constructor for cloud class.
    update() None: performs updates on our set of fogs based on their positioning attributes.
    display() None: draws out the fog at the current position.
  */
  
  float x;
  float y;
  float r;
  int fog_color;
  
  Fog(float tempX,float tempY,float tempR) {
    x = tempX;
    y = tempY;
    r = tempR;
  }
  
  void update() {
    x = x + random(-10, 10);
    y = y + random(-10, 10);
    if(x > 700) {
      x = 670;
    }
    else if(x < 200) {
      x = 250;
    }
    if(y > 600) {
      y = 550;
    }
    else if(y < 130) {
      y = 100;
    }
    
  }
  
  void display() {
    noStroke();
    fill(200, 25);
    ellipse(x, y, r/2, r/2);
  }
}
