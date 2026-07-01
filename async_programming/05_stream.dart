//   Future<String>: delivers ONE string, then done
//   Stream<String>: delivers MANY strings over time, then done
//
// Real Flutter examples of Streams:
//   Firestore .snapshots(): stream of document updates
//   WebSocket messages: stream of incoming messages
//   Location updates: stream of GPS coordinates
//   File download progress: stream of progress values

// fetching a user from a database (takes 1 second)
Future<String> fetchUsername(int userId) {
  return Future.delayed(Duration(seconds: 1), () {
    // Simulated database lookup
    Map<int, String> db = {1: 'Dami', 2: 'Faith', 3: 'Mariam'};
    return db[userId] ?? 'Unknown';
  });
}

// Stream.fromIterable: emits each item in a list
Stream<String> namesStream = Stream.fromIterable(['Alice', 'Bob', 'Carol']);

// Stream.fromFuture: wraps a single Future as a one-item Stream
Stream<String> singleStream = Stream.fromFuture(fetchUsername(1));

// Stream.periodic: emits a value on a timer (like a heartbeat)
Stream<int> ticker = Stream.periodic(
  Duration(seconds: 1),
  (tickCount) => tickCount,
);

// async* — generate a stream with a function. yield sends one value into the stream
// The function pauses after each yield and resumes when the listener is ready for the next value
Stream<String> countdownStream(int from) async* {
  for (int i = from; i >= 0; i--) {
    await Future.delayed(Duration(seconds: 1)); // wait 1 second
    yield i.toString(); // send the value
  }
  yield 'Take off!'; // final value
}

Stream<double> priceUpdates(String product) async* {
  double price = 1000.0;
  for (int i = 0; i < 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    price += (i % 2 == 0 ? 50.0 : -20.0); // price fluctuates
    yield price;
  }
  
}

// Listening to a Stream
// listen(): the fundamental way to consume a stream
void listenToStream() {
  namesStream.listen(
    (name) => print('Received: $name'), // onData
    onError: (e) => print('Error: $e'), // onError
    onDone: () => print('Stream done'), // onDone
  );
}

// await for: the async/await way to consume a stream
Future<void> listenWithAwaitFor() async {
  print('Countdown:\n');

  await for (String value in countdownStream(5)) {
    print(value);
  }

  print('Countdown complete');
}

// Stream methods: just like List methods
Future<void> streamOperations() async {
  Stream<int> numbers = Stream.fromIterable([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);

  // map: transform each event
  Stream<int> doubled = numbers.map((n) => n * 2);
  print('Doubled: ${await doubled.toList()}');

  // where: filter events
  Stream<int> evensOnly = Stream.fromIterable([
    1,
    2,
    3,
    4,
    5,
    6,
  ]).where((n) => n.isEven);
  print('Evens only: ${await evensOnly.toList()}');

  // take: only first 3 events
  Stream<int> firstThree = Stream.fromIterable([1, 2, 3, 4, 5]).take(3);
  print('First three: ${await firstThree.toList()}');

  // toList: collect all stream events into a list
  List<int> collected = await Stream.fromIterable([
    1,
    2,
    3,
    4,
    5,
  ]).where((n) => n.isOdd).map((n) => n * 10).toList();

  print('Collected (odd x10): $collected');

  // first, last, length
  int first = await Stream.fromIterable([10, 20, 30]).first;
  print(first); // 10
}

// Flutter-like example simulating Firestore
// In Flutter, Firestore returns a Stream<DocumentSnapshot>. This simulates that pattern with a stream of order status updates
Stream<String> orderStatusStream(String orderId) async* {
  await Future.delayed(Duration(seconds: 1));
  yield 'Order $orderId: Placed';

  await Future.delayed(Duration(seconds: 2));
  yield 'Order $orderId: Confirmed';

  await Future.delayed(Duration(seconds: 2));
  yield 'Order $orderId: Out for delivery';

  await Future.delayed(Duration(seconds: 3));
  yield 'Order $orderId: Delivered';
}

Future<void> trackOrder() async {
  print('Tracking order ORD-001:\n');

  await for (String status in orderStatusStream('ORD-001')) {
    print(status);
  }

  print('\nOrder tracking complete');
}

Future<void> main() async { 
  print('fetchUsername (Future):');
  String username = await fetchUsername(2);
  print('Fetched username: $username\n');

  print('namesStream (listen):');
  listenToStream();
  // give the listener time to finish since listen() doesn't block
  await Future.delayed(Duration(milliseconds: 100));
  print('');

  print('singleStream (Stream.fromFuture): ');
  await for (String name in singleStream) {
    print('From future-stream: $name');
  }
  print('');

  print('ticker (Stream.periodic, limited with take): ');
  await for (int tick in ticker.take(3)) {
    print('Tick: $tick');
  }
  print('');

  print(' countdownStream (await for) ');
  await listenWithAwaitFor();
  print('');

  print('priceUpdates: ');
  await for (double price in priceUpdates('Widget')) {
    print('Price: \$${price.toStringAsFixed(2)}');
  }
  print('');

  print('streamOperations (map, where, take, toList, first): ');
  await streamOperations();
  print('');

  print('orderStatusStream (simulated Firestore): ');
  await trackOrder();
}
