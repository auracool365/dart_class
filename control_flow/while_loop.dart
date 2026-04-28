void main() {
  // while(condition)
  int count = 1;
  while (count <= 10) {
    print(count);
    count++;
  }

  print('\nCount Down');
  count = 5;
  // Count down
  while (count > 0) {
    print(count);
    count--;
  }

  // Check if word is a palindrome
  String word = "deed";
  int left = 0;
  int right = word.length - 1;
  while (left <= right) {
    if (word[left] != word[right]) {
      print("$word is not a palindrome");
      return;
    }
    left++;
    right--;
  }
  print("$word is a palindrome");

  // password trial
  int attempts = 1;
  while (attempts <= 3) {
    print("Try again");
    attempts++;
  }
}
