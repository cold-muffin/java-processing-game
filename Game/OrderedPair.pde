class OrderedPair {
  float x = 0;
  float y = 0;

  OrderedPair() {}

  OrderedPair(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  OrderedPair(OrderedPair p) {
    x = p.getX();
    y = p.getY();
  }

  @Override
  String toString() {
    return "(" + x + ", " + y + ")";
  }

  float getX() { return x; }
  float getY() { return y; }

  float dot(OrderedPair other) {
    return x * other.x + y * other.y;
  }

  OrderedPair added(OrderedPair other) {
    return new OrderedPair(x + other.x, y + other.y);
  }

  OrderedPair subtracted(OrderedPair other) {
    return new OrderedPair(x - other.x, y - other.y);
  }

  OrderedPair multiplied(float scalar) {
    return new OrderedPair(x * scalar, y * scalar);
  }

  OrderedPair divided(float scalar) {
    return new OrderedPair(x / scalar, y / scalar);
  }
  
  float distance(OrderedPair other) {
    OrderedPair translated = other.subtracted(this);
    return (float)(Math.sqrt(translated.dot(translated)));
  }
  
  float angle(OrderedPair other) {
    return atan2(other.getY() - y, other.getX() - x);
  }
  
  void clear() {
    x = 0;
    y = 0;
  }

  void add(OrderedPair other) {
    x += other.x;
    y += other.y;
  }

  void subtract(OrderedPair other) {
    x -= other.x;
    y -= other.y;
  }

  void multiply(float scalar) {
    x *= scalar;
    y *= scalar;
  }

  void divide(float scalar) {
    x /= scalar;
    y /= scalar;
  }
  
  void disp() {
    fill(100);
    ellipse(x, y, 2, 2);
  }
}
