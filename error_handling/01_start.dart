int divide(int a, int b) {
  return a ~/ b;
}

/* // Syntax(language rules) error: add() was specified to return int, but a string was returned 
int add(int a, int b) {
  return "The sum is ${a * b}";
}

/// Semantic(program meaning) error: add() should compute sum, not product
String add(int a, int b) {
  return "The sum is ${a * b}";
} */

void demonstrateDifference() {
  // Exception: recoverable, expected
  try {
    int parsed = int.parse('not a number'); // throws FormatException
    print(parsed);
  } catch (e) {
    print('Caught an Exception: $e');
  }

  // Error: usually a bug in your own code
  try {
    List<int> numbers = [1, 2, 3, 4, 5];
    print(numbers[10]); // throws RangeError — index doesn't exist
  } catch (e) {
    print('Caught an Error: $e');
  }
}

int getElement(List<int> arr, int index) {
  if (index >= arr.length) {
    print("Invalid index");
    return -1;
  }
  return arr[index];
}

void main() {
  /*  print(divide(5, 2));
  print(divide(5, 7));

  print(add(6, 7));
  print(add(6, 8)); */

  //demonstrateDifference();

  List<int> nums = [20, 45, 67, 87, 98];
  print(getElement(nums, 2));
  print(getElement(nums, 1));
  print(getElement(nums, 28));
}
