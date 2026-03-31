import java.util.ArrayList;

final int XSIZE = 800;
final int YSIZE = 600;
final int PRESS_DELAY = 15;

final float GRAVITATIONAL_CONSTANT = 980;

ArrayList<Particle> particles = new ArrayList<>();
boolean mousePress = false;

void settings() {
  size(XSIZE, YSIZE);
}

void setup() {
  background(0);
  noStroke();
  
  Particle helloWorld = new Particle(XSIZE/2, 0);
  helloWorld.addGravity(GRAVITATIONAL_CONSTANT);
  particles.add(helloWorld);
  
  Particle heavy = new Particle(XSIZE/3, 0, 999);
  heavy.addGravity(GRAVITATIONAL_CONSTANT);
  particles.add(heavy);
}

void draw() {
  background(0);
  
  // Update particles
  for (Particle p : particles) {
    p.tick();
    p.disp(5+p.getMass()/100);
  }
  
  // Remove out of bounds particles
  for (int i=0; i<particles.size(); i++) {
    Particle p = particles.get(i);
    if (p.isOutOfBounds(XSIZE, YSIZE) && p.getRemoveOnOutOfBounds()) {
      particles.remove(i);
      i--;
    }
  }
  
  if (mousePressed) {
    mousePress = true;
  }
   
  if (mousePress && frameCount % PRESS_DELAY == 0) {
    mousePress = false;
    // Mouse press logic
  }
}
