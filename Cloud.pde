class Cloud {
  /*
  Cloud simulations.
  
  ATTRIBUTES:
    x: x position of the cloud.
    y: y position of the cloud.
    size: size of the cloud.
    speed: cloud movement speed.
    angle: how cloud rotates.
  
  METHODS:
    cloud() None: default constructor for cloud class.
    update() None: performs updates on our set of clouds based on their positioning attributes.
    display() None: draws out the cloud at the current position.
  */
  
  float x, y; 
  float size; 
  float speed; 
  float angle; 

  Cloud() {
    x = random(300, 500); 
    y = 200; 
    size = random(50, 150);
    speed = 2;
    angle = 0;
  }

  void update() {
    angle += 0.02;
    x += speed * cos(angle);

    // Reset if the cloud goes beyond the right or left edge.
    if (x > 600 || x < 300) {
      x = random(200, 400); 
      y = 200; 
    }
  }

  void display() {
    fill(255); 
    noStroke();
    ellipse(x, y, size, size * 0.6); 
    ellipse(x + size * 0.4, y - size * 0.3, size * 0.8, size * 0.6); 
  }
}
