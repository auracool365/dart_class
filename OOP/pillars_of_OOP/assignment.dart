// Abstraction: abstract base class nobody instantiates
abstract class Staff {
  // Encapsulation: private properties
  String _name;
  String _staffId;
  double _salary;
  String department;

  Staff({
    required String name,
    required String staffId,
    required double salary,
    required this.department,
  }) : _name = name,
       _staffId = staffId,
       _salary = salary;

  // Encapsulation: read-only getters
  String get name => _name;
  String get staffId => _staffId;

  String get currentTime {
    final now = DateTime.now();

    final hour = now.hour > 12
        ? now.hour - 12
        : (now.hour == 0 ? 12 : now.hour);

    final period = now.hour >= 12 ? 'PM' : 'AM';

    return '$hour:${now.minute.toString().padLeft(2, '0')} $period';
  }

  // Abstraction: every Staff subclass must implement the abstract methods
  void work();
  String get jobTitle;

  // Concrete shared behaviour
  void clockIn() => print('[$staffId] $name clocked in at $currentTime');

  void clockOut() => print('[$staffId] $name clocked out at $currentTime');

  void introduce() {
    print(
      'I am $name, $jobTitle in the $department department on a \$$_salary salary',
    );
  }
}

// Inheritance: all extend Staff
class Doctor extends Staff {
  String specialization;
  int patientsSeen = 0;

  Doctor({
    required String name,
    required String staffId,
    required double salary,
    required this.specialization,
  }) : super(
         name: name,
         staffId: staffId,
         salary: salary,
         department: 'Medical',
       );

  // Polymorphism: Doctor's implementation version of work()
  @override
  void work() {
    patientsSeen++;
    print('Dr. $name is diagnosing patient #$patientsSeen ($specialization)');
  }

  @override
  String get jobTitle => 'Dr. - $specialization Specialist';

  void prescribe(String medication) {
    print('Dr. $name prescribes $medication');
  }
}

class Nurse extends Staff {
  String ward;

  Nurse({
    required String name,
    required String staffId,
    required double salary,
    required this.ward,
  }) : super(
         name: name,
         staffId: staffId,
         salary: salary,
         department: 'Nursing',
       );

  // Polymorphism: Doctor's implementation version of work()
  @override
  void work() {
    print('Nurse $name is administering medication in $ward ward');
  }

  @override
  String get jobTitle => 'Registered Nurse: $ward Ward';

  void takeVitals(String patientName) {
    print('Nurse $name is taking vitals for $patientName');
  }
}

class Receptionist extends Staff {
  int appointmentsBooked = 0;

  Receptionist({
    required String name,
    required String staffId,
    required double salary,
  }) : super(
         name: name,
         staffId: staffId,
         salary: salary,
         department: 'Administration',
       );

  // Polymorphism: Doctor's implementation version of work()
  @override
  void work() {
    appointmentsBooked++;
    print('$name books appointment #$appointmentsBooked and welcomes patients');
  }

  @override
  String get jobTitle => 'Head Receptionist';

  void answer() => print('$name answers: "Good morning, City Hospital!"');
}

void main() {
  // Polymorphism in usage: same list, same calls, different results
  List<Staff> hospitalStaff = [
    Doctor(
      name: 'Adefokun Imri',
      staffId: 'DOC-001',
      salary: 500000,
      specialization: 'Orthopaedic',
    ),
    Doctor(
      name: 'Ifeoma Oge',
      staffId: 'DOC-002',
      salary: 480000,
      specialization: 'Paediatrics',
    ),
    Nurse(
      name: 'Blessing Okoro',
      staffId: 'NRS-001',
      salary: 180000,
      ward: 'Emergency',
    ),
    Nurse(
      name: 'Usman Garba',
      staffId: 'NRS-002',
      salary: 175000,
      ward: 'Maternity',
    ),
    Receptionist(name: 'Chioma Eze', staffId: 'REC-001', salary: 120000),
  ];

  print('\nBUTH: Morning Shift');

  // Every staff member clocks in: inherited from Staff
  for (Staff member in hospitalStaff) {
    member.clockIn();
  }

  print('\nStaff introductions');
  for (Staff member in hospitalStaff) {
    member.introduce();
  }

  print('\nStaff at work');
  for (Staff member in hospitalStaff) {
    member.work();
    member.work();
  }

  print('\nEnd of shift');
  for (Staff member in hospitalStaff) {
    member.clockOut();
  }
}
