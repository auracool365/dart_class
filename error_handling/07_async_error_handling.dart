// Simulated async operations that can fail
Future<String> fetchUserName(int id) async {
  await Future.delayed(Duration(seconds: 1));
  if (id <= 0) {
    throw Exception('User ID must be positive');
  }
  return 'User_$id';
}

Stream<int> riskyCountdown() async* {
  for (int i = 5; i >= 0; i--) {
    if (i == 2) {
      throw Exception('Countdown malfunction at $i');
    }
    yield i;
    await Future.delayed(Duration(milliseconds: 500));
  }
}

// try/catch with await: the modern, clean way
Future<void> loadUserModern(int id) async {
  try {
    String name = await fetchUserName(id);
    print('Loaded: $name');
  } catch (e) {
    print('Failed to load user: $e');
  }
}

// catchError on a Future chain: the older style
void loadUserOldStyle(int id) {
  fetchUserName(id)
      .then((name) => print('Loaded: $name'))
      .catchError((e) => print('Failed to load user: $e'));
}

// Handling errors from a Stream
void listenToCountdown() {
  riskyCountdown().listen(
    (value) => print('Tick: $value'),
    onError: (e) => print('Stream error: $e'),
    onDone: () => print('Countdown stream finished'),
  );
}

// try/catch with await for
Future<void> listenToCountdownModern() async {
  try {
    await for (int value in riskyCountdown()) {
      print('Tick: $value');
    }
  } catch (e) {
    print('Countdown failed: $e');
  }
}

Future<void> main() async {
  print('Modern syntax async error handling');
  await loadUserModern(5);
  await loadUserModern(-1);

  print('\nOlder syntax callback style');
  loadUserOldStyle(3);
  await Future.delayed(Duration(seconds: 2));

  print('\n Stream error handling');
  await listenToCountdownModern();
}
