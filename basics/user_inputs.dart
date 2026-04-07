import 'dart:io';

void main() {
  /*stdout.write("Enter your name: ");
  String? userName = stdin.readLineSync();

  stdout.write("Enter your age: ");
  String? userAge = stdin.readLineSync();

  print("My name is $userName and I am $userAge years old");*/

  /* stdout.write("Enter first number: ");
  String? x = stdin.readLineSync()!; // ? = variable is nullable, ! = null check for the operation
  int xInt = int.parse(x);

  stdout.write("Enter second number: ");
  String? y = stdin.readLineSync()!;
  int yInt = int.parse(y);

  print(xInt + yInt); */

  /* stdout.write("Enter first number: ");
  dynamic num1 = stdin.readLineSync();

  stdout.write("Enter second number: ");
  dynamic num2 = stdin.readLineSync();

  print(num1);
  print(num2);
  print(num1 / num2); // Error during runtime */

  stdout.write("Enter first number: ");
  var num1 = stdin.readLineSync()!;

  stdout.write("Enter second number: ");
  var num2 = stdin.readLineSync()!;

  print(num1);
  print(num2);
  double result = int.parse(num1) / int.parse(num2);
  print(result.ceil());
}
