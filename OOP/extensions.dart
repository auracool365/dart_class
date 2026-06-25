// Extension methods let you add new methods to existing types without modifying them or using inheritance. Adds
// functionality to an existing type.

bool findEven(int num) {
  return num % 2 == 0;
}

// Int
extension IntExtensions on int {
  bool get isEvenNumber {
    return this % 2 == 0;
  }

  int get squared {
    return this * this;
  }
}

// String
extension StringExtensions on String {
  // Capitalize every word
  String get titleCase {
    return split(' ')
        .map(
          (word) => word.isEmpty
              ? ''
              : word[0].toUpperCase() + word.substring(1).toLowerCase(),
        )
        .join(' ');
  }

  // Reverse text
  String get reversed {
    return split('').reversed.join('');
  }

  // Remove all spaces
  String get removeSpaces {
    return replaceAll(' ', '');
  }
}

// List
extension ListExtensions<T> on List<T> {
  T? get secondOrNull {
    return length >= 2 ? this[1] : null;
  }

  List<T> get withoutDuplicates {
    return toSet().toList();
  }
}

void main() {
  int age = 100;
  print(findEven(age));
  print(findEven(29));

  print("\nInt extension");
  print(age.isEvenNumber);
  print(90.squared);

  print("\nString extensions");
  print('hello world everyone says hi'.titleCase);
  print('dart'.reversed);
  print('hello world dart'.removeSpaces);

  print("\nList extensions");
  List<int> numbers = [1, 2, 2, 3, 4];

  print(numbers.secondOrNull);

  print(numbers.withoutDuplicates);

  List<String> names = ["Sam"];
  print(names.secondOrNull);
}
