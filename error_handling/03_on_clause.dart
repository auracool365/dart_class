// Custom exceptions for a real scenario
class InsufficientFundsException implements Exception {
  final double shortfall;
  InsufficientFundsException(this.shortfall);
  @override
  String toString() => 'Insufficient funds — short by ₦$shortfall';
}

class AccountFrozenException implements Exception {
  @override
  String toString() => 'Account is frozen';
}

// A function that can throw different exception types
void withdraw(double balance, double amount, bool isFrozen) {
  if (isFrozen) {
    throw AccountFrozenException();
  }
  if (amount > balance) {
    throw InsufficientFundsException(amount - balance);
  }
  print('Withdrawal of ₦$amount successful');
}

// Handling each exception type differently
void attemptWithdrawal(double balance, double amount, bool isFrozen) {
  try {
    withdraw(balance, amount, isFrozen);
  } on AccountFrozenException {
    // Catches ONLY AccountFrozenException
    print('Please contact support to unfreeze your account.');
  } on InsufficientFundsException catch (e) {
    // Catches ONLY InsufficientFundsException — and gives access to it
    print('Cannot withdraw: $e');
    print('Try a smaller amount or top up your balance.');
  } on FormatException catch (e) {
    // Catches ONLY FormatException — won't trigger here but shows the pattern
    print('Invalid number format: $e');
  } catch (e) {
    // Fallback — catches ANYTHING not matched above
    print('Unexpected error: $e');
  }
}

void main() {
  print('Scenario 1: Normal withdrawal');
  attemptWithdrawal(5000.0, 2000.0, false);

  print('\nScenario 2: Insufficient funds');
  attemptWithdrawal(1000.0, 5000.0, false);

  print('\nScenario 3: Frozen account');
  attemptWithdrawal(5000.0, 1000.0, true);

}
