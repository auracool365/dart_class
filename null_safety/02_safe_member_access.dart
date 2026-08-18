/* 
  . calls a method or accesses a property only if the value on its left isn't null; if it is null, 
  the whole expression short-circuits to null instead of throwing an error.
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

  print(userName?.length);

  userName = "Cornelius";
  print(userName.length);

  // OOP example
  Person person = Person(address: Address(city: 'Lagos'));
  print(person.address?.city); // 'Lagos'

  Person personWithNoAddress = Person();
  print(
    personWithNoAddress.address?.city,
  ); // null, no crash, even two levels deep
}
