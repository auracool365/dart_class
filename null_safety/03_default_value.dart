/* 
  left ?? right evaluates to left if it's not null, or right otherwise. This is the Dart compiler's way of saying if the value
  the left is null, use the default on the right.
 */

class Address {
  final String? city;
  Address({this.city});
}

class Person {
  final Address? address;
  Person({this.address});
}

void main() {
  String? userName;

  String displayName = userName ?? "Guest Player";
  print(displayName);

  userName = "Caesar";
  displayName = userName ?? "Another Guest Player";
  print(displayName);

  // OOP  example
  Person personWithNoAddress = Person();

  print(personWithNoAddress.address?.city ?? "Unknown Address");
}
