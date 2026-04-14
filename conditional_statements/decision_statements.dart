import 'dart:io';

void main() {
  /*  // if
  int numOfPeople = 8;
  // if(condition){body or instruction to be executed}
  if (numOfPeople >= 10) {
    print("Hi Everyone");
  }

  // if - else
  stdout.write("Enter you name: ");
  String? userName = stdin.readLineSync();

  stdout.write("Hi $userName \nEnter your age: ");
  String? userAge = stdin.readLineSync()!;

  int votingAge = 18;

  if (int.parse(userAge) >= votingAge) {
    print("Congratulations $userName! You are eligible to vote");
  } else {
    print("Sorry $userName, You are not old enough to vote 🫠");
  }

  stdout.write("Enter you name: ");
  String? studentName = stdin.readLineSync()!;

  if (studentName.length <= 5) {
    print("Hello $studentName");
  } else {
    print("Hi $studentName");
  }

  // if-else if - else
  stdout.write("Enter first number: ");
  double? num1 = double.parse(stdin.readLineSync()!);

  stdout.write("Enter second number: ");
  double? num2 = double.parse(stdin.readLineSync()!);

  print("Available Arithmetic Operations");
  print("1. Add(+)\n2. Subtraction(-)\n3. Division(/)\n4. Multiplication(x)");

  stdout.write("Select the operation you want to perform(enter symbol): ");
  String? operation = stdin.readLineSync()!;
  double result;

  if (operation == "-") {
    result = num1 - num2;
  } else if (operation == "/") {
    if (num1 == 0 || num2 == 0) {
      print("Can't divide by zero");
      return;
    }
    result = num1 / num2;
  } else if (operation == "+") {
    result = num1 + num2;
  } else {
    result = num1 * num2;
  }

  print("result ($operation)operation = $result"); */

  stdout.write("Enter student's score: ");
  int score = int.parse(stdin.readLineSync()!);

  if (score > 100 || score < 0) {
    print("Invalid score, enter something reasonable");
    return;
  }

  if (score >= 80 && score <= 100) {
    print("A - Excellent job");
  } else if (score >= 70 && score <= 80) {
    print("B - Good job");
  } else if (score >= 60 && score <= 70) {
    print("C - Average performance");
  } else if (score >= 50 && score <= 60) {
    print("D - You have a lot of work to do");
  } else if (score >= 40 && score <= 50) {
    print("E - You barely escaped");
  } else {
    print("F - You failed");
  }
}
