void main() {
  // Strings are sequence of characters enclosed inside quotes (either single or double). In Dart, String are immutable,
  // which means any operation to modify the string creates a new copy. Lastly, Strings in Dart are UTF-16 encoded and decoded
  // which means we can use the decimal code of the string characters as runes
  print("Hello World");
  String userName = "John";
  String userPassword = '123abc&';
  var multiLineText = """ This is a
  multiline
  text""";
  var word = 'Hello';

  print(userName);
  print(userPassword);
  print(multiLineText);
  print(word);

  var question = "How's your day going?";
  print(question);

  question = 'Hope you\'re fine';
  print(question);

  // String concatenation
  var message = 'Hello' + ' ' + 'World';
  print(message);
  print("2" + " 2");

  message =
      'How '
      'are'
      ' you';
  print(message);

  // String interpolation
  String word1 = 'Hi';
  userName = "Adeleke";
  String greet = '$word1 $userName, how\'s your day going?';
  print(greet);

  userName = "Faith";
  greet = '${userName.length >= 5 ? "Hi $userName" : "Hello $userName"}';
  print(greet);

  // Index
  //.              c  a  s  s  a  v  a
  // index       = 0  1  2  3  4  5  6
  // last index  = string.length - 1

  word = 'Hello';
  print(word);
  print(word[0]);
  print(word[2]);

  print(word[word.length - 1]);
  print(word[word.length - 4]);

  // runes
  word1 = "Paul";
  print(word1.runes);
}
