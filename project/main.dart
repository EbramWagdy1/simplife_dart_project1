
import 'dart:collection';
import 'dart:convert';
import 'dart:io';

// creat Department as enum and add notfound value is a defult value if user not chose
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

  //creat line as string Buffer
  var line = StringBuffer();
  line.writeAll(List.filled(200, "-"));



  //print header in middel and new line to print line
  print("${name.padLeft(40, '\t')}\n $line ");

  //creat Empty  to add student information
  List stu=[];

  //use while and switch to infinite loop if condition=true
  while (true) {

    //print menu to user
    print("1. Add Student");
    print("2. Show All Students");
    print("3. Search Student by Name (RegExp)");
    print("4. Display Statistics");
    print("5. Save to File");
    print("6. Load from File");
    print("7. Display SplayTreeSet");
    print("0. Exit");
    print("Choose: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      //case 1 to add information and return value to stu.list
      case "1":
        print(line);
        stdout.write("Please Enter Number of Student:\t");
        var count = int.parse(stdin.readLineSync()!);

        var addstudent = List.generate(count, (index) {
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
          return (name: name.toLowerCase(), age: age, dep: dept);
        });
        stu.addAll(addstudent);
        print(line);
        break;

        //case 2 to take data from stu and output
      case"2":
        print(line);
        print("Students Data:\n");
        var output=stu.map((s)=>"Name: ${s.name.padRight(10)}, Age: ${s.age.toString().padRight(3)}, Dept: ${s.dep.toString()}").join("\n"); //.tostring to padding
        print(output);
        print(line);


       break;
       // case 3 to take name from user and search and print data if search = true
      case "3":
        print(line);
        stdout.write("Enter Name Of Student:\t");
        String n = stdin.readLineSync()!;
        final r = RegExp("^${n.toLowerCase()}\$");
        var results = stu.where((s) => r.hasMatch(s.name)).toList();
        var out=results.map((s)=>"Name: ${s.name}, Age: ${s.age}, Dept: ${s.dep}");
        print(out);
        print(line);
        break;
        //case 4 Display statics total stu , min/max age ,dept
      case "4":
        print(line);
        print("Total students: ${stu.length}");
        
        var ages=stu.map((s)=> s.age).toList();
        var minAge=ages.reduce((a, b) => a < b ? a : b);
        var maxAge=ages.reduce((a, b) => a > b ? a : b);
        var ageR=(minAge,maxAge);
        print("The Min Age: ${ageR.$1}");
        print("The Max Age: ${ageR.$2}");
        
        
        var depts=stu.map((s)=>s.dep).toSet();
        print("Departments: ${depts}");

        print(line);
        break;

        //case 5 take data from list stu and save as a json file
      case "5":
        print(line);
        dynamic file=File("students.json");
        dynamic data=stu.map((s)=>{
          "Name": s.name,
          "Age": s.age,
          "Dept": s.dep.toString()                   //json not know enum
        }).toList();
        file.writeAsStringSync(jsonEncode(data));   //save data as json
        print("Students saved to file successfully!");
        print(line);
        break;

        //case 6 take data from file(load) and save as stu and students.json
      case"6":
        print(line);
        dynamic file=File("loadfile.json");
        if(file.existsSync()){
          String contant=file.readAsStringSync();
          List<dynamic>data= jsonDecode(contant);
          stu=data.map((s){
            var dept = Dept.values.firstWhere(
                  (d) => d.toString().split('.').last.toLowerCase() == s["dep"].toString().toLowerCase(),
              orElse: () => Dept.Notfound,
            );
            return (
            name: (s["name"] ?? "").toString().toLowerCase(),
            age: s["age"] ?? 0,
            dep: dept
            );


          }).toList();
          print("Students loaded from file successfully!");


        } else{
          print("No saved file found!");
        }
        print(line);
        break;

        //case 7 Sorted by Name (SplayTreeSet)
      case"7":
        print(line);
        print("Students Sorted by Name (SplayTreeSet):\n");
        var splay = SplayTreeSet<({String name, int age, Dept dep})>.from(
          stu,
              (a, b) => a.name.compareTo(b.name),
        );
        var output = splay.map((s) => "Name: ${s.name.padRight(10)}, Age: ${s.age.toString().padRight(3)}, Dept: ${s.dep}").join("\n");
        print(output);
        print(line);
        break;

        //case 0 to Exit program
      case "0":
        print("Exiting program...");
        exit(0);

       //if user chose invalid choice
      default: print("Invalid choice, try again!");









    }
  }
}
