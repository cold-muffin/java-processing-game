class Particle {
  OrderedPair position = new OrderedPair();
  OrderedPair velocity = new OrderedPair();
  OrderedPair acceleration = new OrderedPair();
  
  OrderedPair force = new OrderedPair();
  OrderedPair momentum = new OrderedPair();
  
  int charge = 0;
  int mass = 1;
  
  float secondsPerTick = 1.0/60;
  
  Particle(float xPos, float yPos) {
    position = new OrderedPair(xPos, yPos);
  }
  
  void tick() {
    updateVelocity();
    updatePosition();
  }
  
  void addAcceleration(OrderedPair vector) {
    acceleration.add(vector);
  }
  
  void updateVelocity() {
    velocity.add(acceleration.multiplied(secondsPerTick));
  }
  
  void addVelocity(OrderedPair vector) {
    velocity.add(vector);
  }
  
  void updatePosition() {
    position.add(velocity.multiplied(secondsPerTick));
  }
  
  void disp(float diameter) {
    float radius = diameter/2;
    ellipse(position.getX()-radius, position.getY()-radius, diameter, diameter);
  }
}
