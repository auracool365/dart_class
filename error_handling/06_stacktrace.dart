// Capturing the stack trace alongside the error
void innerFunction() {
  throw Exception('Something broke deep inside');
}

void middleFunction() {
  innerFunction();
}

void outerFunction() {
  middleFunction();
}

void demonstrateStackTrace() {
  try {
    outerFunction();
  } catch (e, stackTrace) {
    print('Error: $e');
    print('Stack trace:\n$stackTrace');
  }
}

// Logging pattern used in real apps
void logError(String context, Object error, StackTrace stackTrace) {
  print('ERROR LOG');
  print('  Context: $context');
  print('  Error:   $error');
  print('  Time:    ${DateTime.now()}\n');
}

void fetchUserProfile(int userId) {
  try {
    if (userId <= 0) {
      throw ArgumentError('Invalid user ID: $userId');
    }
    print('Profile fetched for user $userId');
  } catch (e, stackTrace) {
    logError('fetchUserProfile', e, stackTrace);
  }
}

void main() {
  print('Basic stack trace');
  demonstrateStackTrace();

  print('\n Real logging pattern');
  fetchUserProfile(5);
  fetchUserProfile(-1);
}
