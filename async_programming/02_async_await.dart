/*async + await
Rules
await only works inside async
async functions return Future*/

Future<double> fetchProductPrice(String product) {
  return Future.delayed(Duration(seconds: 1), () {
    const prices = {'Rice': 45000.0, 'Laptop': 850000.0, 'Phone': 250000.0};

    return prices[product] ?? 0;
  });
}

Future<String> fetchUsername() {
  return Future.delayed(Duration(seconds: 2), () => 'Faith');
}

// without await
Future<void> greet() async {
  var name = fetchUsername();

  print("Hi $name");
}

// With await
Future<void> greet1() async {
  String name = await fetchUsername();

  print('Hello $name');
}

// Multiple awaits
Future<void> checkout() async {
  print('Starting checkout');

  double rice = await fetchProductPrice('Rice');

  double phone = await fetchProductPrice('Phone');

  print('Rice: ₦$rice');
  print('Phone: ₦$phone');
}

Future<void> main() async {
  await greet();

  await greet1();

  await checkout();
}
