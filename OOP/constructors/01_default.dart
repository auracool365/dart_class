// There are two forms of default constructors
// Short form
class Person {
  // properties: tell us about the objects
  String name;
  String gender;
  int age;

  Person(this.name, this.gender, this.age); // Short-hand syntax
}

// Long form
class Phone {
  String? make;
  String? model;
  int? price;

  Phone(String make, String model, int price) {
    // Long syntax
    this.make = make;
    this.model = model;
    this.price = price;
  }
}

void main() {
  Person p1 = Person("Sam", "Male", 200);
  print(p1.name);

  Phone iOS = Phone("iPhone", "17 Pro Max", 1999);
  print(iOS.model);
}
