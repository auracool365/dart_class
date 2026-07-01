


class User {
  final String userName;

  User(this.userName);
}

/* Sometimes, what is needed is value equality in many applications, identity doesn't matter. 
print(User(id: 1, userName: John) == User(id: 1, userName: John) should be true. This is called value equality: Objects are equal when their values match.
*/

// Solving It Manually (Without Equatable)
class Student {
  final String id;
  final String name;

  const Student({required this.id, required this.name});

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is Student && id == other.id && name == other.name;
  }

  // Override hash to generate identical hash code if the objects have the same value. 
  @override
  int get hashCode {
    return Object.hash(id, name);
  }
}

void main() {
  // Equality means: Determining whether two values should be considered the same.
  // 1. This is very straightforward for simple types.

 /* 
  print("Sam" == "Sam");
  print(2 == 2);
  print(2 == "Sam");
  print("John" == "Johnny"); 
  */

  // 2. Objects Are Compared Differently. By default, Dart compares object references(memory address), not contents.
  // Reference equality checks if they share the same memory address. Two objects are equal only if they point to the exact same address.
  final User user1 = User("Paul");
  final User user2 = User("Paul");
  final User user3 = User("Paul");
  final User user4 = user3;

  print(user1 == user2); // false
  print(user4 == user3); // true: Same memory location

  // Manual Value Reference. Works but can get cumbersome for multiple types, hence equatable package
  final student1 = Student(id: "1", name: "John");
  final student2 = Student(id: "1", name: "John");
  print(student1 == student2);
}
