// Custom exceptions
class EmptyFieldException implements Exception {
  final String field;
  EmptyFieldException(this.field);
  @override
  String toString() => '$field cannot be empty';
}

class InvalidCredentialsException implements Exception {
  @override
  String toString() => 'Incorrect username or password';
}

class AccountLockedException implements Exception {
  final int attemptsLeft;
  AccountLockedException(this.attemptsLeft);
  @override
  String toString() => attemptsLeft > 0
      ? 'Account locked. $attemptsLeft attempts remaining'
      : 'Account permanently locked. Contact support';
}

// backend
const String correctUsername = 'admin';
const String correctPassword = 'pass1234';
int failedAttempts = 0;

Future<String> login(String username, String password) async {
  await Future.delayed(Duration(milliseconds: 800)); // simulate network

  if (username.trim().isEmpty) {
    throw EmptyFieldException('Username');
  }
  if (password.trim().isEmpty) {
    throw EmptyFieldException('Password');
  }

  if (failedAttempts >= 3) {
    throw AccountLockedException(0);
  }

  if (username != correctUsername || password != correctPassword) {
    failedAttempts++;
    if (failedAttempts >= 3) {
      throw AccountLockedException(0);
    }
    throw InvalidCredentialsException();
  }

  failedAttempts = 0;
  return 'Welcome, $username!';
}

// Function that handles all error cases
Future<void> attemptLogin(String username, String password) async {
  print('Logging in as "$username"...');

  try {
    String result = await login(username, password);
    print('$result');
  } on EmptyFieldException catch (e) {
    print('Validation error: $e');
  } on AccountLockedException catch (e) {
    print('$e');
  } on InvalidCredentialsException catch (e) {
    print('$e (${3 - failedAttempts} attempts left)');
  } catch (e, stackTrace) {
    // Catches anything unexpected: logged with full trace
    print('Unexpected error: $e');
    print('Stack trace:\n$stackTrace');
  } finally {
    print('Login attempt finished.\n');
  }
}

Future<void> main() async {
  await attemptLogin('', 'pass1234');
  await attemptLogin('admin', '');
  await attemptLogin('admin', 'wrongpass');
  await attemptLogin('admin', 'wrongpass');
  await attemptLogin('admin', 'wrongpass');
  await attemptLogin('admin', 'pass1234');
}
