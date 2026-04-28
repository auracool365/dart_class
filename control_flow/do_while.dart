import 'dart:io';

void main() {
  int count = 0;
  do {
    print(count);
    count++;
  } while (count <= 10);

  // count down
  print("\n CountDown");
  count = 5;
  do {
    print(count);
    count--;
  } while (count > 0);

  //
  int? num;

  do {
    stdout.write('Enter a number: ');
    num = int.parse(stdin.readLineSync()!);

    if (num == 100) {
      print('$num is equal to 100. Please, try again');
    } else if (num < 100) {
      print('$num is less than 100. Please, try again');
    } else {
      print(
        '$num is greater than 100. Congratulations, you have exited the loop',
      );
    }
  } while (num <= 100);
}
