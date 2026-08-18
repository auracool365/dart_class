// List<String>? and List<String?> look almost identical and mean completely different things:
// List<String>? the list itself might be null, but if it exists, every item inside it is guaranteed to be a real String.
// List<String?> the list itself is guaranteed to exist, but individual items inside it might not be a String.
void main() {
  List<String>? maybeList; // List might not exist
  print(maybeList); // null
  print(maybeList?.length); // null, safe access needed on the list itself

  List<String?> listOfMaybeElements = [
    'Rice',
    null,
    'Beans',
  ]; // List exists, elements might not
  print(listOfMaybeElements.length); // 3, list itself is real
  print(listOfMaybeElements[1]); // null this specific element is null
  print(
    listOfMaybeElements[1]?.toUpperCase() ?? 'Missing element',
  ); // safe access needed on the element
}