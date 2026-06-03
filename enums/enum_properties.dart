// Enum has built properties. All values in the enum gets these properties by default.
enum Directions { north, south, east, west }

enum Priority { low, medium, high, critical }

void main() {
  // 1. name (string identifier of the enum value)
  print(Directions.north);
  print(Directions.north.name);

  // String dir = Directions.east; // Error, different types
  Directions dir1 = Directions.east;
  print(dir1);

  String dir2 = Directions.east.name;
  print(dir2);

  print(dir1 == dir2); // false, different types
  print(dir2 == dir2); // true, same types

  // 2. index(zero-based, similar to list)
  print(Priority.critical.index);
  print(Priority.high.index);

  print(Directions.west.index);
  print(Directions.south.index);

  // 3. value (all the enum values)
  print(Priority.values);

  // using value with the byName() (gets the enum value by taking the name as a string)
  print(Directions.values.byName("west"));

  // iterating through the enum using all 3 values
  for (Directions dir in Directions.values) {
    if (dir.name == Directions.west.name) {
      print("${dir.index} ${dir.name} - I love the Western world");
      continue;
    }
    print("${dir.index}. ${dir.name}");
  }

  // Using value with length
  print("The length of the enum is ${Directions.values.length}");

  // using value to check by index
  Directions findByIndex = Directions.values[2];
  print(findByIndex);

  int n = Directions.values.length;
  for (int i = 0; i < n; i++) {
    print("$i. ${Directions.values[i]}");
  }

  print(Priority.critical.runtimeType);
}
