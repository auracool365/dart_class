void main() {
  String userName = "John";
  print(userName);

  // 1. List creation syntaxes
  // List <datatype> nameOfList = [...elements];
  List<String> fruits = ["Apple", "Mango", "Watermelon", "Avocado"];
  fruits.add("Dates");
  print(fruits);

  // filled()
  List<int> nums = List.filled(5, 0);
  print(nums);

  nums[0] = 84;
  nums[1] = 85;
  nums[2] = 86;
  nums[3] = 87;
  nums[4] = 88;
  print(nums);

  // Empty list
  List<String> animals = [];
  print(animals);

  // Generated list
  List<int> count = List.generate(5, (num) => num + 1);
  print(count);

  List<int> square = List.generate(6, (num) => num * num);
  print(square);

  List<bool> oddOrEven = List.generate(10, (num) => num % 2 == 0);
  print(oddOrEven);

  List<String> test = List.generate(
    10,
    (num) => num % 2 == 0 ? "$num is even" : "$num is odd",
  );
  print(test);

  // Spread operator
  List<String> protein = ["Meat", "Eggs", "Dairy products", "Fish"];
  List<String> carbohydrate = ["Cassava", "Yam", "Potato", "Rice"];
  List<String> foods = [...carbohydrate, ...protein, "Pizza"];
  print(carbohydrate);
  print(protein);
  print(foods);

  // Conditional addition
  bool isOdd = true;
  List<int> odd = [1, 5, 47, if (isOdd) 51];
  print(odd);

  // 2. List Indexing
  List<String> colors = ["Blue", "Yellow", "Red", "Purple", "Pink"];
  print(colors);
  // get array element by index
  print(colors[1]);
  print(colors[3]);

  int index = 29;
  // safe index check
  if (index < colors.length) {
    print(colors[index]);
  } else {
    print(
      "You are not within the range of the list! try a lower number as index",
    );
  }

  // modify a list element using the index
  colors[3] = "Orange";
  print(colors);

  // Negative indexing
  index = colors.length - 5;
  print(colors[index]);

  // 3. List Iteration
  List<String> languages = [
    "C++",
    "Golang",
    "Lua",
    "Zig",
    "Dart",
    "Javascript",
  ];

  String favorite = "Rust";

  for (int i = 0; i < languages.length; i++) {
    print('$i. ${languages[i]} is at number ${i + 1}');
    if (languages[i] == favorite) {
      print("I love $favorite");
    } else {
      print("My favorite language($favorite) is not in the List");
    }
  }

  var names = ["Paul", "Ade", "John", "Peter", "James"];
  print(names);

  var items = ["Hello", 200, 4.56, true];
  print(items);

  String friend = "James";

  for (var name in names) {
    if (name == friend) {
      print("$name is my friend");
      continue;
    }
    print(name);
  }
}
