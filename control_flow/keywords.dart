void main() {
  // break (Exits the loop completely)
  for (int i = 1; i <= 10; i++) {
    print(i);
    if (i == 5) {
      break;
    }
  }

  // continue (skips the current iteration)
  print('Continue');
  for (int i = 1; i <= 10; i++) {
    if (i % 2 == 0) {
      continue;
    }
    print(i);
  }
}
