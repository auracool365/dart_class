// ignore_for_file: unnecessary_type_check

void main() {
  // Type test operators allows us to type cast and check if a value is of a certain type

  // as
  Object var1 = "Hello";
  print(var1); // type object

  var1 = var1 as String; // type cast to String
  print(var1); // type String

  // is
  int age = 100;
  print(age is String); // check if age is of String type

  bool isStudent = true;
  print(isStudent is bool);

  // is! (is not)
  print(age is! String);

  print(isStudent is! double);
}
