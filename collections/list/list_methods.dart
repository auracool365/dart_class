void main() {
  List<String> countries = ["Nigeria", "Albania", "Belgium", "Chile"];
  print(countries);

  countries.add("Denmark"); // Adds a single element to the end of the list
  print(countries);

  // Adds multiple elements to the end of the list through the use of an iterable
  countries.addAll(["Egypt", "Faroe Islands", "Gambia"]);
  print(countries);

  countries[6] = "Fiji"; // replaces the element at the given index

  // insert at specified index, shifts existing elements forward, doesn't replace it
  countries.insert(6, "Finland");
  print(countries);

  // inserts multiple items at a specified index, and shift existing elements forward
  countries.insertAll(2, ["Algeria", "Armenia", "Czech Republic"]);
  print(countries);

  // Remove element by name
  countries.remove("Algeria");
  print(countries);

  // remove by index
  countries.removeAt(4);
  print(countries);

  countries.removeLast();
  print(countries);

  /* countries.clear();
  print(countries); */

  print(countries.indexOf("Czech Republic"));
  print(countries.indexOf("China"));

  print(countries.indexWhere((country) => country.startsWith("Ch")));

  String word = "racecar";
  int left = 0;
  int right = word.length - 1;

  while (left != right) {
    if (word[left] != word[right]) {
      print('$word is not a palindrome');
      return;
    }
    left++;
    right--;
  }
  print("$word is a palindrome");
}
