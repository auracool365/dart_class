void main() {
  List<List<int>> nums = [
    [75, 76, 77],
    [85, 86, 87],
    [95, 96, 97],
  ];
  print(nums);

  List<List<String>> animals = [
    ["Owl", "Eagle", "Falcon"],
    ["Whale", "Shark", "Oyster"],
  ];
  print(animals);
  print(animals[0][1]);
  print(animals[1][2]);

  int rows = 2;
  int cols = 3;
  List<List<int>> matrix = List.generate(
    rows,
    (i) => List.generate(cols, (j) => i + j),
  );
  print(matrix);

  // [[0, 1, 2], [0, 1, 2]];
}
