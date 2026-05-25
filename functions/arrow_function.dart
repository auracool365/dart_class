// Arrow function is a concise function that computes a single statement or expression
// long form
/* int add(int a, int b) {
  return a + b;
} */

// Using arrow function
int add(int a, int b) => a + b;

String greet(String userName) =>
    "${userName.length > 5 ? "Hello" : "Hi"} $userName";

void intro(int id, String userName) => print("$id. My name is $userName");

void main() {
  dynamic result = add(2, 3);
  print(result);

  result = greet("John");
  print(result);

  List<String> names = ["Paul", "Damilola", "Ade", "Faith", "Olatunji"];
  print(names);

  for (String name in names) {
    print(greet(name));
  }

  //intro(1, "Peter");

  int i = 0;
  for (String name in names) {
    intro(i, name);
    i++;
  }
}
