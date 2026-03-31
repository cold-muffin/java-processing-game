class Particle {
  OrderedPair position = new OrderedPair();
  OrderedPair velocity = new OrderedPair();
  OrderedPair acceleration = new OrderedPair();
  
  OrderedPair force = new OrderedPair();
  OrderedPair momentum = new OrderedPair();
  
  int charge = 0;
  float mass = 1.0;
  float elasticity = 0;
  
  float secondsPerTick = 1.0/60;
  boolean removeOnOutOfBounds = false;
  
  Particle(float xPos, float yPos) {
    position = new OrderedPair(xPos, yPos);
  }
  
  Particle(float xPos, float yPos, float mass) {
    this(xPos, yPos);
    this.mass = mass;
  }
  
  boolean isOutOfBounds(int xSize, int ySize) {
    boolean outOfBoundsX = position.getX() < 0 || position.getX() > xSize;
    boolean outOfBoundsY = position.getY() < 0 || position.getY() > ySize;
    return outOfBoundsX || outOfBoundsY;
  }
  
  boolean getRemoveOnOutOfBounds() {
    return removeOnOutOfBounds;
  }
  
  OrderedPair getPosition() {
    return position;
  }
  
  float distance(Particle other) {
    return position.distance(other.getPosition());
  }
  
  float getMass() {
    return mass;
  }
  
  void tick() {
    updateAcceleration();
    updateVelocity();
    updatePosition();
  }
  
  void addGravity(float constant) {
    force.add(new OrderedPair(0, mass*constant));
  }
  
  void setForce(OrderedPair vector) {
    force = vector;
  }
  
  void addForce(OrderedPair vector) {
    force.add(vector);
  }
  
  void updateAcceleration() {
    acceleration = force.divided(mass);
  }
  
  void setAcceleration(OrderedPair vector) {
    acceleration = vector;
  }
  
  void addAcceleration(OrderedPair vector) {
    acceleration.add(vector);
  }
  
  void updateVelocity() {
    velocity.add(acceleration.multiplied(secondsPerTick));
  }
  
  void setVelocity(OrderedPair vector) {
    velocity = vector;
  }
  
  void addVelocity(OrderedPair vector) {
    velocity.add(vector);
  }
  
  void updatePosition() {
    position.add(velocity.multiplied(secondsPerTick));
  }
  
  void setPosition(OrderedPair vector) {
    position = vector;
  }
  
  void addPosition(OrderedPair vector) {
    position.add(vector);
  }
  
  void setRemoveOnOutOfBounds(boolean b) {
    removeOnOutOfBounds = b;
  }
  
  void disp(float diameter) {
    float radius = diameter/2;
    ellipse(position.getX()-radius, position.getY()-radius, diameter, diameter);
  }
  
  void disp(PImage image) {
    image(image, position.getX(), position.getY(), 40, 20);
  }
}
