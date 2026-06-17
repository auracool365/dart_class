/* Named Constructors: Provides multiple ways to create objects based on the same class */

/* Initializer lists run before the constructor body. Used to set final fields that need computation, or to call a superclass constructor. */

class Car {
  String make;
  String model;
  String color;
  int year;

  // Object construction definition
  // 1. Default construction
  Car(this.make, this.model, this.color, this.year);

  // 2. Named constructor: dealership car(set the default values, using initializer lists)
  Car.fromDealership(this.make, this.model)
    : color = "Arctic Grey",
      year = 2025;

  // 3. Named constructor: classics
  Car.classics(this.make, this.model, this.color) : year = 1999;

  // 4. Named constructor: Brand new from the assembly line
  Car.brandNew(this.make, this.model)
    : color = "off white",
      year = DateTime.now().year;

  void displayCar() {
    print("$color color $year $make $model");
  }
}

void main() {
  Car car1 = Car("Toyota", "Camry", "Black", 2023);
  car1.displayCar();

  Car car2 = Car.fromDealership("Mercedes Benz", "S63 AMG");
  car2.displayCar();

  Car car3 = Car.classics("Porsche", "911 turbo gt", "White");
  car3.displayCar();

  Car car4 = Car.brandNew("Porsche", "Cayenne turbo gt");
  car4.displayCar();
}
