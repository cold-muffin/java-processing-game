class OrderedPair {
  float x = 0;
  float y = 0;

  OrderedPair() {}

  OrderedPair(float x, float y) {
    this.x = x;
    this.y = y;
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
}
