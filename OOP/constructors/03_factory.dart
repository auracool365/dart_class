/* Factory Constructors decides whether to create a new object or return an existing one. Normal constructors create a new object each time, that takes a 
  lot of memory. */
class Classroom {
  final String className;
  final String teacher;
  String announcement = ''; // Mutable

  // Stores every classroom created.
  static final Map<String, Classroom> _existingRooms = {};

  // Private constructor. This cannot be called directly from outside the class. It is only used by the factory constructor when a
  // brand-new Classroom object is needed.
  Classroom._internal(this.className, this.teacher);

  // The actual Factory constructor. Before creating a classroom, it checks whether one with the same className already exists.
  factory Classroom(String className, String teacher) {
    // If the classroom already exists, return the existing object.
    if (_existingRooms.containsKey(className)) {
      print('Classroom $className already exists — returning the existing one');
      return _existingRooms[className]!;
    }

    // Otherwise create a new object.
    print('Creating new classroom: $className');
    // Calling Classroom(...) would call factory each time leading to an infinite recursion. Instead, use the private constructor.
    Classroom room = Classroom._internal(className, teacher);

    // Save it so future requests can reuse it.
    _existingRooms[className] = room;

    return room;
  }

  void announce(String message) {
    announcement = message;
    print('\n[$className] $teacher says: $message');
  }
}

void main() {
  // Creating new classroom: JSS1A
  Classroom room1 = Classroom('JSS1A', 'Mr Chukwu');

  // JSS1A already exists, return the existing one
  Classroom room2 = Classroom('JSS1A', 'Mr Chukwu');

  // Creating new classroom: SS2B
  Classroom room3 = Classroom('SS2B', 'Mrs Adeyemi');

  room1.announce("Submit you assignment");
  room3.announce("We are not going for break time");

  print(room1.announcement);
  print(room2.announcement);
  print(room3.announcement);

  // room1 and room2 refer to the exact same object.
  print(identical(room1, room2)); // true

  // room3 is a different classroom object.
  print(identical(room1, room3)); // false

  // [JSS1A] Mr Chukwu says: Exam is on Friday
  room1.announce('Exam is on Friday');

  // Because room1 and room2 are the same object, changes made through room1 are visible through room2.
  print(room1.announcement);
  print(room2.announcement);
  print(room3.announcement);
}
