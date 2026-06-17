// check if a list has duplicates and print out the duplicates
void findDuplicates(List<dynamic> nums) {
  List<dynamic> uniqueList = [];
  List<dynamic> duplicateList = [];
  bool hasDuplicates = nums.length != nums.toSet().length;
  if (hasDuplicates) {
    print("$hasDuplicates: the list has duplicates");
  } else {
    print("$hasDuplicates: the list has no duplicates");
  }
  for (dynamic num in nums) {
    if (uniqueList.contains(num)) {
      duplicateList.add(num);
    }
    uniqueList.add(num);
  }
  if (duplicateList.length > 0) {
    print("Duplicate elements are: $duplicateList");
    return;
  }
}

// Sum of elements at even index
void findEvenIndexSum(List<int> nums) {
  int sum = 0;
  for (int i = 0; i < nums.length; i += 2) {
    sum += nums[i];
  }
  print("The sum of the even indexed element in the list is $sum");
}

// Use a closure to track scores
Function trackScores() {
  int score = 0;
  return () {
    print("Your score is $score");
    score += 5;
    if (score == 25) {
      print("Congratulations, you crossed the $score mark threshold!");
    }
  };
}

void main() {
  // duplicate int list
  /*   List<int> ages = [55, 65, 75, 85, 95, 55, 75];
  findDuplicates(ages);

  // duplicate double list
  List<double> heights = [5.5, 6.5, 7.5, 8.5, 9.5, 5.5, 7.5];
  findDuplicates(heights);

  // duplicate String list
  findDuplicates(["Sam", "Paul", "John", "Sam", "John"]);

  // mixed type list
  List<dynamic> myList = ["Hi", 10, true, 4.56, 10, true, "Hi"];
  findDuplicates(myList);

  // non-duplicate lists
  findDuplicates(["Hi", "Hello", "Bye"]);
  findDuplicates([1, 2, 3, 4, 5]);

  findEvenIndexSum([1, 2, 3, 4, 5]); */

  // closure
  var track = trackScores();
  track();
  track();
  track();
  track();
  track();
  track();
  track();
}

/* class BankAccount {
  // Private fields: prefixed with _
  String _owner;
  double _balance;
  String _pin;
  List<String> _transactionHistory = [];

  // Constructor 
  BankAccount({
    required String owner,
    required double initialDeposit,
    required String pin,
  })  : _owner   = owner,
        _balance = initialDeposit,
        _pin     = pin {
    _log('Account created with ₦$initialDeposit');
  }

  // Public getters: read-only window into private data 
  String get owner   => _owner;
  double get balance => _balance;

  // Balance formatted: caller never needs to format themselves
  String get formattedBalance => '₦${_balance.toStringAsFixed(2)}';

  // No setter for balance — it can ONLY change through
  //    deposit() and withdraw() which enforce the rules
  // No getter for PIN — it is completely hidden

  // Public methods: the only way to interact 
  bool deposit(double amount) {
    if (amount <= 0) {
      print('Deposit amount must be positive');
      return false;
    }
    _balance += amount;
    _log('Deposited ₦$amount');
    print('₦$amount deposited. New balance: $formattedBalance');
    return true;
  }

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

  void printStatement() {
    print('\nStatement for $_owner');
    for (String entry in _transactionHistory) {
      print('  $entry');
    }
    print('  Current balance: $formattedBalance \n');
  }

  // Private methods: internal helpers, hidden 
  bool _verifyPin(String entered) => entered == _pin;

  void _log(String action) {
    String timestamp = DateTime.now().toString().substring(0, 19);
    _transactionHistory.add('[$timestamp] $action');
  }
}

// Using the encapsulated class 
BankAccount account = BankAccount(
  owner:          'Alice',
  initialDeposit: 10000.0,
  pin:            '1234',
);



void main() {
  account.deposit(5000.0);              
  account.withdraw(2000.0, '0000');    
  account.withdraw(2000.0, '1234');    
  account.withdraw(999999.0, '1234');  
  account.changePin('1234', '5678');   

  account.printStatement();

  // What is hidden vs exposed 
  // Errors
  // print(account._pin);      
  // print(account._balance);  
  // account._balance = -1;    

  print(account.owner);            
  print(account.formattedBalance);  
} 


/* class Student {
  String _name;
  int    _age;
  String _studentId;
  List<double> _grades = [];
  bool   _isEnrolled   = true;

  Student({
    required String name,
    required int    age,
    required String studentId,
  })  : _name      = name,
        _age       = age,
        _studentId = studentId;

  // Read-only getters 
  String get name       => _name;
  String get studentId  => _studentId;
  bool   get isEnrolled => _isEnrolled;
  int    get gradeCount => _grades.length;

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

  // Controlled methods 
  void addGrade(double grade) {
    if (grade < 0 || grade > 100) {
      print('Grade must be between 0 and 100');
      return;
    }
    _grades.add(grade);
    print('Grade $grade added for $_name');
  }

  void enrol()    { _isEnrolled = true;  print('$_name enrolled');    }
  void withdraw() { _isEnrolled = false; print('$_name withdrawn');   }

  void report() {
    print('\n Student Report ');
    print('  Name:    $_name (ID: $_studentId)');
    print('  Age:     $_age');
    print('  Status:  ${_isEnrolled ? "Enrolled" : "Withdrawn"}');
    print('  Average: ${average.toStringAsFixed(1)}%  [$letterGrade]\n');
  }
}

Student stu = Student(name: 'Emeka', age: 17, studentId: 'STU-001');

void main() {
  stu.addGrade(85.0);
  stu.addGrade(92.0);
  stu.addGrade(78.0);
  stu.addGrade(150.0);   

  stu.setAge = 200;         

  stu.report();
} */      */
