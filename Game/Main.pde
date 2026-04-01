import java.util.ArrayList;
import java.util.ArrayDeque;

final int XSIZE = 800;
final int YSIZE = 600;
final int PRESS_DELAY = 15;

final float GRAVITATIONAL_CONSTANT = 980;
final float G = 66.7;

ArrayList<Particle> particles = new ArrayList<>();
boolean mousePress = false;

Particle planet = new Particle(XSIZE/2, YSIZE/2, 3000);

void settings() {
  size(XSIZE, YSIZE);
}

void setup() {
  background(0);
  noStroke();
}

void draw() {
  background(0);
  
  // Update particles
  planet.disp();
  for (Particle p1 : particles) {
    if (p1.getUseDynamicGravity()) {
      p1.updateGravity(G, planet);
      for (Particle p2 : particles) {
        if (p1 != p2) {
          p1.addGravity(G, p2);
        }
      }
    }
    p1.tick();
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
    Particle helloWorld = new Particle(mouseX, mouseY, 1000);
    Particle moon = new Particle(mouseX+20, mouseY, 50);
    helloWorld.setUseDynamicGravity(true);
    moon.setUseDynamicGravity(true);
    helloWorld.addVelocity(new OrderedPair(0, 50));
    moon.addVelocity(new OrderedPair(0, 100));
    particles.add(helloWorld);
    particles.add(moon);
    System.out.println("Mouse pressed: "+particles.size()+" particle(s) in simulation");
  }
}
