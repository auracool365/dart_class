void main() {
  // Relational operators check if values are equal or if they are of the same type. returns bool
  int a = 5;
  int b = 8;
  String userName = "John Doe";

  // Equality
  print(a == b);
  print(userName == a); // false
  print(userName.length == b); // true
  // print(int.parse(userName) == b); // Error

  // Not equal
  print(a != b);
  print(b != userName);

  // Greater than 
  print(a > b);

  // Less than
  print(a < b);

  // Greater than or equal to
  print(a >= b);

  // Less than or equal to
  print(a <= b);


}
