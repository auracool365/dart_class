void main() {
  print("1. Welcome");
  print("2. Welcome");
  print("3. Welcome");
  print("4. Welcome");
  print("5. Welcome");

  // for(initialization(starting point); condition(stop); update(steps))
  for (int i = 1; i <= 10; i++) {
    print("Hello $i");
  }

  // Count down
  print("\nStart count down");
  for (int i = 10; i > 0; i--) {
    // or i >= 1
    print(i);
  }
  print("Lift off");

  // using if statements inside loops
  for (int i = 0; i <= 20; i++) {
    if (i % 2 == 0) {
      print('$i is an even number!');
    } else {
      print('$i is an odd number!');
    }
  }

  for (int i = 0; i <= 10; i += 2) {
    print('$i is an even number!');
  }

  // Salary increment
  int salary = 100_000;
  int timeSpan = 10;

  // increment stays static after increment before the next raise
  for (int year = 1; year <= timeSpan; year++) {
    if (year <= 3) {
      if (year == 1) {
        print("My starting salary is \$$salary per annum");
      } else {
        print("My salary is $salary per annum");
      }
    } else if (year > 3 && year <= 6) {
      if (year == 4) {
        salary += 15_000;
        print('My salary has been increased to $salary');
      } else {
        print("My salary is $salary per annum");
      }
    } else {
      if (year == 7) {
        salary += 30_000;
        print('My salary has been increased to $salary');
      }
      print("My salary is $salary per annum");
    }
  }

  salary = 100_000;

  print("\nDynamic increment");
  // increment is dynamic after each raise
  for (int year = 1; year <= timeSpan; year++) {
    if (year <= 3) {
      if (year == 1) {
        print("My starting salary is \$$salary per annum");
      } else {
        print("My salary is $salary per annum");
      }
    } else if (year > 3 && year <= 6) {
      salary += 15_000;
      if (year == 4) {
        print('My salary has been increased to $salary');
      } else {
        print("My salary is $salary per annum");
      }
    } else {
      salary += 30_000;
      if (year == 7) {
        print('My salary has been increased to $salary');
        continue;
      }
      print("My salary is $salary per annum");
    }
  }

  int x = 2;
  int y = 5;
  print('$x x $y = ${x * y}');
}
