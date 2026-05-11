import 'dart:collection';

void main() {
  /*   List<int> nums = [1, 2, 3, 2, 2]; // duplicate elements allowed
  print(nums);

  // Unique keys(duplicates override), duplicate value allowed
  Map<int, String> nums2 = {1: "one", 2: "two", 3: "two"};
  print(nums2); */

  // Set is a unordered collection of unique items
  // 1. Creation
  Set<int> nums = {1, 2, 3, 4, 3, 2};
  print(nums);

  Set<int> emptySet = {};
  print(emptySet);

  // var mySet = {}; // inferred as a map by the compiler

  // empty sets creation
  var mySet = <int>{};
  print(mySet);

  var mySet1 = Set<String>();
  print(mySet1);

  // create from list
  List<String> myList = ["Hi", "Hello", "Hey", "Hey", "Hi", "hi"];
  print(myList);

  Set<String> mySet2 = myList.toSet();
  print(mySet2);

  Set<String> mySet3 = Set.from(["Paul", "Sam", "Dave", "Sam", "Dave"]);
  print(mySet3);

  // Spread operator
  Set<String> x = {"Cat", "Dog", "Parrot"};
  Set<String> y = {"Cat", "Pig", "Python", "Parrot", "Bunny"};
  Set<String> z = {...x, ...y};
  print(z);

  // If unordered implementation output is truly needed, use HashSet()
  var test = HashSet<String>();
  test.add("Rice");
  test.addAll(["Yam", "Garri", "Rice", "Beans", "Yam"]);
  print(test);

  // Indexing: Sets do not have index like lists
  Set<String> countries = {
    "Albania",
    "Algeria",
    "Armenia",
    "Azerbaijan",
    "Albania",
    "Armenia",
  };
  print(countries);
  // print(countries[1]);
  print(countries.contains("Algeria"));
  print(countries.contains("algeria"));

  print(countries.last);
  print(countries.first);

  print(countries.length);

  myList = countries.toList();
  print(myList);
  print(myList[1]); // O(1)

  print(countries.elementAt(1)); // slower than actual index lookup

  // Write a program that removes duplicates from an array
  var myVar = ["Apple", "Banana", "Dates", "Apple", "Watermelon"];
  print(myVar);

  bool hasDuplicates = myVar.length != myVar.toSet().length;
  print("Has duplicates? $hasDuplicates");

  myVar = myVar.toSet().toList();
  print(myVar);
}
