void main() {
  // Variables and data types
  String name = "Thrinath";
  int age = 20;
  double percentage = 85.5;
  bool isStudent = true;

  // Arithmetic operation
  int a = 10;
  int b = 20;
  int sum = a + b;

  // Display values
  print("Dart Language Basics");
  print("--------------------");
  print("Name: $name");
  print("Age: $age");
  print("Percentage: $percentage");
  print("Is Student: $isStudent");
  print("Sum of $a and $b = $sum");

  // Calling a function
  print("Product of $a and $b = ${multiply(a, b)}");
}

// Function
int multiply(int x, int y) {
  return x * y;
}
