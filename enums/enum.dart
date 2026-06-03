/* enum is a special type thats the creation of fixed set or collections of named constant values. Instead of using literal values, enum
provides a the values with a type, name, index, and in Dart, full OOP-like capabilities */

// Intro
enum Directions { north, south, east, west }

enum Status { success, failure, pending, closed }

enum Priority { low, medium, high, critical }

enum OrderStatus { placed, confirmed, shipped, delivered, cancelled }

enum TrafficLight { red, yellow, green }

void main() {
  String userName = "John";

  // Using literal values, error prone
  if (userName == "john") {
    print("Hello John");
  }

  // Using enum constant values
  Directions direction = Directions.west;

  if (direction == Directions.west) {
    print("On my way to the Western part of the world");
  } else if (direction == Directions.north) {
    print("On my way to the Northern part of the world");
  } else if (direction == Directions.south) {
    print("On my way to the Southern part of the world");
  } else if (direction == Directions.east) {
    print("On my way to the Eastern part of the world");
  }

  Status orderStatus = Status.pending;

  if (orderStatus == Status.pending) {
    print("Your order is pending, please wait...");
  } else if (orderStatus == Status.success) {
    print("Your order was successful!");
  } else if (orderStatus == Status.failure) {
    print("Your order failed, please try again.");
  } else if (orderStatus == Status.closed) {
    print("Your order is closed.");
  }

  Priority taskPriority = Priority.high;

  if (taskPriority == Priority.low) {
    print("This task has low priority.");
  } else if (taskPriority == Priority.medium) {
    print("This task has medium priority.");
  } else if (taskPriority == Priority.high) {
    print("This task has high priority(Resolve as soon as possible).");
  } else if (taskPriority == Priority.critical) {
    print("This task has critical priority(Resolve immediately).");
  }

  // Using switch statements
  TrafficLight light = TrafficLight.green;
  switch (light) {
    case TrafficLight.red:
      print("Stop");
    case TrafficLight.yellow:
      print("Ready");
    case TrafficLight.green:
      print("Go");
  }

  OrderStatus status = OrderStatus.delivered;
  switch (status) {
    case OrderStatus.placed:
      print(
          "Your order has been placed, awaiting confirmation");
    case OrderStatus.confirmed:
      print(
          "Your order has been confirmed, shipping process begins immediately");
    case OrderStatus.shipped:
      print("Your order has been shipped");
    case OrderStatus.delivered:
      print("Your order has been delivered. Please give a product review");
    case OrderStatus.cancelled:
      print("We are concerned about your order that was cancelled, please let us know why, to help us serve you better");
  }

  // Using switch expressions
  light = TrafficLight.yellow;
  var trafficMessage = switch (light) {
    TrafficLight.red => "Stop",
    TrafficLight.yellow => "Ready",
    TrafficLight.green => "Go",
  };
  print(trafficMessage);

  light = TrafficLight.red;
  trafficMessage = switch (light) {
    TrafficLight.red => "Stop",
    TrafficLight.yellow => "Ready",
    TrafficLight.green => "Go",
  };
  print(trafficMessage);

  light = TrafficLight.green;
  trafficMessage = switch (light) {
    TrafficLight.red => "Stop",
    TrafficLight.yellow => "Ready",
    TrafficLight.green => "Go",
  };
  print(trafficMessage);

  status = OrderStatus.confirmed;
  var cartStatusMessage = switch (status) {
    OrderStatus.placed => "Your order has been placed, awaiting confirmation",
    OrderStatus.confirmed =>
      "Congratulations! Your order has been confirmed. Shipping process begins immediately",
    OrderStatus.shipped => "Your order has been shipped",
    OrderStatus.delivered =>
      "Your order has been delivered. Please give a product review",
    OrderStatus.cancelled =>
      "We are concerned about your order that was cancelled, please let us know why, to help us serve you better",
  };

  print(cartStatusMessage);
}
