// A higher-order function is a function that 1. takes another function(called a callback) as a parameter/argument; 2. Returns
// function as a values; 3. Or does both

// usual everyday functions
// returns the specified datatype before the function name in the declaration
int add1(int a, int b) {
  return a + b;
}

// Returns nothing
void add2(int a, int b) {
  print(a + b);
}

// Higher-Order Functions(HOFs)
// 1. taking function as parameters
int calculate(int a, int b, int Function(int, int) operation) {
  int result = operation(a, b);
  return result;
}

// callbacks
int add(int x, int y) => x + y;
int multiply(int x, int y) => x * y;

// 2. Returning function as values
Function specifyIncrement(int incrementBy) {
  // anonymous function
  return (int num) => num + incrementBy;

  // named function
  /* int takeNumber(int num) => num + incrementBy;
  return takeNumber; */
}

// 3. Doing both
String intro(String entity, String Function(String) entityIntroduction) {
  return entityIntroduction(entity);
}

String personIntro(String personName) => "Hello, My name is $personName";
String objectIntro(String objectName) => "That is a $objectName";

void main() {
  print(add1(4, 5));
  add2(5, 6);

  int result = calculate(10, 9, add);
  print(result);

  result = calculate(10, 9, multiply);
  print(result);

  var result2 = specifyIncrement(10);
  var result3 = specifyIncrement(20);

  print(result2(200));
  print(result3(400));

  String introduction = intro("Cornelius", personIntro);
  print(introduction);

  introduction = intro("Chair", objectIntro);
  print(introduction);
}
