class OrderedPair {
  float[] data = new float[2];
  
  OrderedPair() {}
  
  OrderedPair(float x, float y) {
    data = new float[] {x, y};
  }
  
  @Override
  String toString() {
    return "("+data[0]+", "+data[1]+")";
  }
  
  float getX() {
    return data[0];
  }
  
  float getY() {
    return data[1];
  }
  
  float dot(OrderedPair other) {
    return data[0]*other.getX() + data[1]*other.getY();
  }
  
  OrderedPair added(OrderedPair other) {
    return new OrderedPair(data[0]+other.getX(), data[1]+other.getY());
  }
  
  OrderedPair subtracted(OrderedPair other) {
    return new OrderedPair(data[0]-other.getY(), data[1]-other.getY());
  }
  
  OrderedPair multiplied(float scalar) {
    return new OrderedPair(data[0]*scalar, data[1]*scalar);
  }
  
  OrderedPair divided(float scalar) {
    return new OrderedPair(data[0]/scalar, data[1]/scalar);
  }
  
  void add(OrderedPair other) {
    data[0] += other.getX();
    data[1] += other.getY();
  }
  
  void subtract(OrderedPair other) {
    data[0] -= other.getX();
    data[1] -= other.getY();
  }
  
  void multiply(float scalar) {
    data[0] *= scalar;
    data[1] *= scalar;
  }
  
  void divide(float scalar) {
    data[0] /= scalar;
    data[1] /= scalar;
  }
}
