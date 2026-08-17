/* In Dart, every class in dart implicitly defines an interface(an interface by default). Which means that 
just as we can have concrete class implementations, we can also have classes(in this case called an interface) that
only provide the class blueprint, and methods specification, acting as a contract between classes.  

The interface only specifies the method the implementing classes should have, but no implementation, So this 
means that the implementing classes MUST implement the method, thereby having the appropriate method behavior 
*/

/*class Notification {
  void notify() {
    print("A notification regarding the order!");
  }
}

// All of them will behave like objects of the Notification Class, but that should not be the case
class User extends Notification {}

class Admin extends Notification {}

class Courier extends Notification {}*/

// The solution? Interface.
// Example 1.
// creates the contract that the concrete classes MUST implement
abstract class Notification {
  void notify();
}

// All of them implement the contract, and have their own implementation of the notify() method. without having to: 
// 1. extend the Notification class
// 2. inherit the behavior of the notify() method
class User implements Notification {
  @override
  void notify() {
    print("Your product is on the move\n");
  }
}

class Admin implements Notification {
  @override
  void notify() {
    int a = 10;
    int b = 200;
    int c = a + b;
    print("The sum of $a and $b is $c");
    print(
      "The delivery driver has picked the goods from the warehouse, user's product on the move\n",
    );
  }
}

class Courier implements Notification {
  @override
  void notify() {
    print("\nUser's order placed successfully, delivery process can begin\n");
  }
}

// Example 2.
abstract class Animal {
  void makeSound();
  void feedingStyle();
}

class Lion implements Animal {
  String name;
  Lion(this.name);
  @override
  void makeSound() {
    print("$name roars loudly. Can be heard over a mile away.");
  }

  @override
  void feedingStyle() {
    print("Eats meat, so I am a Carnivore");
  }
}

class Cow implements Animal {
  @override
  void makeSound() {
    print("Moooooooooooooo");
  }

  @override
  void feedingStyle() {
    print("Eats grass, so proudly a herbivore");
  }
}

// Example 3.
// Interfaces(contracts)
abstract class Printable {
  void printInfo();
}

abstract class Serializable {
  String serialize();
}

abstract class Validatable {
  bool isValid();

  String get validationError;
}

// Concrete class
// One class implementing multiple interfaces 
class PlatformUser implements Printable, Serializable, Validatable {
  String username;
  String email;
  int age;

  PlatformUser(this.username, this.email, this.age);

  @override
  void printInfo() {
    print('User: $username | Email: $email | Age: $age');
  }

  @override
  String serialize() {
    return 'username=$username;email=$email;age=$age';
  }

  @override
  bool isValid() {
    return username.isNotEmpty && email.contains('@') && age >= 0 && age <= 150;
  }

  @override
  String get validationError {
    if (username.isEmpty) {
      return 'Username cannot be empty';
    }

    if (!email.contains('@')) {
      return 'Invalid email';
    }

    if (age < 0 || age > 150) {
      return 'Invalid age';
    }

    return '';
  }
}

// Interface polymorphism 
void printAll(List<Printable> items) {
  for (final item in items) {
    item.printInfo();
  }
}

// Another implementation
class Product implements Printable, Serializable {
  String name;
  double price;

  Product(this.name, this.price);

  @override
  void printInfo() {
    print('Product: $name | ₦$price');
  }

  @override
  String serialize() {
    return 'name=$name;price=$price';
  }
}

void main() {
  /*List<Notification> appNotifications = [User(), Admin(), Courier()];
  for (var notification in appNotifications) {
    notification.notify();
  }*/

  List<Notification> appNotifications = [User(), Admin(), Courier()];
  for (var notification in appNotifications) {
    notification.notify();
  }

  Lion animal1 = Lion("Simba");
  Cow animal2 = Cow();

  animal1.makeSound();
  animal1.feedingStyle();

  animal2.makeSound();
  animal2.feedingStyle();

  PlatformUser u1 = PlatformUser('alice', 'alice@mail.com', 30);
  PlatformUser u2 = PlatformUser('', 'wrong email', 200);

  u1.printInfo();

  print(u1.serialize());

  print(u1.isValid());

  print(u2.isValid());

  print(u2.validationError);

  PlatformUser user = PlatformUser('Bob', 'bob@mail.com', 25);

  Product product = Product('Laptop', 150000);

  printAll([user, product]); 
}
