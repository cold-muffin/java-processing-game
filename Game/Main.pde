import java.util.ArrayList;

ArrayList<Particle> particles = new ArrayList<>();

void setup() {
  size(800, 600);
  particles.add(new Particle(20, 20));
  particles.add(new Particle(20, 40));
  particles.get(0).addVelocity(new OrderedPair(25, 0));
  particles.get(1).addAcceleration(new OrderedPair(5, 0));
}

void draw() {
  background(255);
  for (Particle p : particles) {
    p.tick();
    p.disp(5);
  }
  if (mousePressed) {
    System.out.println("Mouse pressed in ("+mouseX+", "+mouseY+")"); 
  }
}
