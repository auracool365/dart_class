import 'dart:io';

void main() {
  int score = 80;

  // Without default for a fallback
  switch (score) {
    case 100:
      print("Excellent");
  }

  // Default still gives something to the user even if the case doesn't match
  switch (score) {
    case 100:
      print("Excellent");
    default:
      print("You are below the threshold of 100");
  }

  // Checking days of the week
  stdout.write("enter the day you want check as a number(1 - 7): ");
  int day = int.parse(stdin.readLineSync()!);

  switch (day) {
    // if 2 == 2
    case 1:
      print("The day is sunday");
    case 2:
      print("The day is monday");
    case 3:
      print("The day is tuesday");
    case 4:
      print("The day is wednesday");
    case 5:
      print("The day is thursday");
    case 6:
      print("The day is friday");
    case 7:
      print("The day is monday");
    default:
      print("That is not a day of the week");
  }

  // Keywords (break and when)
  // break: This is just legacy syntax, not necessary in modern dart
  stdout.write("Which screen do you want to navigate to?: ");
  String? screen = stdin.readLineSync()!;

  switch (screen.toLowerCase()) {
    case "home":
      print("Welcome to the home screen");
      break;
    case "settings":
      print("Welcome to the settings screen");
      break;
    case "stats":
      print("Welcome to the stats screen");
      break;
    case "favorites":
      print("Welcome to the favorites screen");
      break;
  }

  // when
  stdout.write("Welcome to Jaiyelo Bar\nEnter you age for verification: ");
  int age = int.parse(stdin.readLineSync()!);

  switch (age) {
    case int x when x >= 18:
      print("at $age you are old enough to drink🍻");
    case int x when x < 18 && x > 0:
      print("at $age you are NOT old enough to drink🫠");

    default:
      print("You dey whine? what kind of age is that?😡");
  }

  switch (age) {
    case int num when num < 0:
      print("Omo o lo far oo😒");
    case int num when num % 2 == 0:
      print("Your age is an even number");
    default:
      print("Your age is an odd number");
  }

  // Stacking case
  String animal = "Cougar";

  switch (animal) {
    case "Lion":
    case "Tiger":
    case "Fox":
    case "Hyena":
      print('$animal is a carnivore');
      break; // helps with more clarity not functionality
    case "Cow":
    case "Goat":
    case "Sheep":
    case "Ibex":
      print('$animal is a herbivore');
      break;
    default:
      print('I do not recognize $animal');
  }

  // Switch Expressions
  String grade = "a";

  var result = switch (grade.toUpperCase()) {
    "A" => "Excellent",
    "B" => "Very Good",
    "C" => "Average",
    "D" => "Pass",
    "E" => "Poor",
    "F" => "Fail",
    _ => "Invalid grade",
  };
  print(result);
}
