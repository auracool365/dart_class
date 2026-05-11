void main() {
  // stores multiple data sequentially in a contiguous part of memory
  List<int> ages1 = [55, 65, 75, 85, 95];
  print(ages1);

  // 1. Map Creation
  // Stores data as key/value pair, associating them to give more meaning
  Map<String, int> ages2 = {
    "Ade": 85,
    "Paul": 85,
    "Esther": 75,
    "John": 85,
    "Peter": 95,
    // "Peter": 100, // Can have duplicate values, but NOT duplicate keys
  };
  print(ages2);

  // Empty map
  Map<String, String> setting = {};
  print(setting);

  // map duplication
  Map<String, int> agesCopy = Map.from(ages2);
  print(agesCopy);

  // from an iterable
  List<String> fruits = ["Apple", "Mango", "Dates", "Watermelon", "Avocado"];
  Map<int, String> listMap = Map.fromIterable(
    fruits,
    key: (fruit) => fruit.length, // duplicate keys 5 at index 0, 1, 2
    value: (fruit) => fruit,
  );
  print(listMap);

  var person = Map<String, dynamic>();
  person["firstName"] = "John";
  person["lastName"] = "Doe";
  person["age"] = 100;
  person["isMale"] = true;
  print(person);

  // 2. Indexing
  print(person["firstName"]);
  print(person["age"]);

  Map<String, dynamic> products = {
    "item": "phone",
    "make": "Samsung",
    "model": "S26 Ultra",
    "isPremium": true,
    "price": 1099,
  };
  print(products);
  products["price"] = 999;
  print(products);
  print(products["color"]);
  products.putIfAbsent("color", () => "Crystal Blue");
  print(products["color"]);
  print(products);

  // Destructuring
  var {"isPremium": premiumDevice, "price": productPrice} = products;
  print('$premiumDevice the device is premium');
  print('The price is $productPrice');

  final {"make": productMake, "model": productModel} = products;
  print("The product is a $productMake $productModel");

  // Nested Map
  Map<String, Map<String, String>> countries = {
    "country1": {"name": "Nigeria", "capital": "Abuja"},
    "country2": {"name": "Denmark", "capital": "Copenhagen"},
  };
  print(countries);
  print(countries["country2"]!["capital"]);

  // iterable value
  Map<String, List<String>> animals = {
    "carnivores": ["Crocodile", "Jaguar", "Wolf", "Polar Bear"],
    "herbivores": ["Cow", "Sheep", "Deer", "Gazelle"],
  };
  print(animals);
  print(animals["carnivores"]![3]);

  // 3. Iteration
  Map<String, int> studentScores = {
    "Paul": 80,
    "John": 81,
    "Dami": 82,
    "Faith": 83,
  };

  // iterate keys
  for (String name in studentScores.keys) {
    print(name);
  }

  // iterate value
  for (int score in studentScores.values) {
    print(score);
  }

  // iterate key/value pair
  // MapEntry
  for (MapEntry<String, int> entry in studentScores.entries) {
    print("${entry.key} scored ${entry.value} in the exam");
  }

  // forEach
  studentScores.forEach((name, score) {
    print("$name scored $score");
  });

  // 4. Methods
  Map<String, dynamic> storeInventory = {
    "Laptops": {"Windows": 30, "Mac": 10},
    "pen": 60,
    "isAtFullCapacity": false,
    "electronics": ["Computers", "Radio", "Television"],
  };

  // Properties
  print(storeInventory.isEmpty);
  print(storeInventory.isNotEmpty);
  print(storeInventory.length);
  print(storeInventory.keys);
  print(storeInventory.values);

  // Methods
  storeInventory.addAll({"Power Bank": 40, "Airpods": 50});
  print(storeInventory);

  print(storeInventory.keys);
  print(storeInventory.keys.toList());

  print(storeInventory);
  storeInventory.update("pen", (currentQty) => currentQty + 40);
  print(storeInventory);
}
