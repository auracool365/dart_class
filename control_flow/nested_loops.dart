void main() {
  /* for (int i = 0; i <= 5; i++) {
    for (int j = 0; j <= 5; j++) {
      print("i = $i, j = $j");
    }
  } */

  // Right-angled triangle

  /* for (int i = 1; i <= 6; i++) {
    String row = '';
    for (int j = 1; j <= i; j++) {
      row += '@';
    }
    print(row);
  } */

  int rows = 6;
  int i = 1;

  while (i <= rows) {
    String spaces = ' ' * (rows - i);
    String stars = '*' * (2 * i - 1);
    String row = spaces + stars;
    print(row);
    i++;
  }
  /* ' ' * (rows - i)  6 - 1 = 5 spaces, 6 - 2 = 4 spaces, 6 - 3 = 3 spaces
   '     '
   '    '
   '   '
   '  '
   ' '
   */
}
