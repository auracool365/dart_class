
void main() {
  // Immutability(cannot change) in Dart variables
  // const: Value must be known at compile time, and must NOT change during runtime
  const double PI = 3.15149;
  print(PI);

  // PI = 6.8; //Error
  print(PI);

  // final: Value is known during runtime, but can NOT be changed after that. It is set once
  final String city = "Lagos";
  print(city);

  // city = "Ilorin"; // Error

  final DateTime travelTime = DateTime.now();
  final DateTime footballHalftime = DateTime.now();
  print(travelTime);
  print(footballHalftime);
  
}
