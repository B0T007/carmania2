class Traffic extends GameObject {

  float maxSpeed;

  Traffic(PVector _position, PVector _velocity, PVector _acceleration, PImage _sprite, float _maxSpeed) {
    super(_position, _velocity, _acceleration, _sprite);

    maxSpeed = _maxSpeed;
    spawn();
  }
  //vad händer


  void run() {
    render();
    update();
  }


  void spawn() {
    //   position.x = random(10, 1000);
    position.y = random(10, height - 10);
    velocity.x = random(1, maxSpeed);
    velocity.y = random(1, maxSpeed);
  }


  void render() {
    imageMode(CENTER);
    image(sprite, position.x, position.y);
    sprite.resize(150, 100);
  }


  void update() {

    position.x = position.x + velocity.x;       //det som ger hastigheten

    if (position.x > width) {  //tar bort bilen om den kommer till hörnen
      position.x = 0;
      position.y = random(10, 1000);
      velocity.x = random(1, 4);
    }

    //kollar efter hörnen
    if (position.x > width) {
      velocity.x = velocity.x*(-1);
    }
    if (position.x < 0) {
      velocity.x = velocity.x*(-1);
    }
    if (position.y < 0) {
      velocity.y = velocity.y*(-1);
    }
    if (position.y > height) {
      velocity.y = velocity.y*(-1);
    }
    //slut
  }


}
