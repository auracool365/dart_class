import 'dart:io';

/* 
Asynchronous programming in Dart is a mechanism that allows your program to initiate time-consuming operations, such 
as fetching data over a network, writing to a database, or reading a file, simultaneously executing other tasks 
while waiting for those operations to finish. Dart executes code in a single-threaded architecture by default, blocking
operations would completely freeze your entire application or user interface. Asynchronous programming keeps your 
software fast and responsive by deferring heavy tasks to an internal scheduler

Blocking operations freeze the execution thread usually the main UI thread until the task is complete, making apps 
unresponsive.

Non-blocking operations allow Dart to pause a waiting task, execute other code, and resume the original task 
later, resulting in fluid, uninterrupted multitasking
 */

// Synchronous Blocking operations
void loadPrivateChatsWithoutAsync() {
  print("Private chat loading...");

  sleep(Duration(seconds: 1));

  print("Private chats done loading");
}

void loadGroupsChatsWithoutAsync() {
  print("Group chat loading...");

  sleep(Duration(seconds: 5));

  print("Group chats done loading");
}

// Asynchronous non-blocking operations
Future<void> loadPrivateChatsWithAsync() async {
  print("Private chat loading...");

  await Future.delayed(Duration(seconds: 1));

  print("Private chats done loading");
}

Future<void> loadGroupsChatsWithAsync() async {
  print("Group chat loading...");

  await Future.delayed(Duration(seconds: 5));

  print("Group chats done loading");
}

void main() async {
  print("Synchronous Execution");
  /* print("Hello John and James");
  for(int i = 1; i <= 1_000_000_000; i++) {
    // Blocks the greeting of Ade
  }
  print("Hello Ade"); */

 /* 
 print("Opened App");

  loadPrivateChatsWithoutAsync();

  loadGroupsChatsWithoutAsync();

  print("Other things in the UI Blocked, app becomes non-responsive"); */

  print("\nAsynchronous Execution");
  print("Opened App");

  loadPrivateChatsWithAsync();

  loadGroupsChatsWithAsync();

  print("Other things in the UI continues to execute, app is responsive");
}
