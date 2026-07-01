// Defining custom exceptions
class ValidationException implements Exception {
  final String field;
  final String reason;

  ValidationException(this.field, this.reason);

  @override
  String toString() => 'ValidationException: $field — $reason';
}

class NetworkException implements Exception {
  final int statusCode;
  final String endpoint;

  NetworkException(this.statusCode, this.endpoint);

  @override
  String toString() => 'NetworkException: $statusCode at $endpoint';

  // Custom exceptions can have their own logic too
  bool get isServerError => statusCode >= 500;
  bool get isClientError => statusCode >= 400 && statusCode < 500;
}

class InsufficientStockException implements Exception {
  final String productName;
  final int requested;
  final int available;

  InsufficientStockException({
    required this.productName,
    required this.requested,
    required this.available,
  });

  @override
  String toString() =>
      'Only $available "$productName" left, but $requested requested';
}

// Functions that throw these custom exceptions
void validateRegistration(String email, String password) {
  if (!email.contains('@')) {
    throw ValidationException('email', 'must contain @ symbol');
  }
  if (password.length < 8) {
    throw ValidationException('password', 'must be at least 8 characters');
  }
  print('Registration data valid for $email');
}

void simulateApiCall(int statusCode, String endpoint) {
  if (statusCode >= 400) {
    throw NetworkException(statusCode, endpoint);
  }
  print('API call to $endpoint succeeded');
}

void purchaseProduct(String name, int requested, int available) {
  if (requested > available) {
    throw InsufficientStockException(
      productName: name,
      requested: requested,
      available: available,
    );
  }
  print('Purchased $requested x $name');
}

void main() {
  print('Registration validation');
  try {
    validateRegistration('aliceexample.com', 'pass123');
  } on ValidationException catch (e) {
    print('Registration failed: $e');
    print('Field that failed: ${e.field}'); // direct access to structured data
  }

  print('\nNetwork call');
  try {
    simulateApiCall(503, '/api/products');
  } on NetworkException catch (e) {
    print('Request failed: $e');
    if (e.isServerError) {
      print('This is a server problem: try again later');
    } else if (e.isClientError) {
      print('This is a client problem: check your request');
    }
  }

  print('\nStock check');
  try {
    purchaseProduct('Laptop', 5, 2);
  } on InsufficientStockException catch (e) {
    print('Purchase failed: $e');
    print('You can only buy ${e.available} units');
  }

  print(10 ~/ 0);
}
