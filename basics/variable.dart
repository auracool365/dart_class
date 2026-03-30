String fruit = "Orange";
// String pet; //Error
late String pet;
// Late is used when you do not know the value that the variable will hold during declaration, but value must
// be initialized later before variable use
void main() {
  // print(pet); // Error: late variable must be initialized before use.

  pet = "Dog";
  print(pet);

  // Type or var or dynamic, variable name, = value
  var num1; // Variable declaration
  var num2 = 10; // variable Definition and assignment
  num1 = 20; // variable assignment
  num2 = 30; // variable reassignment
  print(num1);
  print(num2);

  // 1. Explicit variable definition
  String userName = "John"; // Camel case
  // String user_name = "Sam"; // Snake case
  // String UserName = "Solomon"; // Pascal case

  print("""$userName is in his room, 
  when $userName heard a loud bang outside, 
  so $userName ran outside, 
  then $userName return to his room""");

  int userAge = 100;
  double userHeight = 6.0;
  bool isMale = true;

  print(userName);
  print(userAge);
  print(userHeight);
  print(isMale);

  // 2. Implicit variable definition. (using variable declaration keywords var and dynamic)
  // var allow automatic data type detection, but when the type has been established, it must not change during runtime
  var price = 1100;
  var product = "petrol";
  print(price);
  print(product);

  price = 500;
  product = "fab biscuit";
  print(price);
  print(product);

  // price = 60.5 // Error
  // product = true // Error

  // dynamic also allows automatic type detection, but also allows the type to change during runtime(Use only when necessary)
  dynamic myVar = 100;
  print(myVar);

  myVar = "London";
  print(myVar);

  myVar = true;
  print(myVar);

  // Object variable declaration
  Object food = "Rice";
  String food2 = "Beans";

  print(food);
  print(food2);

  // print(food.length); // Error
  print(food2.length);
}
