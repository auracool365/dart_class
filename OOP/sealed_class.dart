/* A sealed class creates a closed type hierarchy, allows only a fixed and controlled set of subclasses. All subclasses must
 be in the same file. The compiler knows every possible subtype — enabling exhaustive pattern matching.

It is used when something can exist in only a known number of states or versions.
Enums give a fixed set of constant value, Sealed class gives a fixed set of states that */

// Example 1
sealed class LoginState {}

class IdleState extends LoginState {}

class LoadingState extends LoginState {}

class SuccessState extends LoginState {}

class ErrorState extends LoginState {}

void show(LoginState state) {
  switch (state) {
    case IdleState():
      print('Waiting');

    case LoadingState():
      print('Loading');

    case SuccessState():
      print('Success');

    case ErrorState():
      print('Error');
  }
}

//Example 2
// Parent (fixed set of states)
sealed class Result<T> {}

// Success state
class Success<T> extends Result<T> {
  final T data;
  final String message;

  Success(this.data, {this.message = 'Operation successful'});
}

// Failure state
class Failure<T> extends Result<T> {
  final String error;
  final int code;

  Failure(this.error, {this.code = 0});
}

// Loading state
class Loading<T> extends Result<T> {
  final String status;

  Loading([this.status = 'Loading...']);
}

// Function returning ONE of the states
Result<String> fetchUsername(int userId) {
  if (userId <= 0) {
    return Failure('Invalid user ID', code: 400);
  }

  if (userId == 99) {
    return Failure('User not found', code: 404);
  }

  if (userId == 1) {
    return Success('John Doe');
  }

  return Success('User_$userId');
}

// Exhaustive switch (meaning no default (_) needed) because Dart already knows all
// possible subclasses of Result
void handleResult(Result<String> result) {
  switch (result) {
    case Success(:var data, :var message):
      print('SUCCESS: $message: $data');

    case Failure(:var error, :var code):
      print('ERROR: [$code] $error');

    case Loading(:var status):
      print('LOADING: $status');
  }
}

// Example 3
// Fixed possible states
sealed class OrderState {}

class Placed extends OrderState {}

class Preparing extends OrderState {
  final int minutes;

  Preparing(this.minutes);
}

class OnTheWay extends OrderState {
  final String riderName;

  OnTheWay(this.riderName);
}

class Delivered extends OrderState {}

class Cancelled extends OrderState {
  final String reason;

  Cancelled(this.reason);
}

// UI / business logic
void showOrder(OrderState state) {
  switch (state) {
    case Placed():
      print('Order received');

    case Preparing(:var minutes):
      print('Preparing... Ready in $minutes mins');

    case OnTheWay(:var riderName):
      print('Rider $riderName is coming');

    case Delivered():
      print('Delivered successfully');

    case Cancelled(:var reason):
      print('Order cancelled: $reason');
  }
}

// Generics example
// function
T add<T extends dynamic>(T a, T b) {
  return a + b;
}

// Class
class Box<T> {
  T value;

  Box(this.value);
}

void main() {
  show(LoadingState());
  show(SuccessState());
  print("");

  // Example 2
  handleResult(fetchUsername(1));

  handleResult(fetchUsername(99));

  handleResult(fetchUsername(-1));

  handleResult(Loading());

  // Example 3
  print("");
  showOrder(Placed());

  showOrder(Preparing(15));

  showOrder(OnTheWay('John'));

  showOrder(Delivered());

  showOrder(Cancelled('Restaurant closed'));
  print("");

  // Generics
  print(add(2, 3));
  print(add("hi", " Everyone"));

  Box<String> name = Box('John');

  Box<int> age = Box(20);

  print(name.value);

  print(age.value);
}
