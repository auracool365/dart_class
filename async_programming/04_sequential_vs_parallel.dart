Future<double> fetchProductPrice(String product) {
  return Future.delayed(Duration(seconds: 1), () {
    const prices = {'Rice': 45000.0, 'Laptop': 850000.0, 'Phone': 250000.0};

    return prices[product] ?? 0;
  });
}

// Sequential Example
Future<void> checkout() async {
  print("Sequential");
  print('Starting checkout');
  Stopwatch timer = Stopwatch()..start();

  double rice = await fetchProductPrice('Rice');

  double phone = await fetchProductPrice('Phone');
  timer.stop();
  print('Rice: ₦$rice');
  print('Phone: ₦$phone');

  print("time taken: ${timer.elapsed}");
}

// Parallel Example
Future<void> loadParallel() async {
  print("\nParallel");
  Stopwatch timer = Stopwatch()..start();

  var results = await Future.wait([
    fetchProductPrice('Rice'),
    fetchProductPrice('Phone'),
  ]);

  timer.stop();

  print(results);

  print("time taken: ${timer.elapsed}");
}

Future<void> main() async {
  await checkout();

  await loadParallel();
}
