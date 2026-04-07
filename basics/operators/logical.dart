void main() {
  // Logical operators allows us to work with boolean logic with boolean return values

  int x = 10;
  int y = 20;

  // AND (&&): Only evaluates to true if both conditions are true, everything else false
  print(x > 2 && y < 10);
  print(x > 2 && y < 100);

  // OR (||): Evaluates to true if either or both are true, else false
  print(y > 1000 || x < y);
  print(y > 1000 || x > y);

  // NOT (!): Inverts the real result
  print(5 > 2);
  print(!(5 > 2));

  print(!(5 > 2 && 5 > 20));

  print(!false);
  print(!true);
}
