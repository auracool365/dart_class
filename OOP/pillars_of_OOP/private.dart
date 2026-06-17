
// A separate file to demonstrate that Dart enforces privacy when the implementation is in a separate file/library
class BankAccount {
  // Private fields: prefixed with _
  String _owner;
  double _balance;
  String _pin;
  List<String> _transactionHistory = [];

  // Private methods: internal helpers, hidden
  bool _verifyPin(String entered) => entered == _pin;

  void _log(String action) {
    String timestamp = DateTime.now().toString().substring(0, 19);
    _transactionHistory.add('[$timestamp] $action');
  }

  // Constructor
  BankAccount({
    required String owner,
    required double initialDeposit,
    required String pin,
  }) : _owner = owner,
       _balance = initialDeposit,
       _pin = pin {
    _log('Account created with ₦$initialDeposit');
  }

  // Public getters: read-only window into private data
  String get owner => _owner;
  double get balance => _balance;

  // Balance formatted: caller never needs to format themselves
  String get formattedBalance => '₦${_balance.toStringAsFixed(2)}';

  // No setter for balance — it can ONLY change through deposit() and withdraw() which enforce the rules
  // No getter for PIN — it is completely hidden

  // Public methods: the only way to interact from outside the class
  // deposit
  bool deposit(double amount) {
    if (amount < 0) {
      print('Deposit amount must be positive');
      return false;
    }

    if (amount == 0 || amount < 1) {
      print("Invalid Amount. The minimum deposit is \$1");
      return false;
    }
    _balance += amount;
    _log('Deposited ₦$amount');
    print('₦$amount deposited. New balance: $formattedBalance');
    return true;
  }

  // Withdraw
  bool withdraw(double amount, String enteredPin) {
    if (!_verifyPin(enteredPin)) {
      print('Incorrect PIN. Transaction declined.');
      return false;
    }
    if (amount <= 0) {
      print('Withdrawal amount must be positive');
      return false;
    }
    if (amount > _balance) {
      print('Insufficient funds. Available: $formattedBalance');
      return false;
    }
    _balance -= amount;
    _log('Withdrew ₦$amount');
    print('₦$amount withdrawn. New balance: $formattedBalance');
    return true;
  }

  // Change PIN
  bool changePin(String oldPin, String newPin) {
    if (!_verifyPin(oldPin)) {
      print('Incorrect current PIN');
      return false;
    }
    if (newPin.length != 4) {
      print('PIN must be exactly 4 digits');
      return false;
    }
    _pin = newPin;
    _log('PIN changed');
    print('PIN changed successfully');
    return true;
  }

  // Transaction history
  void printTransactionHistory(String enteredPin) {
    if (!_verifyPin(enteredPin)) {
      print('Incorrect PIN. Cannot display transaction history.');
      return;
    }
    print('Transaction History:');
    for (String transaction in _transactionHistory) {
      print(transaction);
    }
  }
}
