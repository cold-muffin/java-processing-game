import java.util.ArrayList;

final int XSIZE = 800;
final int YSIZE = 600;

ArrayList<Particle> particles = new ArrayList<>();
int pressDelay = 15;
int pressCooldown = 0;

void settings() {
  size(XSIZE, YSIZE);
}

void setup() {
  noStroke();
  particles.add(new Particle(20, 20));
  particles.add(new Particle(20, 40));
  particles.add(new Particle(20, 60));
  particles.get(0).addVelocity(new OrderedPair(100, 0));
  particles.get(1).addAcceleration(new OrderedPair(98, 0));
  particles.get(2).addVelocity(new OrderedPair(200, 0));
  particles.get(2).addAcceleration(new OrderedPair(-98, 0));
}

void draw() {
  background(0);
  
  for (Particle p : particles) {
    p.tick();
    p.disp(5);
  }
  
  for (int i=0; i<particles.size(); i++) {
    Particle p = particles.get(i);
    p.setRemoveOnOutOfBounds(true);
    if (p.isOutOfBounds(XSIZE, YSIZE) && p.getRemoveOnOutOfBounds()) {
      particles.remove(i);
      i--;
    }
  }
    
  if (pressCooldown > 0) {
    pressCooldown--;
  }
  
  if (mousePressed && pressCooldown == 0) {
    pressCooldown = pressDelay;
    /*
    Particle p = new Particle(mouseX, mouseY);
    p.addAcceleration(new OrderedPair(40, 0));
    particles.add(p);
    */
    System.out.println(particles.size());
  }
}
