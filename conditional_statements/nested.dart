import 'dart:io';

void main() {
  /* int age = 10;
  bool isRegistered = !false;

  if (age >= 20 && isRegistered == true) {
    print("Access granted✅");
  } else {
    print(
      "Access denied❌",
    ); // Why was access denied? age? isRegistered? or Both?
  }

  // The fix is nested conditional statements
  if (age >= 20) {
    if (isRegistered == true) {
      print("Access granted 👍");
    } else {
      print("You are old enough, but you are not registered🫠");
    }
  } else {
    print("You are not old enough");
  } */

  // voting system
  int voterAge = 30;
  bool isCitizen = true;
  bool hasVoterCard = !true;

  if (isCitizen == true) {
    if (voterAge >= 18) {
      if (hasVoterCard == true) {
        print("You voted successfully🎉");
      } else {
        print("Go and get your PVC");
      }
    } else {
      print("You are not old enough to vote");
    }
  } else {
    print("You are not a citizen of Nigeria");
  }

  // Nesting can also get messy
  // staff authentication and authorization
  // admin1 can change both price and promo, admin2 can only change discount,
  // other staff can't change anything
  String password = "654321abc";
  bool isStaff = true;
  bool canChangePrice = true;
  bool canChangeDiscount = true;

  int price = 1000;
  int discount = 5;

  stdout.write("Enter your password: ");
  String? enteredPassword = stdin.readLineSync()!;

  stdout.write("enter your user name: ");
  String? userName = stdin.readLineSync();

  if (enteredPassword.toLowerCase() == password && isStaff == true) {
    print("Hi $userName, Welcome back");

    stdout.write("Enter your role: ");
    String? enteredRole = stdin.readLineSync()!;
    if (enteredRole.toLowerCase() == "admin1") {
      print("Hi Senior Admin, you can change anything in the store");
      if (canChangePrice == true && canChangeDiscount == true) {
        price = 1200;
        print("Senior admin, changed the price of the item to $price");
        discount = 7;
        print("Senior admin changed the discount to $discount");
      } else {
        print("You are not authorized to change discount");
      }
    } else if (enteredRole.toLowerCase() == "admin2") {
      if (canChangePrice == !true) {
        price = 1500;
        print("You are not authorized to change price");
      } else if (canChangeDiscount == true) {
        discount = 8;
        print("Junior admin changed the discount");
      }
    } else if (enteredRole.toLowerCase() == "staff") {
      print("You are not authorized to make any changes");
    } else {
      print("Invalid Role");
    }
  } else {
    print("Invalid password or not a staff");
  }

  print("price is $price");
  print("discount is $discount");
}
