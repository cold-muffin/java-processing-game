import java.util.ArrayList;

ArrayList<Particle> particles = new ArrayList<>();
int pressDelay = 15;
int pressCooldown = 0;

void setup() {
  size(800, 600);
  noStroke();
  particles.add(new Particle(20, 20));
  particles.add(new Particle(20, 40));
  particles.get(0).addVelocity(new OrderedPair(25, 0));
  particles.get(1).addAcceleration(new OrderedPair(5, 0));
}

void draw() {
  background(0);
  for (Particle p : particles) {
    p.tick();
    p.disp(5);
  }
  if (pressCooldown > 0) {
    pressCooldown--;
  }
  if (mousePressed && pressCooldown == 0) {
    pressCooldown = pressDelay;
    Particle p = new Particle(mouseX, mouseY);
    p.addAcceleration(new OrderedPair(40, 0));
    particles.add(p);
  }
}
