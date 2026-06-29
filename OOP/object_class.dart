/* Object is the root of the entire Dart type hierarchy. Every class implicitly extends Object. Every class in Dart automatically 
inherits from Object. That means every class already gets these: toString(), ==, hashCode, runtimeType */
// Example 1
class Student {}

// Example 2
// Every class inherits from Object
class Product {
  String name;
  double price;

  Product(this.name, this.price);

  // Override toString: readable representation specific to product
  @override
  String toString() => 'Product(name: $name, price: ₦$price)';

  // Override == structural equality
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true; // same reference
    if (other is! Product) return false; // wrong type
    return name == other.name && price == other.price;
  }

  // Override hashCode: must match ==
  // If a == b then a.hashCode MUST equal b.hashCode
  @override
  int get hashCode => name.hashCode ^ price.hashCode;
}

void main() {
  Student s = Student();

  print(s.runtimeType);

  print(s.toString());

  print(s.hashCode);

  print(s == String);

  // Example 2
  Product p1 = Product('Laptop', 150000.0);
  Product p2 = Product('Watch', 15000.0);
  Product p3 = Product('Phone', 80000.0);

  print(p1);
  print(p1 == p2);
  print(p1 == p3);
  print(identical(p1, p2));

  // hashCode consistency
  print(p1.hashCode == p2.hashCode);

  // runtimeType
  Object value = 'Hello';
  print(value.runtimeType);

  value = 42;
  print(value.runtimeType);

  value = p1;
  print(value.runtimeType);

  // Object as a type
  // Object holds any non-null value, but must be type casted before using
  Object anything = 'Dart';
  if (anything is String) {
    print(anything.toUpperCase()); // DART: promoted to String
  }
}
