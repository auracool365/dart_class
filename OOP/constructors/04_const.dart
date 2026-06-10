/* Creates immutable objects whose values are known at compile time. If two const objects have exactly the same compile-time values, Dart 
  reuses a single object in memory instead of creating duplicates. */
class SchoolSubject {
  final String name;
  final int periodsPerWeek;
  final bool isMandatory;

  // Const constructor
  const SchoolSubject(this.name, this.periodsPerWeek, this.isMandatory);

  void display() {
    print(
      '$name | $periodsPerWeek periods/week | '
      '${isMandatory ? "Mandatory" : "Elective"}',
    );
  }
}

void main() {
  const SchoolSubject maths = SchoolSubject('Mathematics', 5, true);

  const SchoolSubject english = SchoolSubject('English', 5, true);

  const SchoolSubject art = SchoolSubject('Fine Art', 2, false);

  maths.display();

  english.display();

  art.display();

  // Because this object has exactly the same values as 'maths', Dart reuses the existing const object rather than creating a second one.
  const SchoolSubject mathsAgain = SchoolSubject('Mathematics', 5, true);

  print(identical(maths, mathsAgain));

  print(identical(maths, english));
}
