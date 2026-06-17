/* Inheritance is the process where a class(child/derived) acquires data(properties and methods) from another class(Parent/Base) */

// Example. 1
// Base Class
class Person {
  String name;
  String gender;
  int age;

  Person({required this.name, required this.gender, required this.age});

  // Methods
  void speak() => print("$name is speaking");
  void eat() => print("$name is eating");
  void walk() => print("$name is walking");

  void introduce() {
    print(
      "This is ${gender.toLowerCase() == "male" ? "Mr" : "Mrs"} $name, a $age year old $gender",
    );
  }
}

// Derived class inherits from the base class
class Student extends Person {
  String school;
  String grade;

  Student({
    required String name,
    required String gender,
    required int age,
    required this.school,
    required this.grade,
  }) : super(name: name, gender: gender, age: age);

  void study() => print('$name is studying for class $grade');
  void takeExam() => print('$name is writing an exam at $school');

  @override
  void introduce() {
    super.introduce(); // calls Person's introduce first
    print('I am a student at $school in class $grade.');
  }
}

// Another child class extends parent class
class Teacher extends Person {
  String subject;
  int yearsExperience;

  Teacher({
    required String name,
    required int age,
    required String gender,
    required this.subject,
    required this.yearsExperience,
  }) : super(name: name, age: age, gender: gender);

  void teach() => print('$name is teaching $subject');
  void gradeWork() => print('$name is grading student work');

  @override
  void introduce() {
    super.introduce();
    print('I teach $subject with $yearsExperience years of experience.');
  }
}

// Grandchild inherits from child
class PrefectStudent extends Student {
  String prefectRole;

  PrefectStudent({
    required String name,
    required int age,
    required String gender,
    required String school,
    required String grade,
    required this.prefectRole,
  }) : super(
         name: name,
         age: age,
         gender: gender,
         school: school,
         grade: grade,
       );

  void presideOver() => print('$name is presiding as $prefectRole');

  @override
  void introduce() {
    super.introduce(); // calls Student's introduce (which calls Person's)
    print('I am also the $prefectRole of $school.');
  }
}

// Example. 2
class Animal {
  String name;
  String species;
  double weight;

  Animal({required this.name, required this.species, required this.weight});

  void breathe() => print('$name breathes');
  void sleep() => print('$name sleeps');
  void eat() => print('$name eats');

  void describe() {
    print('$name | Species: $species | Weight: ${weight}kg');
  }
}

// Level 2: Pet
class Pet extends Animal {
  String ownerName;
  String petName;

  Pet({
    required String name,
    required String species,
    required double weight,
    required this.ownerName,
    required this.petName,
  }) : super(name: name, species: species, weight: weight);

  void cuddle() => print('$petName cuddles with $ownerName');
  void play() => print('$petName is playing');
}

// Level 3: specific pets
class Dog extends Pet {
  String breed;

  Dog({
    required String ownerName,
    required String petName,
    required double weight,
    required this.breed,
  }) : super(
         name: breed,
         species: 'Canis lupus familiaris',
         weight: weight,
         ownerName: ownerName,
         petName: petName,
       );

  void bark() => print('$petName: Woof! Woof!');
  void fetch() => print('$petName fetches the ball');

  @override
  void describe() {
    super.describe();
    print('Breed: $breed | Owner: $ownerName');
  }
}

// Specific narrow down
class Cat extends Pet {
  bool isIndoor;

  Cat({
    required String ownerName,
    required String petName,
    required double weight,
    required this.isIndoor,
  }) : super(
         name: 'Domestic Cat',
         species: 'Felis catus',
         weight: weight,
         ownerName: ownerName,
         petName: petName,
       );

  void purr() => print('$petName purrs 😻');
  void meow() => print('$petName: Meow!');

  @override
  void describe() {
    super.describe();
    print('Indoor: $isIndoor | Owner: $ownerName');
  }
}

// Wild animals
class WildAnimal extends Animal {
  String habitat;

  WildAnimal({
    required String name,
    required String species,
    required double weight,
    required this.habitat,
  }) : super(name: name, species: species, weight: weight);

  void hunt() => print('$name hunts in the $habitat');
  void roam() => print('$name roams through the $habitat');
}

// Specific narrow down
class Lion extends WildAnimal {
  int prideSize;

  Lion({required String name, required double weight, required this.prideSize})
    : super(
        name: name,
        species: 'Panthera leo',
        weight: weight,
        habitat: 'savanna',
      );

  void roar() => print('$name ROARS across the savanna!');
  void leadPride() => print('$name leads a pride of $prideSize lions');

  @override
  void describe() {
    super.describe();
    print('Pride size: $prideSize');
  }
}

void main() {
  Student student = Student(
    name: 'Martha',
    age: 16,
    gender: 'Female',
    school: 'Community High School',
    grade: "SS2",
  );
  Teacher teacher = Teacher(
    name: 'Mrs Oyeniyi',
    age: 48,
    gender: 'Female',
    subject: 'Biology',
    yearsExperience: 12,
  );
  PrefectStudent prefect = PrefectStudent(
    name: 'Tunde',
    age: 17,
    gender: 'Male',
    school: 'Community High School',
    grade: "SS3",
    prefectRole: 'Head Boy',
  );

  // All inherit speak, eat, and walk from Person
  student.speak();
  teacher.eat();
  prefect.walk();

  // Their own methods
  student.study();
  teacher.teach();
  prefect.presideOver();

  // introduce() builds on itself at each level
  print('\nPrefect Intro');
  prefect.introduce();

  print("\nTeacher Intro");
  teacher.introduce();

  print("\nStudent intro");
  student.introduce();

  // Animals
  print("\nAnimals\n");
  Dog dog = Dog(
    ownerName: 'Philip',
    petName: 'Mia',
    weight: 25.0,
    breed: 'Rottweiler',
  );

  Cat cat = Cat(
    ownerName: 'Cornelius',
    petName: 'Tewa',
    weight: 4.5,
    isIndoor: true,
  );

  Lion lion = Lion(name: 'Simba', weight: 300.0, prideSize: 12);

  // All inherit from Animal
  dog.sleep();
  cat.eat();
  lion.breathe();

  // Pet behaviour
  dog.cuddle();
  cat.play();

  // Specific behaviour
  dog.bark();
  cat.purr();
  lion.roar();

  dog.describe();
}
