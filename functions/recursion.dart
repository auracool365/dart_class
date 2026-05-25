/* Recursion is the process of a function calling itself inside its own body. The repetitive call stops when it reaches a base case*/

// 1. increment
int increment(int num) {
  // base case: determines point of recursive call termination
  if (num == 10) {
    return num;
  }
  num++; // 6, 7, 8
  return increment(num); // Recursive call itself
}

// 2. factorial
int factorial(int num) {
  // base case
  if (num == 1) {
    return num;
  }
  // recursive call
  return num * factorial(num - 1);
}

// 3. Multiplication by repeated addition
// loop version
int multiply(int a, int b) {
  int product = 0;
  for (int i = 1; i <= b; i++) {
    product += a;
  }
  return product;
}

// Recursive version
int recursiveMultiply(int a, int b) {
  // base cases
  if (a == 0 || b == 0) {
    return 0;
  }
  if (b == 1) {
    return a;
  }
  // recursive call
  return a + recursiveMultiply(a, b - 1);
}

// 4. concatenate Strings in a list
String concatenate(List words) {
  if (words.isEmpty) { // Base case
    return "";
  }
  // Recursive call
  return words.first + " " + concatenate(words.sublist(1));
}

void main() {
  int result = increment(5);
  print(result);

  result = factorial(10);
  print(result);

  print(multiply(6, 7));

  print(recursiveMultiply(8, 10));

  List<String> sentence = ["My", "Name", "Is", "Cornelius"];
  print(sentence);

  print(concatenate(sentence));
}
