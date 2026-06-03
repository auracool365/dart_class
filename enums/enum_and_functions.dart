enum TrafficLight { red, yellow, green }

enum Roles { admin, editor, visitor }

enum Resource {
  post,
  users,
  settings,
} // admin has access to all resources, editors has access to post

enum Operators { subtraction, addition, multiplication }

enum CountMode { up, down }

enum NumberSign { negative, zero, positive }

// Basic usage with switch expression
void checkTraffic(TrafficLight light) {
  var trafficMessage = switch (light) {
    TrafficLight.red => "Stop",
    TrafficLight.yellow => "Ready",
    TrafficLight.green => "Go",
  };
  print(trafficMessage);
}

// Multiple enum parameters
void checkAccess(Roles role, Resource resource) {
  if (role == Roles.admin) {
    print("${role.name} has access to all resources${resource.name}");
    return;
  }
  if (role == Roles.editor && resource == Resource.post) {
    print("${role.name} has access to ${resource.name}");
    return;
  }
  print("${role.name} is not authorized to use ${resource.name}");
}

void calculate(int num1, int num2, Operators operation) {
  if (num1 == 0 || num2 == 0) {
    print("Numbers must be greater than zero");
  }

  switch (operation) {
    case Operators.subtraction:
      print("$num1 - $num2 = ${num1 - num2}");
    case Operators.addition:
      print("$num1 + $num2 = ${num1 + num2}");
    case Operators.multiplication:
      print("$num1 x $num2 = ${num1 * num2}");
  }
}

// Passing and returning enum to and from  recursive functions
// passing to
void countDown(int num, CountMode mode) {
  if (mode == CountMode.down) {
    if (num <= 0) return; // count down base case
    print("Count Down: $num");
    countDown(num - 1, mode);
    return;
  }

  if (num > 10) return; // count up base case
  print("Count Up: $num");
  countDown(num + 1, mode);
}

// returning from
NumberSign classifyNum(int num) {
  int sum = digitsSum(num);

  // print("Sum is $sum");

  if (sum < 0) return NumberSign.negative;
  if (sum > 0) return NumberSign.positive;
  return NumberSign.zero;
}

// helper function
int digitsSum(int num) {
  if (num < 10) return num;

  return (num % 10) + digitsSum(num ~/ 10);
}

void main() {
  TrafficLight light = TrafficLight.green;
  checkTraffic(light);

  checkTraffic(TrafficLight.red);

  light = TrafficLight.yellow;
  checkTraffic(light);

  // Multiple enum argument
  checkAccess(Roles.admin, Resource.post);
  checkAccess(Roles.editor, Resource.settings);
  checkAccess(Roles.visitor, Resource.post);

  // Calculation
  calculate(6, 5, Operators.subtraction);
  calculate(6, 5, Operators.addition);
  calculate(6, 5, Operators.multiplication);

  // CountDown
  countDown(6, CountMode.down);
  countDown(6, CountMode.up);

  // returning enum from a function
  int num = 567;
  NumberSign result = classifyNum(num);
  int sum = digitsSum(num);
  print("$sum(${result.name})");

  num = -5678;
  result = classifyNum(num);
  sum = digitsSum(num);
  print("$sum(${result.name})");

  // 
}
