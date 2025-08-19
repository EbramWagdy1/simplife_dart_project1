import 'main.dart';
import 'dart:io';

enum Dept {
  CS,
  IT,
  IS,
  AC,
  Notfound
}

void main() {
  // header app
  const name = "Student Information Manager";
  var line = StringBuffer();
  line.writeAll(List.filled(200, "-"));
  print("${name.padLeft(40, '\t')}\n $line ");

  List stu=[];

  while (true) {
    print("1. Add Student");
    print("2. Show All Students");
    print("3. Search Student by Name (RegExp)");
    print("4. Display Statistics");
    print("5. Save to File");
    print("6. Load from File");
    print("7. Display Sorted Students");
    print("8. Demonstrate StringBuffer & Escape Sequences");
    print("0. Exit");
    print("Choose: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        stdout.write("Please Enter Number of Student:\t");
        var count = int.parse(stdin.readLineSync()!);

        var addstudent = List.generate(count, (index) {
          int studentnumber = index + 1;
          stdout.write("Enter Name Of Student:\t");
          String name = stdin.readLineSync()!;
          stdout.write("Enter Your Age:\t");
          int age = int.parse(stdin.readLineSync()!);
          stdout.write("Enter department (CS, IT, IS, AC): ");
          String dep = stdin.readLineSync()!;
          var dept = Dept.values.firstWhere(
                (d) =>d.toString().split('.').last.toLowerCase() == dep.toLowerCase(),
            orElse: () => Dept.Notfound,
          );
          return (name: name, age: age, dep: dept);
        });
        stu.addAll(addstudent);
       break;
      case"2":
        print(line);
        print("Students Data:\n");
        for (var student in stu) {
          print(
            "Name: ${student.name}, Age: ${student.age}, Department: ${student.dep.toString().split('.').last}",
          );
        }
        print(line);

       break;

    }
  }
}
