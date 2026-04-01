import java.util.ArrayList;
import java.util.ArrayDeque;

final int XSIZE = 800;
final int YSIZE = 600;
final int PRESS_DELAY = 15;

final float GRAVITATIONAL_CONSTANT = 980;
final float G = 667;

ArrayList<Particle> particles = new ArrayList<>();
boolean mousePress = false;

Particle planet = new Particle(XSIZE/2, YSIZE/2, 1000);

void settings() {
  size(XSIZE, YSIZE);
}

void setup() {
  background(0);
  noStroke();
  
  particles.add(planet);
}

void draw() {
  background(0);
  
  // Update particles
  for (Particle p : particles) {
    if (p.getUseDynamicGravity()) {
      p.updateGravity(G, planet);
    }
    p.tick();
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
    System.out.println("pressed");
    mousePress = false;
    // Mouse press logic
    Particle helloWorld = new Particle(mouseX, mouseY);
    helloWorld.setUseDynamicGravity(true);
    helloWorld.addVelocity(new OrderedPair(0, 100));
    particles.add(helloWorld);
  }
}
