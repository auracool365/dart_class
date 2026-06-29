// Static members are data(properties and methods) defined on the class and belongs to the class, not objects.
// Example 1
class Calculate {
  static const int num = 8;

  static void add(int a, int b) {
    print("The sum of $a and $b is ${a + b}");
  }

  void multiply(int a, int b) {
    print("The product of $a and $b and the static property($num) is ${a * b * num}");
  }
}

// Example 2
class MathUtils {
  // Static constants
  static const double pi = 3.14159265;
  static const double e = 2.71828182;
  static const double golden = 1.61803398;

  // Static methods: no instance needed
  static int square(int n) => n * n;
  static int cube(int n) => n * n * n;
  static double hypotenuse(double a, double b) => (a * a + b * b);

  static bool isPrime(int num) {
    if (num <= 1) return false;

    if (num <= 3) return true;

    if (num % 2 == 0 || num % 3 == 0) {
      return false;
    }

    for (int i = 5; i * i <= num; i += 6) {
      if (num % i == 0 || num % (i + 2) == 0) {
        return false;
      }
    }
    return true;
  }

  static int gcd(int a, int b) {
    while (b != 0) {
      int t = b;
      b = a % b;
      a = t;
    }
    return a;
  }
}

// Example 3
class Counter {
  static int _totalCreated = 0; // shared across all instances

  final int id;
  int count = 0;

  // Constructor
  Counter() : id = _totalCreated++; // increment on each creation

  void increment() => count++;
  void decrement() => count--;

  static int get totalCounters => _totalCreated;

  void status() => print('Counter #$id | count: $count');
}

void main() {
  Calculate cal = Calculate();
  cal.multiply(5, 6);

  Calculate.add(5, 6);

  print("Math Utils:");
  print(MathUtils.pi);
  print(MathUtils.square(5));
  print(MathUtils.isPrime(17));
  print(MathUtils.gcd(48, 18));

  print("\nCounter:");
  Counter c1 = Counter();
  Counter c2 = Counter();
  Counter c3 = Counter();

  c1.increment();
  c1.increment();
  c2.increment();
  c3.increment();
  c3.increment();
  c3.increment();
  c3.increment();

  c1.status();
  c2.status();
  c3.status();

  print(Counter.totalCounters);
}
