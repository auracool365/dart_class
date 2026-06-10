class Person {
  // properties: tell us about the objects
  String name;
  String gender;
  int age;

  Person(this.name, this.gender, this.age);

  // Method: Describe what the objects can do
  void speak() {
    print('Hi, my name is $name and I am $age years old.');
  }

  void walk() {
    print('$name is taking an evening walk in the park');
  }
}

class Phone {
  // Properties
  String make;
  String model;
  int year;
  String color;

  Phone(this.make, this.model, this.year, this.color);

  // Method
  void describe() {
    print("My phone is a $year $make $model, I like it in $color color");
  }
}

class BankAccount {
  String firstName;
  String lastName;
  String accountNumber;
  double balance;

  BankAccount(this.firstName, this.lastName, this.accountNumber, this.balance);

  // Deposit
  void deposit(double amount) {
    if (amount < 0) {
      print("Invalid deposit amount");
      return;
    }
    balance += amount;
    print("\nCredit Alert: $amount deposited successfully");
    print("Balance: $balance");
  }

  // Withdrawal
  void withdraw(double amount) {
    if (amount > balance) {
      print("Insufficient balance");
      return;
    }
    balance -= amount;
    print("\nDebit Alert: $amount Debited");
    print("Balance: $balance");
  }

  // Check balance
  void checkBalance() {
    print("\nHi, $firstName $lastName \nAccount No: $accountNumber");
    print("Balance: $balance");
  }
}

void main() {
  /* int gasPrice = 1900;
  String item = "Cooking Gas";
  double pi = 3.14159;
  print(pi);
  print(item);
  print(gasPrice);

  print("Person");

  String name = "John";
  int age = 100;
  String gender = "Male";
  bool isSQIStudent = false;
  print(name);
  print(age);
  print(gender);
  print(isSQIStudent); */

  // Property definition belongs to the class, the property values belong to the objects
  Person p1 = Person("Sam", "Male", 200);
  Person p2 = Person("Shola", "Female", 210);
  print(p1.name);
  print(p2.name);
  p1.speak();
  p2.speak();

  // List of Strings
  List<String> people = ["Sam", "John", "Peter"];
  for (String person in people) {
    print(person);
  }

  // List of Persons
  List<Person> people1 = [
    Person("Ade", "Male", 50),
    Person("Jane", "Female", 45),
    Person("Dami", "Female", 65),
  ];
  for (Person person in people1) {
    print('${person.name} ${person.gender} ${person.age}');
  }

  Phone iOS = Phone("iPhone", "17 Pro Max", 2025, "brown");
  Phone android = Phone("Samsung", "S26 Ultra", 2026, "white");
  iOS.describe();
  android.describe();

  BankAccount account1 = BankAccount("John", "Doe", "ACCOUNT1234567", 0.00);
  BankAccount account2 = BankAccount("Sunny", "Ade", "ACCOUNT7654321", 0.00);

  account1.checkBalance();
  account2.checkBalance();

  account1.deposit(300_000);
  account2.deposit(400_000);

  account1.checkBalance();
  account2.checkBalance();

  account1.withdraw(35_000);
  account2.withdraw(100_000);
  
  account1.checkBalance();
  account2.checkBalance();
}
