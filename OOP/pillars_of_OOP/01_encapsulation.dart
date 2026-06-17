/* Encapsulation(Data hiding): This principle allows us to bundle data and methods together as a single unit. To prevent modification from 
the outside */
// why encapsulation?
import 'private.dart';

class BankAccountUnsafe {
  String fullname;
  String balance;
  String pin;

  BankAccountUnsafe(this.fullname, this.balance, this.pin);
}

BankAccountUnsafe userAcc = BankAccountUnsafe("John Doe", "\$1000", "1234");

// The fix?? Encapsulation(make attributes and methods private or public)
// Example1. import private.dart

// Example 2.
class Student {
  String _name;
  int _age;
  String _studentId;
  List<double> _grades = [];
  bool _isEnrolled = false;

  // Required enforces that the property must be provided when creating an instance of the class
  Student({required String name, required int age, required String studentId})
    : _name = name,
      _age = age,
      _studentId = studentId;

  // Read-only getters
  String get name => _name;
  String get studentId => _studentId;
  bool get isEnrolled => _isEnrolled;
  int get gradeCount => _grades.length;

  // Computed getters: derived from private data
  double get average {
    if (_grades.isEmpty) return 0.0;
    return _grades.reduce((a, b) => a + b) / _grades.length;
  }

  String get letterGrade {
    double avg = average;
    if (avg >= 90) return 'A';
    if (avg >= 80) return 'B';
    if (avg >= 70) return 'C';
    if (avg >= 60) return 'D';
    return 'F';
  }

  // Validated setter for more security
  set setAge(int newAge) {
    if (newAge < 5 || newAge > 100) {
      print('Invalid age: $newAge');
      return;
    }
    _age = newAge;
  }

  void addGrade(double grade) {
    if (grade < 0 || grade > 100) {
      print('Grade must be between 0 and 100');
      return;
    }
    _grades.add(grade);
    print('Grade $grade added for $_name');
  }

  void enrol() {
    _isEnrolled = true;
    print('$_name enrolled');
  }

  void withdraw() {
    _isEnrolled = false;
    print('$_name withdrawn');
  }

  void report() {
    print('\n Student Report ');
    print('  Name:    $_name (ID: $_studentId)');
    print('  Age:     $_age');
    print('  Status:  ${_isEnrolled ? "Enrolled" : "Withdrawn"}');
    print('  Average: ${average.toStringAsFixed(1)}%  [$letterGrade]\n');
  }
}

void main() {
  print(userAcc.fullname);
  print(userAcc.balance);
  print(userAcc.pin);

  // Modifiable from the outside
  userAcc.balance = "-999";
  userAcc.pin = "🖕";
  print(userAcc.fullname);
  print(userAcc.balance);
  print(userAcc.pin);

  // Secure Bank Account
  BankAccount account = BankAccount(
    owner: 'Alice',
    initialDeposit: 10_000.0,
    pin: '1234',
  );
  account.printTransactionHistory("1234");

  account.deposit(5000.0);
  account.withdraw(2000.0, '0000');
  account.withdraw(2000.0, '1234');
  account.withdraw(999_999.0, '1234');
  account.printTransactionHistory("1234");

  account.changePin('1234', '5678');
  account.printTransactionHistory("1234");

  // What is hidden vs exposed
  // Errors
  // print(account._pin);
  // print(account._balance);
  // account._balance = -1;

  print(account.owner);
  print(account.formattedBalance);
  // print(account._owner); // Error: private is enforced when accessed from outside the class file

  // Student Record
  Student s1 = Student(name: "Bob", age: 16, studentId: "S123");
  s1.report();
  s1.addGrade(85);
  s1.addGrade(92);
  s1.report();
  s1.setAge = 20;
  s1.setAge = 150; // Invalid age
  s1.report();
  s1.enrol();
  s1.report();
  s1.withdraw();
  s1.report();
}
