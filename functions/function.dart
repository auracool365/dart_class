void greet() {
  print("Hello");
}

void add() {
  print(5 + 5);
}

// No flexibility, solution is to use parameters: functionName(parameter)
void greetUser(String userName) {
  //print("${userName.length <= 5 ? "Hello" : "Hi"} $userName");
  if (userName.length <= 5) {
    print("Hello $userName");
  } else {
    print("hi $userName");
  }
}

void addNum(int x, int y) {
  print(x + y);
}

void greetNames(List<String> names) {
  for (int i = 0; i < names.length; i++) {
    greetUser(names[i]);
  }
}

void findSum(List<int> nums) {
  int sum = 0;
  for (int num in nums) {
    sum += num;
  }
  print("The sum of the element in the list is $sum");
}

void findOddIndexSum(List<int> nums) {
  int sum = 0;
  /* for (int i = 0; i < nums.length; i++) {
    if (i % 2 != 0) {
      sum += nums[i];
    }
  } */
  for (int i = 1; i < nums.length; i += 2) {
    sum += nums[i];
  }
  print("The sum of the odd indexed element in the list is $sum");
}

// Using return keyword
int multiply(int x, int y) {
  return x * y;
}

String fullName(String firstName, String lastName) {
  return "$firstName $lastName";
}

// Write a function that returns the largest element and its index in a list of integers
int? findLargest(List<int> nums) {
  if (nums.isEmpty) return null;

  int largestElement = nums[0];

  for (int i = 0; i < nums.length; i++) {
    // i = index, nums[i] = element
    if (nums[i] > largestElement) {
      largestElement = nums[i];
    }
  }

  return largestElement;
}

void findLargestWithIndex(List<int> nums) {
  if (nums.isEmpty) {
    print("The list does not contain any element");
    return;
  }

  int largestElement = nums[0];
  int index = 0;

  for (int i = 0; i < nums.length; i++) {
    // i = index, nums[i] = element
    if (nums[i] > largestElement) {
      largestElement = nums[i];
      index = i;
    }
  }

  print("The largest element in the list is $largestElement at index $index");
}

void main() {
  /* add();
  greet();

  greetUser("Cornelius");
  greetUser("John");
  greetUser("Dami");
  greetUser("Mr. Femi");

  addNum(5, 6);
  addNum(15, 6);
  addNum(5, 60);

  List<String> names = ["Paul", "Damilola", "Ade", "Faith", "Olatunji"];
  print(names);

  greetNames(names);

  List<int> ages1 = [55, 65, 75, 85, 95, 55, 75];
  findSum(ages1);
  findSum([4, 5, 6, 7, 8, 9, 19]);

  findOddIndexSum(ages1);
  findOddIndexSum([4, 5, 6, 7, 8, 9, 19]); */

  // return keyword
  int? result = multiply(3, 4);
  print("The product is $result");

  print(fullName("John", "Doe"));

  List<int> numbers = [75, 65, 76, 87, 95, 88, 87, 91];

  result = findLargest(numbers);
  if (!numbers.isEmpty) {
    print(numbers);
    print("the largest element in the list is $result");
  } else {
    print("The list is empty");
  }

  findLargestWithIndex(numbers);
}
