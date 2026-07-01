import 'package:equatable/equatable.dart';

class User extends Equatable {
  // Best practice, with equatable, properties should be immutable
  final String id;
  final String name;

  const User({required this.id, required this.name});

  // props
  @override
  List<Object?> get props => [id, name];
}

// props means: these fields determine whether objects are equal.
class Person extends Equatable {
  final String id;
  final String name;
  final DateTime createdAt;

  const Person({required this.id, required this.name, required this.createdAt});

  @override
  List<Object?> get props => [id, name, /* createdAt */];
}

// Equatable with collections
class Cart extends Equatable {
  final List<String> items;

  const Cart(this.items);

  @override
  List<Object> get props => [items];
}

// Nested objects
class Address extends Equatable {
  final String city;

  const Address(this.city);

  @override
  List<Object> get props => [city];
}

// Using User class above
class AppUser extends Equatable {
  final String name;
  final Address address;

  const AppUser({required this.name, required this.address});

  @override
  List<Object> get props => [name, address];
}


void main() {
  final user1 = User(id: "1", name: "John");
  final user2 = User(id: "1", name: "John");
  print(user1 == user2);


  final a = Person(id: "1", name: "John", createdAt: DateTime(2026));
  final b = Person(id: "1", name: "John", createdAt: DateTime(2030));
  print(a == b); // true, because createdAt was not part of the props

  final cart1 = Cart(["Rice", "Milk"]);
  final cart2 = Cart(["Rice", "Milk"]);
  print(cart1 == cart2);

  final cart3 = Cart(["beans", "Milk"]);
  final cart4 = Cart(["Rice", "beans"]);
  print(cart3 == cart4);

  final u1 = AppUser(name: "John", address: Address("Lagos"));
  final u2 = AppUser(name: "John", address: Address("Lagos"));

  print(u1 == u2);

}
