// Basic try/catch
void divideNumbers(int a, int b) {
  try {
    int result = a ~/ b; // risky: b could be 0
    print('$a ÷ $b = $result');
  } catch (e) {
    print('Cannot divide: $e'); // runs only if try throws
  }
}

// try/catch with the error object
void parseUserAge(String input) {
  try {
    int age = int.parse(input);
    print('Age accepted: $age');
  } catch (e) {
    print('Invalid age input "$input": $e');
  }
}

// try/catch/finally: cleanup that always runs
void processOrder(double amount) {
  print('Opening order processing...');
  try {
    if (amount <= 0) {
      throw Exception('Order amount must be positive');
    }
    print('Processing order of ₦$amount');
  } catch (e) {
    print('Order failed: $e');
  } finally {
    // Runs whether the order succeeded OR failed. Used for cleanup: closing connections, releasing resources
    print('Closing order processing session.\n');
  }
}

void main() {
  print('Division');
  divideNumbers(10, 2);
  divideNumbers(10, 0);

  print('\nAge Parsing');
  parseUserAge('25');
  parseUserAge('twenty-five');

  print('\nOrder Processing');
  processOrder(5000.0);
  processOrder(-100.0);
}
