// check if a list has duplicates and print out the duplicates
void findDuplicates(List<dynamic> nums) {
  List<dynamic> uniqueList = [];
  List<dynamic> duplicateList = [];
  bool hasDuplicates = nums.length != nums.toSet().length;
  if (hasDuplicates) {
    print("$hasDuplicates: the list has duplicates");
  } else {
    print("$hasDuplicates: the list has no duplicates");
  }
  for (dynamic num in nums) {
    if (uniqueList.contains(num)) {
      duplicateList.add(num);
    }
    uniqueList.add(num);
  }
  if (duplicateList.length > 0) {
    print("Duplicate elements are: $duplicateList");
    return;
  }
}

// Sum of elements at even index
void findEvenIndexSum(List<int> nums) {
  int sum = 0;
  for (int i = 0; i < nums.length; i += 2) {
    sum += nums[i];
  }
  print("The sum of the even indexed element in the list is $sum");
}

// Use a closure to track scores
Function trackScores() {
  int score = 0;
  return () {
    print("Your score is $score");
    score += 5;
    if (score >= 25) {
      print("Congratulations, you crossed the $score mark threshold!");
    }
  };
}

void main() {
  // duplicate int list
/*   List<int> ages = [55, 65, 75, 85, 95, 55, 75];
  findDuplicates(ages);

  // duplicate double list
  List<double> heights = [5.5, 6.5, 7.5, 8.5, 9.5, 5.5, 7.5];
  findDuplicates(heights);

  // duplicate String list
  findDuplicates(["Sam", "Paul", "John", "Sam", "John"]);

  // mixed type list
  List<dynamic> myList = ["Hi", 10, true, 4.56, 10, true, "Hi"];
  findDuplicates(myList);

  // non-duplicate lists
  findDuplicates(["Hi", "Hello", "Bye"]);
  findDuplicates([1, 2, 3, 4, 5]);

  findEvenIndexSum([1, 2, 3, 4, 5]); */

  // closure
  var track = trackScores();
  track();
  track();
  track();
  track();
  track();
}
