import 'dart:io';

void main() {
  stdout.write("Enter your age: ");
  int age = int.parse(stdin.readLineSync()!);

  // ternary syntax: condition ? evaluation if true : evaluation if false
  String votingNotification = age >= 18
      ? "You are eligible to vote(Go get your PVC)"
      : "You are underage";

  print(votingNotification);

  int num = int.parse(stdin.readLineSync()!);
  print("$num is ${num % 2 == 0 ? "even" : "odd"}");

  // nested ternary(not encouraged)
  int voterAge = 30;
  bool isCitizen = true;
  bool hasVoterCard = true;

  // Logic not correct currently, fix as assignment
  String votingStatus = isCitizen == true
      ? "You must be a citizen to vote"
      : voterAge <= 18
      ? "You are not old enough"
      : hasVoterCard == !true
      ? "Get you PVC"
      : "You are eligible to vote";

  print(votingStatus);

  int num1 = 80, num2 = 90;
  int max = num1 > num2 ? num1 : num2;
  print(max);

  bool isLoggedIn = !false;
  String loginStatus = isLoggedIn == true ? "User online" : "User offline";
  print(loginStatus);
}
