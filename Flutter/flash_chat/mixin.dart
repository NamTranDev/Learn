main() {
  Fish().move();
  Bird().move();
}

class Animal {
  void move() {
    print("Change position");
  }
}

class Fish extends Animal with CanSwim {
  @override
  void move() {
    swim();
  }
}

class Bird extends Animal with CanFly {
  @override
  void move() {
    fly();
  }
}

mixin CanSwim {
  void swim() {
    print("Change position by swimming");
  }
}

mixin CanFly {
  void fly() {
    print("Change position by flying");
  }
}

class Duck extends Animal with CanFly, CanSwim {}
