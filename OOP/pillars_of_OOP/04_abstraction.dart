/* Abstraction means hiding complex implementation details and exposing only what is necessary. You work with a simplified model of a 
complex thing. You don't need to know HOW it works — just WHAT it does. */

// Example 1: Animal abstraction
// Abstract class defines WHAT must exist
abstract class Animal {
  String name;

  Animal({required this.name});

  // Abstract methods: Child classes must implement these
  void makeSound();

  // Concrete(shared) method: Shared implementation
  void breathe() => print('$name is breathing');
}

// Concrete classes fill in the missing behaviour
class Dog extends Animal {
  Dog({required String name}) : super(name: name);

  @override
  void makeSound() => print('$name says Woof!');
  
}

class Cat extends Animal {
  Cat({required String name}) : super(name: name);

  @override
  void makeSound() =>  print('$name says Meow!');
  
}

class Cow extends Animal {
  Cow({required String name}) : super(name: name);

  @override
  void makeSound() => print('$name says Moooo!');
}

// Example 2. Payment system abstraction
abstract class PaymentProcessor {
  String processorName;

  PaymentProcessor({required this.processorName});

  // Child classes must implement this
  bool processPayment(double amount);

  double get balance;

  // Shared behaviour
  void receipt(double amount, bool success) {
    print('Receipt');
    print('Processor: $processorName');
    print('Amount: ₦${amount.toStringAsFixed(2)}');
    print('Status: ${success ? "Success" : "Failed"}');
  }
}

// Card payment processor 
class CardPayment extends PaymentProcessor {
  double _balance;

  CardPayment({required double balance})
    : _balance = balance,
      super(processorName: 'Card');

  @override
  bool processPayment(double amount) {
    if (amount > _balance) {
      receipt(amount, false);

      return false;
    }

    _balance -= amount;

    receipt(amount, true);

    return true;
  }

  @override
  double get balance => _balance;
}

// Mobile payment processor
class MobileMoney extends PaymentProcessor {
  double _wallet;

  MobileMoney({required double wallet})
    : _wallet = wallet,
      super(processorName: 'Mobile Money');

  @override
  bool processPayment(double amount) {
    if (amount > _wallet) {
      receipt(amount, false);

      return false;
    }

    _wallet -= amount;

    receipt(amount, true);

    return true;
  }

  @override
  double get balance => _wallet;
}

// Bank transfer payment processor
class BankTransfer extends PaymentProcessor {
  double _account;

  BankTransfer({required double balance})
    : _account = balance,
      super(processorName: 'Bank Transfer');

  @override
  bool processPayment(double amount) {
    double fee = amount * 0.01;

    if ((amount + fee) > _account) {
      receipt(amount, false);

      return false;
    }

    _account -= (amount + fee);

    receipt(amount, true);

    return true;
  }

  @override
  double get balance => _account;
}

// Same checkout
// Doesn't know how payment works
void checkout(PaymentProcessor processor, double amount) {
  print('Checkout');

  processor.processPayment(amount);

  print('Remaining Balance: ₦${processor.balance.toStringAsFixed(2)}\n');
}

void main () {

  // Example 1. Animals abstraction
  List<Animal> animals = [
    Dog(name: 'Bold'),
    Cat(name: 'Kali'),
    Cow(name: 'Ferdinand'),
  ];

  for (Animal animal in animals) {
    animal.breathe();
    animal.makeSound();
  }


   // Example 2 — Payment abstraction
  print('\nPayment System\n');

  checkout(CardPayment(balance: 50000), 12000);

  checkout(MobileMoney(wallet: 20000), 12000);

  checkout(BankTransfer(balance: 100000), 12000);

}