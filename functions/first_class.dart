// First-class functions: They can be used as normal values, passed to variable, used as callbacks,
// or even returned from another function.

typedef MathOperations = int Function(int, int);

String greet(userName) => "Hello $userName";

// Callbacks
void calculate(num a, num b, num Function(num, num) calculationOperation) {
  num result = calculationOperation(a, b);
  print("Result = $result");
}

// we can pass the functions as callbacks in a cleaner way using typedef(defined above)
// calculate1() is the higher-order function
int calculate1(int a, int b, MathOperations operation) {
  return operation(a, b);
}

// defining the callback function operations
int add(int a, int b) => a + b;
int modulo(int a, int b) => a % b;
int multiply(int a, int b) => a * b;

void main() {
  // Passed to a variable as a value
  String result = greet("John");
  print(result);

  // Use as callbacks
  calculate(10, 4, (a, b) => a + b);
  calculate(10, 4, (a, b) => a * b);
  calculate(10, 4, (a, b) => a - b);
  calculate(10, 4, (a, b) => a % b);
  calculate(10, 4, (a, b) => a / b);

  // typedef usage
  int calculationResult = calculate1(8, 5, modulo);
  print(calculationResult);

  calculationResult = calculate1(40, 60, add);
  print(calculationResult);

  calculationResult = calculate1(30, 15, multiply);
  print(calculationResult);
}
