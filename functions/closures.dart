// Intro to the concepts of scope, lexical environment to prepare for closures
int a = 2000; // global variable

void add1() {
  int a = 10; // local variable
  print(a + 90);
}

void add2() {
  print(a + 100);
}

// Example 2:
Function takeUserName(String userName) {
  void greet() {
    print("Hello $userName");
  }

  return greet;
}

// Example 3(mutable state observation):
Function createCounter() {
  int count = 0;
  return () {
    count++;
    print(count);
  };
}

// Calculate discount
Function calculateDiscount(double discountPercentage) {
  return (double itemPrice) {
    double discount = itemPrice * (discountPercentage / 100);
    double checkoutAmount = itemPrice - discount;
    print(
      "Original price is $itemPrice, applied %$discountPercentage discount, final checkout is ${checkoutAmount}",
    );
  };
}

void main() {
  int insideMain = 1000; // local variable
  add1();
  add2();

  print(insideMain);
  print(a + 600);

  // Closures
  // Example 1:
  String appName = "Instagram";
  void printAppName() {
    print("The name of the app is $appName");
  }

  printAppName();

  // Example 2:
  var greetings = takeUserName("Cornelius");

  greetings();
  greetings();
  greetings();

  // Example 3(Show state changes):
  var counter = createCounter();
  var counter2 = createCounter();

  print("First counter: ");
  counter();
  counter();
  counter();
  counter();

  print("\nSecond counter");
  counter2();

  var studentAccountDiscount = calculateDiscount(20);
  var personalAccountDiscount = calculateDiscount(10);

  print("Students Discount");
  studentAccountDiscount(8_000.0);
  studentAccountDiscount(10_000.0);

  print("Personal Premium Discount");
  personalAccountDiscount(8_000.0);
  personalAccountDiscount(10_000.0);
}
