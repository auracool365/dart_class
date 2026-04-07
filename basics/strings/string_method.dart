void main() {
  String word1 = "Hello", word2 = "world";

  // properties
  print(word1.length);
  print(word1.isEmpty);
  print(word1.isNotEmpty);
  print(word1.runes.toList());

  print(word2.length);

  // methods
  // .toUpperCase()
  var word3 = word1.toUpperCase();
  print(word3);
  print(word1);
  print(identical(word1, word3));

  print("sam".toUpperCase());

  // .toLowerCase()
  word3 = word3.toLowerCase();

  print(word3);

  // .trim()
  String word4 = "   Hi.   ";
  print(word4);
  print(word4.trim());

  // .contains()
  word3 = "Hello";
  print(word3.contains('el'));
  print(word3.contains('al'));

  // .startsWith()
  String word = "Cornelius";
  print(word.startsWith('Cor'));
  print(word.startsWith('Car'));

  // .endsWith()
  print(word.endsWith('lius'));
  print(word.endsWith('liu'));

  // .split()
  word = "How are you doing?";
  print(word.split("")); // splits into individual character
  print(word.split(" ")); // splits into individual words

  // .subString()
  int stoppingIndex = 16;
  String secondPerson = word.substring(12, stoppingIndex + 1);
  print(secondPerson);

  print(word.substring(8));

  // .replaceAll()
  print('Hello'.replaceAll('e', 'a'));
  print('Hello'.replaceAll('ell', 'arr'));

  // .indexOf()
  print("Word".indexOf('w'));
  print("Word".indexOf('W'));
  print("Word".indexOf('o'));

  String userName = "John";
  print(userName.indexOf(RegExp('[A-Z][a-z]')));

  userName = "123John";
  print(userName.indexOf(RegExp('[A-Z][a-z]')));
}
