// Example 2. SQL simulation
class QueryBuilder {
  // Database table
  final List<Map<String, dynamic>> _users = [
    {'name': 'John', 'email': 'john@gmail.com', 'age': 22, 'active': true},
    {'name': 'Ade', 'email': 'ade@gmail.com', 'age': 16, 'active': true},
    {'name': 'Mike', 'email': 'mike@gmail.com', 'age': 35, 'active': true},
    {'name': 'Sarah', 'email': 'sarah@gmail.com', 'age': 28, 'active': true},
  ];

  List<String> _columns = [];
  bool _adultOnly = false;
  bool _activeOnly = false;
  int? _limit;

  QueryBuilder select(List<String> cols) {
    _columns = cols;
    return this;
  }

  QueryBuilder adultsOnly() {
    _adultOnly = true;
    return this;
  }

  QueryBuilder activeOnly() {
    _activeOnly = true;
    return this;
  }

  QueryBuilder limit(int n) {
    _limit = n;
    return this;
  }

  List<Map<String, dynamic>> execute() {
    List<Map<String, dynamic>> result = List.from(_users);

    if (_adultOnly) {
      result = result.where((u) => u['age'] >= 18).toList();
    }

    if (_activeOnly) {
      result = result.where((u) => u['active']).toList();
    }

    if (_limit != null) {
      result = result.take(_limit!).toList();
    }

    if (_columns.isNotEmpty) {
      result = result.map((user) {
        return {for (var col in _columns) col: user[col]};
      }).toList();
    }

    return result;
  }
}

void main() {
  // Without Cascades
  print("Without Cascades");
  List<String> names = [];
  names.add('John');
  names.add('Mary');
  names.add('Mike');
  names.add('Ade');
  names.add('Tunde');
  names.shuffle();

  print(names);

  // With Cascades
  print("\nWith Cascades");
  List<String> userNames = []
    ..add('Sam')
    ..add('Alex')
    ..sort();

  print(userNames);

  // SQL simulation
  print('Query:');
  print(
    'SELECT name, email FROM users WHERE age >= 18 AND active = true LIMIT 2: ',
  );

  // Without cascade
  QueryBuilder qb = QueryBuilder();
  print("SQL commands without cascades");
  qb.select(['name', 'email']);
  qb.adultsOnly();
  qb.activeOnly();
  qb.limit(4);

  print(qb.execute());

  print('');

  // With cascade
   print("SQL commands with cascades");
  List<Map<String, dynamic>> users =
      (QueryBuilder()
            ..select(['name', 'email'])
            ..adultsOnly()
            ..activeOnly()
            ..limit(4))
          .execute();

  print(users);
}
