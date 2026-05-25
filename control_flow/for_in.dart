void main() {
  // for in
  List<String> fruits = ['Apple', 'Dates', 'Watermelon', 'Orange'];
  //for (int i = 0; i < fruits.length; i++) {
  //  print('$i. ${fruits[i]}');
  //}

  int count = 0;
  for (var fruit in fruits) {
    print('$count. $fruit');
    count++;
  }

  List<String> names = ["Paul", "Dami", "Ade", "Faith", "Ola"];
  print(names);

  count = 0;
  for (var name in names) {
    print('$count. $name');
    count++;
  }
}
