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
  float ticksAlive = 0;
  
  boolean visible = true;
  float diameter = 10;
  
  boolean dispTrail = true;
  ArrayDeque<OrderedPair> trailSegments = new ArrayDeque<>();
  int maxTrailSize = 500;
  
  boolean removeOnOutOfBounds = true;
  boolean useDynamicGravity = false;
  
  Particle(float xPos, float yPos) {
    position = new OrderedPair(xPos, yPos);
  }
  
  Particle(float xPos, float yPos, float mass) {
    this(xPos, yPos);
    this.mass = mass;
  }
  
  boolean isOutOfBounds(float xLeft, float yLeft, float xRight, float yRight) {
    boolean outOfBoundsX = position.getX() < xLeft || position.getX() > xRight;
    boolean outOfBoundsY = position.getY() < yLeft || position.getY() > yRight;
    return outOfBoundsX || outOfBoundsY;
  }
  
  boolean getRemoveOnOutOfBounds() {
    return removeOnOutOfBounds;
  }
  
  boolean getUseDynamicGravity() {
    return useDynamicGravity;
  }
  
  OrderedPair getPosition() {
    return position;
  }
  
  float distance(Particle other) {
    return position.distance(other.getPosition());
  }
  
  float angle(Particle other) {
    return position.angle(other.getPosition());
  }
  
  float getMass() {
    return mass;
  }
  
  void tick() {
    ticksAlive++;
    updateAcceleration();
    updateVelocity();
    updatePosition();
    
    // Update trail
    if (dispTrail && ticksAlive % 5 == 0) {
      trailSegments.addFirst(new OrderedPair(position));
      if (trailSegments.size() > maxTrailSize) {
        trailSegments.removeLast();
      }
    }
    dispTrailDiscrete();
    
    // Disp particle
    if (visible) {
      disp();
    }
  }
  
  void addGravity(float constant) {
    force.add(new OrderedPair(0, mass*constant));
  }
  
  void addGravity(float constant, Particle p2) {
    addGravity(constant, p2, 0);
  }
  
  void addGravity(float constant, Particle p2, float min_eff_dist) {
    float m1 = mass;
    float m2 = p2.getMass();
    float r = position.distance(p2.getPosition());
    float Fg = (float)( constant*m1*m2 / Math.pow(r+min_eff_dist, 2) );
    
    float theta = position.angle(p2.getPosition());
    force.add(new OrderedPair(cos(theta)*Fg, sin(theta)*Fg));
  }
  
  void setForce(OrderedPair vector) {
    force = vector;
  }
  
  void clearForce() {
    force.clear();
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
  
  void setUseDynamicGravity(boolean b) {
    useDynamicGravity = b;
  }
  
  void disp() {
    strokeWeight(2);
    fill(255);
    ellipse(position.getX(), position.getY(), diameter, diameter);
  }
  
  void disp(PImage image) {
    image(image, position.getX(), position.getY(), 40, 20);
  }
  
  void dispTrailContinuous() {
    stroke(100);
    strokeWeight(2);
    OrderedPair previous = null;
    for (OrderedPair p : trailSegments) {
      if (previous != null) {
        line(previous.getX(), previous.getY(), p.getX(), p.getY());
      }
      previous = p;
    }
  }
  
  void dispTrailDiscrete() {
    for (OrderedPair p : trailSegments) {
      p.disp();
    }
  }
}
