// 1. Optional Positional parameters allow us to specify arguments that can be safely ignored by the caller of the function
int add(int a, int b) {
  return a + b;
}

void main() {
  int result = add(2, 3);
  print(result);

  print(add(3, 6));
}
