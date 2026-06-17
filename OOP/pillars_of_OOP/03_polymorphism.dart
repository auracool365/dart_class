/* Polymorphism means one interface, many forms. The same method name behaves differently depending on which object is actually calling 
it. You call the same method on different objects and each responds in its own way. You call the same method on different objects, but 
each object responds in its own way.

Abstract class = blueprint
Abstract method = promise
Concrete class = actual implementation
*/

// Example 1.
class Animal {
  String name;
  Animal({required this.name});

  void makeSound() {
    print("$name is making a sound");
  }
}

// Child 1
class Dog extends Animal {
  Dog({required String name}) : super(name: name);

  @override
  void makeSound() {
    print("$name says woof woof!");
  }
}

// Child 2
class Cat extends Animal {
  Cat({required String name}) : super(name: name);

  @override
  void makeSound() {
    print("$name says meow meow!");
  }
}

// Child 3
class Parrot extends Animal {
  Parrot({required String name}) : super(name: name);

  @override
  void makeSound() {
    print("$name mimics everyone");
  }
}

// Example 2.
class Employee {
  String name;
  String department;
  double baseSalary;

  Employee({
    required this.name,
    required this.department,
    required this.baseSalary,
  });

  // This method will be overridden differently by each subclass
  double calculateSalary() => baseSalary;

  void work() => print('$name is working');

  void paySlip() {
    print('Pay Slip');
    print('  Name:       $name');
    print('  Department: $department');
    print('  Total Pay:  ₦${calculateSalary().toStringAsFixed(2)}\n');
  }
}

// Child 1.
class FullTimeEmployee extends Employee {
  double housingAllowance;
  double transportAllowance;

  FullTimeEmployee({
    required String name,
    required String department,
    required double baseSalary,
    required this.housingAllowance,
    required this.transportAllowance,
  }) : super(name: name, department: department, baseSalary: baseSalary);

  @override
  double calculateSalary() {
    // Full-time: base + housing + transport
    return baseSalary + housingAllowance + transportAllowance;
  }

  @override
  void work() {
    print('$name works 9am - 5pm Monday to Friday');
  }
}

// Child 2.
class PartTimeEmployee extends Employee {
  int hoursWorked;
  double hourlyRate;

  PartTimeEmployee({
    required String name,
    required String department,
    required this.hoursWorked,
    required this.hourlyRate,
  }) : super(name: name, department: department, baseSalary: 0);

  @override
  double calculateSalary() {
    // Part-time: hours × hourly rate
    return hoursWorked * hourlyRate;
  }

  @override
  void work() {
    print('$name works $hoursWorked hours this week');
  }
}

// Child 3.
class SalesEmployee extends Employee {
  double salesAmount;
  double commissionRate;

  SalesEmployee({
    required String name,
    required double baseSalary,
    required this.salesAmount,
    required this.commissionRate,
  }) : super(name: name, department: 'Sales', baseSalary: baseSalary);

  @override
  double calculateSalary() {
    // Sales: base + commission
    double commission = salesAmount * commissionRate;
    return baseSalary + commission;
  }

  @override
  void work() {
    print('$name is closing sales deals');
  }
}

// Child 4.
class ContractEmployee extends Employee {
  int daysWorked;
  double dailyRate;
  double taxRate;

  ContractEmployee({
    required String name,
    required String department,
    required this.daysWorked,
    required this.dailyRate,
    required this.taxRate,
  }) : super(name: name, department: department, baseSalary: 0);

  @override
  double calculateSalary() {
    // Contract: days × rate − tax
    double gross = daysWorked * dailyRate;
    double tax = gross * taxRate;

    return gross - tax;
  }

  @override
  void work() {
    print('$name works on specific deliverables');
  }
}

// Example 3.
class Product {
  String name;
  double basePrice;

  Product({required this.name, required this.basePrice});

  double calculatePrice() => basePrice;

  void receipt() {
    print('$name  =>  ₦${calculatePrice().toStringAsFixed(2)}');
  }
}

// Child 1.
// Standard product with no price modifications
class RegularProduct extends Product {
  RegularProduct({required String name, required double basePrice})
    : super(name: name, basePrice: basePrice);

  @override
  double calculatePrice() {
    return basePrice;
  }
}

// percentage-based discount product
class SaleProduct extends Product {
  double discountPercent;

  SaleProduct({
    required String name,
    required double basePrice,
    required this.discountPercent,
  }) : super(name: name, basePrice: basePrice);

  @override
  double calculatePrice() {
    return basePrice - (basePrice * (discountPercent / 100));
  }
}

// bulk purchase discount products
class BundleProduct extends Product {
  int quantity;
  double pricePerUnit;

  BundleProduct({
    required String name,
    required this.quantity,
    required this.pricePerUnit,
  }) : super(name: name, basePrice: quantity * pricePerUnit);

  @override
  double calculatePrice() {
    return basePrice * 0.85;
  }
}

void main() {
  // animals sound types
  List<Animal> animals = [
    Dog(name: "Bold"),
    Cat(name: "Kali"),
    Parrot(name: "elejo"),
  ];

  for (Animal animal in animals) {
    animal.makeSound();
  }

  // Company Payroll
   List<Employee> staff = [
    FullTimeEmployee(
      name: 'Oge',
      department: 'HR',
      baseSalary: 150000,
      housingAllowance: 40000,
      transportAllowance: 15000,
    ),
    PartTimeEmployee(
      name: 'Ade',
      department: 'Design',
      hoursWorked: 20,
      hourlyRate: 3000,
    ),
    SalesEmployee(
      name: 'Fatima',
      baseSalary: 80000,
      salesAmount: 500000,
      commissionRate: 0.05,
    ),
    ContractEmployee(
      name: 'Bola',
      department: 'Media',
      daysWorked: 22,
      dailyRate: 12000,
      taxRate: 0.10,
    ),
  ];

  print('\nCompany Payroll');
  for (Employee employer in staff) {
    employer.work();
    employer.paySlip();
    print('');
  }

  print('Store Receipt\n');

  List<Product> cart = [
    RegularProduct(name: 'Notebook', basePrice: 1500),
    SaleProduct(name: 'School Bag', basePrice: 8000, discountPercent: 25),
    BundleProduct(name: 'Pens', quantity: 10, pricePerUnit: 200),
  ];

  double total = 0;

  for (Product product in cart) {
    product.receipt();
    total += product.calculatePrice();
  }

  print('\nTotal: ₦${total.toStringAsFixed(2)}');
}
