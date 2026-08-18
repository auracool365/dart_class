/* 
  variable ??= value assigns value to variable, but only if variable is currently 
  null. If it already holds a real value, this does nothing.
 */

void main() {
  String? userName;
  String userName1 = "John";

  userName ??= "Cornelius";

  // userName1 ??= "Paul"; // No error, but dead code(useless)

  print(userName);
  print(userName1);
}
