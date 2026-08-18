// A named parameter with a non-nullable type (String name, not String? name) must either have a default value or be marked 
// required, Dart won't let a non-nullable parameter silently be omitted, since that would let a caller accidentally skip providing
// a value that's supposed to always exist.
class Dish {
  final String name; // non-nullable, must always have a real value
  final String? subtitle; // nullable, having a value is optional

  Dish({required this.name, this.subtitle});
}

void main() {
  Dish jollof = Dish(
    name: 'Jollof Rice',
  ); // fine,  subtitle omitted, defaults to null
  print(jollof.name);
  print(jollof.subtitle); // null

  // Dish friedRice = Dish(); // I will uncomment: fails to compile, name is required
}