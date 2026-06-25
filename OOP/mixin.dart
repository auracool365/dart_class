// A mixin is a way to reuse behavior (methods and properties) across multiple classes without using inheritance.
// Without mixin: data and functionality is duplicated
/* class Duck {
  void fly() {
    print("duck is flying");
  }

  void swim() {
    print("duck is swimming");
  }
}

class Eagle {
  // duplicate fly functionality
  void fly() {
    print("Eagle is flying");
  }
}

class Salmon {
  // duplicate swim functionality
  void swim() {
    print("Salmon is swimming");
  }
} */

// With mixin: Other classes can reuse without inheriting the entire class
// Example 1.
mixin Duck {
  void fly() {
    print("duck is flying");
  }

  void swim() {
    print("duck is swimming");
  }
}

class Eagle with Duck {}

class Salmon with Duck {}

// Example 2.
mixin Flyable {
  void fly() {
    print('$runtimeType is flying');
  }
}

mixin Swimmable {
  void swim() {
    print('$runtimeType is swimming');
  }
}

mixin Runnable {
  void run() {
    print('$runtimeType is running');
  }
}

// Base class
class Animal {
  String name;

  Animal(this.name);
}

// Combine abilities
class Swan extends Animal with Flyable, Swimmable, Runnable {
  Swan(super.name);
}

class Pelican extends Animal with Flyable, Runnable {
  Pelican(super.name);
}

class Fish extends Animal with Swimmable {
  Fish(super.name);
}

// Mixin with restriction
// This mixin can ONLY be used by classes that extend Vehicle
// Base class
class Vehicle {
  String make;
  String model;

  Vehicle(this.make, this.model);
}

mixin DriverBehaviour on Vehicle {
  int tripCount = 0;

  void startTrip() {
    tripCount++;

    print('Trip #$tripCount started in $make $model');
  }
}

// Allowed: Car IS a Vehicle
class Car extends Vehicle with DriverBehaviour {
  Car(super.make, super.model);
}

// Another base class, but its subclass will not be able to reuse Driver behavior methods. 
class Person {
  String name;

  Person(this.name);
}

// Error. Person is not a Vehicle
/* class Driver extends Person with DriverBehaviour {
  Driver(super.name);
} */

// Practical mixin example: Timestamps
mixin Timestamps {
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? readAt;

  void onCreate() {
    createdAt = DateTime.now();
    updatedAt = createdAt;
    print('Created at: $createdAt\n');
  }

  String onRead() {
    readAt = DateTime.now();
    return "read at $readAt";
  }

  void onUpdate() {
    updatedAt = DateTime.now();
    print('Updated at: $updatedAt\n');
  }
}

mixin SoftDelete {
  bool isDeleted = false;
  DateTime? deletedAt;

  void softDelete() {
    isDeleted = true;
    deletedAt = DateTime.now();
    print('Soft deleted at: $deletedAt');
  }

  void restore() {
    isDeleted = false;
    deletedAt = null;
    print('Record restored');
  }
}

class Post with Timestamps, SoftDelete {
  String title;
  String body;

  Post(this.title, this.body) {
    onCreate();
  }

  void read() {
    print("$body: ${onRead()}\n");
  }
}

void main() {
  Salmon salmon = Salmon();
  Eagle baldEagle = Eagle();

  salmon.swim();
  baldEagle.fly();

  Object userName = "John";
  print(userName.runtimeType);

  Swan swan = Swan('Donald');

  swan.fly();
  swan.swim();
  swan.run();

  print('');

  Pelican pelican = Pelican('Sam');
  pelican.fly();
  pelican.run();

  print('');

  Fish fish = Fish('Kote');
  fish.swim();

  // fish.fly(); doesn't exist

  Car car = Car('Toyota', 'Camry');

  car.startTrip();
  car.startTrip();

  print("\nTimeStamps");
  Post post = Post('First post', 'Hello World, This is Cornelius');
  post.read();
  post.onUpdate();
  post.softDelete();
  post.restore();
}
