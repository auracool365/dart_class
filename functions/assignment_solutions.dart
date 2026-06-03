int fib(int num) {
  if (num < 0) {
    print("fibonacci terms must not be a negative number");
    return 0;
  }
  if (num <= 1) {
    return num;
  }

  return fib(num - 1) + fib(num - 2);
}

void countDown(int num) {
  print("Count Down: $num");
  if(num > 0){
    countDown(num - 1);
  }
  print("Count Up: $num");
}

void main() {
  print(fib(8));
  print(fib(20));
  print(fib(15));

  countDown(5);
}
