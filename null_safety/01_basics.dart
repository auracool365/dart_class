/* 
   in modern Dart, every type is non-nullable unless you explicitly say otherwise. String means "always a real string,
  never null, guaranteed by the compiler." String? (with a ?) means "a real string, or null. This must be guaranteed for Dart
  to allow it to compile.

  NOTE: null safety checks happen at compile time, not runtime 
 */

void main() {
  String userName = "Cornelius";
  String? nickname;

  //nickname = "CO";

  print('Hello $userName');
  print(nickname);

  // Type promotion:
  /*
  once Dart's flow analysis can prove a nullable variable isn't null at a specific point in the code usually via an if check, it
  temporarily treats that variable as non-nullable for the rest of that scope. This is called type promotion, and it's why a simple 
  if (x != null) is often all that's needed, with no special operator require 
   */
  String? nickname2 = 'CO'; // Remove the value, so the else can run

  if (nickname2 != null) {
    print('Nickname has ${nickname2.length} characters');
  } else {
    print('No nickname set');
  }
}
