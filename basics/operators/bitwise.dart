void main() {
  // Bitwise operators are used to manipulate values on the bit level
  int a = 2; // 0010
  int b = 3; // 0011

  // AND &
  print(a & b); // 0010

  // OR |
  print(a | b); // 0011

  // XOR ^
  print(a ^ b); // 0001

  // NOT ~ -(x + 1)
  print(~a); // 1101

  // left shift
  print(a << 1); // 0100

  // right shift
  print(b >> 1); // 0001
}
