void main() {
  /*   // 1. Explicit type casting
  Object userName = "John";
  Object PI = "3.14159";
  Object numberOfFans = "4";
  print(userName);
  print(PI);
  print(numberOfFans);

  // Error: Object parent class in dart, have no access to properties and methods of child classes
  // print(userName.length);
  // print(PI.ceil());
  // print(numberOfFans.isEven);

  // Type casted to their specific types, for access to their methods and properties
  userName = userName as String;
  PI = PI as double;
  numberOfFans = numberOfFans as int;

  // Works after type casting
  print(userName.length);
  print(PI.ceil());
  print(numberOfFans.isEven);

  // dynamic
  dynamic fuelPrice = 1_300;
  print(fuelPrice);

  print(fuelPrice.isOdd); // Works, but very unsafe

  fuelPrice = fuelPrice as int; // Type casted
  print(fuelPrice.isOdd); // works, and safe because of the type casting

  // 2. Implicit type casting
  var userCourse = "Mobile app development";
  print(userCourse);
  print(userCourse.length);

  var userAge = 100;
  print(userAge);
  print(userAge.isOdd);

  // print(userCourse.isOdd); // Error
  // print(userAge.length); // Error

  // Type casting methods(falls under explicit type casting)
  // int.parse(): converts String to int
  String test1 = '3';
  String test2 = '2';
  print(test1 + test2); // 32
  print(int.parse(test1) + int.parse(test2));

  // toString(): converts numeric types to String
  int num1 = 10;
  int num2 = 11;
  print(num1);
  print(num2);
  print("As int: ${num1 + num2}");

  String convertedNum1 = num1.toString();
  String convertedNum2 = num2.toString();
  print(convertedNum1);
  print(convertedNum2);

  print("As String: ${convertedNum1 + convertedNum2}");

  // double.parse(): converts from String to double
  String rate1 = "4.5";
  String rate2 = "4.6";
  print(rate1);
  print(rate2);
  print("$rate1 + $rate2 = ${rate1 + rate2} (as String)");

  double actualRate1 = double.parse(rate1);
  double actualRate2 = double.parse(rate2);
  print(actualRate1);
  print(actualRate2);
  print(
    "$actualRate2 + $actualRate2 = ${actualRate1 + actualRate2} (as double)",
  ); */

  // typecasting int type to double
  double price = 60.1;
  int priceInt = 60;
  print(price + priceInt); // implicit priceInt typecase from int to double

  double var1 = 9.20;
  int var2 = var1.toInt(); // converts the double to int
  print(var2);

  double var3 = 10.7;
  print(var3.truncate()); // Removes the decimal 

  print(price.ceil()); // Rounds up to nearest largest whole number
  print(price.floor()); // Rounds to the nearest smallest whole number
  print(var3.round()); // rounds to the nearest whole number e.g 4.3 = 4, 4.6 = 5
}
