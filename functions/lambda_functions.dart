// Lambda functions(aka anonymous function) these are one time use functions that have no name, they are
// used for one-time tasks. to extend their functionality, they can be assigned to variables to be used
// elsewhere

// Classwork
// Write a function that count the number of occurrences of elements in a list
void findOccurrences(List<dynamic> arr) {
  Map<dynamic, int> occurrence = {};

  for (var element in arr) {
    occurrence[element] = (occurrence[element] ?? 0) + 1;
  }

  occurrence.forEach((key, value) {
    // The lambda
    print("$key is found ${value == 1 ? "Once" : "$value times"}");
  });
}

void main() {
  var sum = (int x, int y) {
    return x + y;
  };
  print(sum(4, 6));

  List<int> nums = [1, 2, 3, 4, 5, 6, 2, 2, 3];
  // lambda arrow function
  var num1 = nums
    .map((num) => num % 2 == 0)
    .toList();

  print(num1);

  nums.forEach((num) {
    print(num);
  });

  // Classwork correction
  List<String> animals = ["Cow", "Cat", "Dog", "Cat", "Hen", "Cow", "Cat"];
  findOccurrences(animals);

  findOccurrences(nums);
}
