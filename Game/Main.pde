import java.util.ArrayList;

final int XSIZE = 800;
final int YSIZE = 600;

ArrayList<Particle> particles = new ArrayList<>();
int pressDelay = 15;
boolean mousePress = false;

PImage dollar;

void settings() {
  size(XSIZE, YSIZE);
}

void setup() {
  noStroke();
  //particles.add(new Particle(20, 20));
  //particles.add(new Particle(20, 40));
  //particles.add(new Particle(20, 60));
  //particles.get(0).addVelocity(new OrderedPair(100, 0));
  //particles.get(1).addAcceleration(new OrderedPair(98, 0));
  //particles.get(2).addVelocity(new OrderedPair(200, 0));
  //particles.get(2).addAcceleration(new OrderedPair(-98, 0));
  dollar = loadImage("dollar.jpg");
}

void draw() {
  background(0);
  
  for (Particle p : particles) {
    p.tick();
    p.disp(dollar);
  }
  
  for (int i=0; i<particles.size(); i++) {
    Particle p = particles.get(i);
    //p.setRemoveOnOutOfBounds(true);
    if (p.isOutOfBounds(XSIZE, YSIZE) && p.getRemoveOnOutOfBounds()) {
      particles.remove(i);
      i--;
    }
  }
  
  if (mousePressed) {
    mousePress = true;
  }
   
  if (mousePress /*&& frameCount % pressDelay == 0*/) {
    mousePress = false;
    for (int i=0; i<10; i++) {
      Particle p = new Particle(mouseX, mouseY);
      p.addVelocity(new OrderedPair((int)(Math.random()*501-250), -1000+(int)(Math.random()*501-250)));
      p.addAcceleration(new OrderedPair(0, 980));
      particles.add(p);
    }

    System.out.println(particles.size());
  }
}
