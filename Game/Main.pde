import java.util.ArrayList;
import java.util.ArrayDeque;

final int XSIZE = 1200;
final int YSIZE = 700;

final float GRAVITATIONAL_CONSTANT = 980;

ParticleSystem sim = new ParticleSystem(XSIZE, YSIZE);

void settings() {
  size(XSIZE, YSIZE);
}

void setup() {
  background(0);
  noStroke();
  
  Particle sun = new Particle(XSIZE/2, YSIZE/2, 3000);
  
  Particle planet = new Particle(750, 350, 1000);
  planet.setUseDynamicGravity(true);
  planet.addVelocity(new OrderedPair(0, 50));
  
  Particle moon = new Particle(790, 350, 50);
  moon.setUseDynamicGravity(true);
  moon.addVelocity(new OrderedPair(0, 100));
  
  sim.getParticles().add(sun);
  sim.getParticles().add(planet);
  sim.getParticles().add(moon);
}

void draw() {
  background(0);
  
  sim.tick();
}
