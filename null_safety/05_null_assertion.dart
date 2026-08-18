/* 
  null assertion forces Dart to treat a nullable value as non-null, right now, no questions asked. If you're right, execution
   continues normally. If you're wrong, it throws a runtime exception immediately, at that exact line.
 */
void main() {
  String? userName;

  print(userName!.length);


  if (userName != null) {
    print(userName.length); // safe, only reached if the check passed
  } else {
    print('No userName available');
  }

  // Or, more concisely with ??:
  print(userName?.length ?? 0);
}
