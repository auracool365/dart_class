//  late tells Dart "this variable is non-nullable, but I'm not ready to give it a value yet, trust me, it'll be set before
// anything actually tries to read it." Unlike a nullable type, a late variable is never treated as possibly-null in the type 
// system, it's a promise about timing, not about whether a value will exist.
class Recipe {
  late String summary; // will be computed once ingredients are known, not when object is being constructed

  void generateSummary(List<String> ingredients) {
    summary = 'Made with ${ingredients.join(", ")}';
  }
}

void main() {
  Recipe recipe = Recipe();
  recipe.generateSummary(['rice', 'tomato', 'pepper']);
  print(recipe.summary); // works, summary was set before being read
}