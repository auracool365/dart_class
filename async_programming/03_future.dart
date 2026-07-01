/* 
Future: A Future<T> is an object that represents a single value that does not exist yet but will exist exactly 
once at some point in the future.

A Future<T> means:
“I don't have the value now, but I will later.”
*/

// returns Future<String> not String
Future<String> fetchUsername() {
  return Future.delayed(Duration(seconds: 1), () => "Mariam");
}

// Real Example Simulate API
Future<double> fetchProductPrice(String product) {
  return Future.delayed(Duration(seconds: 2), () {
    const prices = {'Rice': 45000.0, 'Laptop': 850000.0, 'Phone': 250000.0};

    return prices[product] ?? 0;
  });
}

Future<void> main() async {
  // Old .then syntax
  fetchUsername().then((name) {
    print(name);
  });

  // Modern syntax
  String name = await fetchUsername();
  print(name);

  // products
  double price = await fetchProductPrice('Laptop');

  print('₦$price');

  print("Other things in the program");
}
