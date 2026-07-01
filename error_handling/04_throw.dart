// Throwing built-in types
void setAge(int age) {
  if (age < 0 || age > 150) {
    throw ArgumentError('Age must be between 0 and 150, you entered $age');
  }
  print('Age set to $age');
}

void setUsername(String username) {
  if (username.trim().isEmpty) {
    throw FormatException('Username cannot be empty or whitespace');
  }
  if (username.length < 3) {
    throw FormatException('Username must be at least 3 characters');
  }
  print('Username set to "$username"');
}

// Throwing a plain string-based Exception
void validateOrder(int quantity, double price) {
  if (quantity <= 0) {
    throw Exception('Quantity must be greater than zero');
  }
  if (price < 0) {
    throw Exception('Price cannot be negative');
  }
  print('Order valid: $quantity items at ₦$price each');
}

void main() {
  print('Age validation');
  try {
    setAge(30);
    setAge(-5); // throws ArgumentError
  } catch (e) {
    print('Error: $e');
  }

  print('\nUsername validation');
  try {
    setUsername('al'); // throws FormatException — too short
  } catch (e) {
    print('Error: $e');
    // Error: FormatException: Username must be at least 3 characters
  }

  print('\nOrder validation');
  try {
    validateOrder(0, 1500.0); // throws Exception
  } catch (e) {
    print('Error: $e');
  }
}
