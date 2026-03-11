import 'dart:io';

void main() {
  List<Map<String, dynamic>> students = [];

  print("=== Student Record Management System ===");

  while (true) {
    stdout.write("\nEnter student name (or type 'exit' to stop): ");
    String name = stdin.readLineSync()!;
    if (name.toLowerCase() == 'exit') break;

    stdout.write("Enter student ID: ");
    String id = stdin.readLineSync()!;

    // Check for unique ID
    bool idExists = students.any((student) => student['id'] == id);
    if (idExists) {
      print("⚠️ This ID already exists! Please enter a unique ID.");
      continue;
    }

    stdout.write("Enter student score (0-100): ");
    double score = double.parse(stdin.readLineSync()!);

    // Determine grade
    String grade;
    if (score >= 80) {
      grade = 'A+';
    } else if (score >= 70) {
      grade = 'A';
    } else if (score >= 60) {
      grade = 'A-';
    } else if (score >= 50) {
      grade = 'B';
    } else if (score >= 40) {
      grade = 'C';
    } else if (score >= 33) {
      grade = 'D';
    } else {
      grade = 'F';
    }

    // Store record
    students.add({
      'name': name,
      'id': id,
      'score': score,
      'grade': grade,
    });

    print("✅ Student added successfully!");
  }

  // Check if list is empty
  if (students.isEmpty) {
    print("\nNo student records entered!");
    return;
  }

  // Sort by score descending
  students.sort((a, b) => b['score'].compareTo(a['score']));

  print("\n=== Student Records (Sorted by Score) ===");
  for (var student in students) {
    print(
        "Name: ${student['name']}, ID: ${student['id']}, Score: ${student['score']}, Grade: ${student['grade']}");
  }

  // Calculate stats
  double highest = students.first['score'];
  double lowest = students.last['score'];
  int total = students.length;

  print("\n=== Summary ===");
  print("Total Students: $total");
  print("Highest Score: $highest");
  print("Lowest Score: $lowest");
}
