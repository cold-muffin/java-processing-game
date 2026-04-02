class ParticleSystem {
  ArrayList<Particle> particles = new ArrayList<>();
  float xLeft, yLeft, xRight, yRight;
  float G = 100.7;
  
  ParticleSystem(float xLeft, float yLeft, float xRight, float yRight) {
    this.xLeft = xLeft;
    this.yLeft = yLeft;
    this.xRight = xRight;
    this.yRight = yRight;
  }
  
  ParticleSystem(float xRight, float yRight) {
    this(0, 0, xRight, yRight);
  }
  
  ArrayList<Particle> getParticles() {
    return particles;
  }
  
  void tick() {
    removeOutOfBounds();
    updateGravity();
    for (Particle p1 : particles) {
      p1.tick();
    }
    disp();
  }
  
  void removeOutOfBounds() {
    for (int i=0; i<particles.size(); i++) {
      Particle p = particles.get(i);
      if (p.isOutOfBounds(xLeft, yLeft, xRight, yRight) && p.getRemoveOnOutOfBounds()) {
        particles.remove(i);
        i--;
      }
    }
  }
  
  void updateGravity() {
    for (Particle p1 : particles) {
      if (p1.getUseDynamicGravity()) {
        p1.clearForce();
        for (Particle p2 : particles) {
          if (p1 != p2) {
            p1.addGravity(G, p2);
          }
        }
      }
    }
  }
  
  void disp() {
    for (Particle p : particles) {
      p.disp();
    }
  }
}
