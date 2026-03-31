class OrderedPair {
  double[] data = new double[2];
  
  OrderedPair(double x, double y) {
    data = new double[] {x, y};
  }
  
  double getX() {
    return data[0];
  }
  
  double getY() {
    return data[1];
  }
  
  double dot(OrderedPair other) {
    return data[0]*other.getX() + data[1]*other.getY();
  }
  
  OrderedPair added(OrderedPair other) {
    return new OrderedPair(data[0]+other.getX(), data[1]+other.getY());
  }
  
  OrderedPair subtracted(OrderedPair other) {
    return new OrderedPair(data[0]-other.getY(), data[1]-other.getY());
  }
  
  OrderedPair multiplied(double scalar) {
    return new OrderedPair(data[0]*scalar, data[1]*scalar);
  }
  
  OrderedPair divided(double scalar) {
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
  
  void multiply(double scalar) {
    data[0] *= scalar;
    data[1] *= scalar;
  }
  
  void divide(double scalar) {
    data[0] /= scalar;
    data[1] /= scalar;
  }
}
