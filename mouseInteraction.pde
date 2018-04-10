int PARTICLE_NUM = 1000;
float PARTICLE_RADIOUS = 1.5;
float PARTICLE_MAX_SPEED = 10.0;
float PARTICLE_MAX_ACCELERATION = 0.7;
float PARTICLE_SPEED_VARIANT = 0.2;

Particle[] particles;

void setup(){
  size(1280, 800);
  particles = new Particle[PARTICLE_NUM];
  for(int i = 0; i < PARTICLE_NUM; i++){
    particles[i] = new Particle();
  }
 
}

void draw(){
  background(0);
  for(Particle particle: particles){
    particle.display();
    particle.update();
  }
  
}

class Particle{
  
  PVector position;
  PVector velocity;
  
  Particle(){
    position = new PVector(random(width), random(height));
    setRandomVelocity();
  }
  
  void setRandomVelocity(){
    velocity = new PVector(random(2) - 1.0, random(2) - 1.0);
    velocity.normalize();
    velocity.mult(random(PARTICLE_MAX_SPEED * 2) - PARTICLE_MAX_SPEED);
  }
  

  void display(){
    noStroke();
    fill(random(45,54), random(0,190), 255, random(100,200));
    ellipse(position.x, position.y, PARTICLE_RADIOUS * 4, PARTICLE_RADIOUS * 4);
  }
  
  void update(){
    PVector hand = new PVector(mouseX, mouseY);
    PVector direction = PVector.sub(hand, position);
    direction.normalize();
    PVector acceleration = PVector.mult(direction, PARTICLE_MAX_ACCELERATION);
    velocity.add(acceleration);
    PVector velocityVariant = new PVector(random(2) - 1.0, random(2) - 1.0);
    velocityVariant.normalize();
    velocityVariant.mult(PARTICLE_SPEED_VARIANT);
    velocity.add(velocityVariant);
    velocity.limit(PARTICLE_MAX_SPEED);
    position.add(velocity);
  }
  
}
