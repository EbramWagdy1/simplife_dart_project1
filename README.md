# 🏆 THE FIRST DART PROJECT AT SIMPLIFE EG  

---

## 🎓 Student Information Manager (Console App)
This is a Dart console application that manages student information. The program allows users to add, search, display, and save/load students with support for collections, file I/O, and string formatting.

## 🛠 Features Implemented
1. Add Student → Enter multiple students (name, age, department). Department handled as an enum (CS, IT, IS, AC, Notfound).
2. Show All Students → Display students in formatted output like: Name: Ali , Age: 20 , Dept: Dept.CS
3. Search Student by Name (RegExp) → Search is case-insensitive using regular expressions.
4. Display Statistics → Total number of students, Minimum and maximum age (using a record), Distinct departments (using Set).
5. Save to File → Saves all students to students.txt in the format: {Name: Ali, Age: 20, Dept: Dept.CS}
6. Load from File → Reads back from students.txt and rebuilds the student list, handling invalid departments with Dept.Notfound.
7. Display Sorted Students → Uses SplayTreeSet to display students ordered by name.
8. Exit → Gracefully terminates the program.

## 📂 Data Format Example (students.txt)
{Name: Ali, Age: 20, Dept: Dept.CS}  
{Name: Sara, Age: 22, Dept: Dept.IT}  
{Name: Mona, Age: 19, Dept: Dept.AC}  
{Name: Omar, Age: 23, Dept: Dept.IS}  

## 📊 Example Output
### Menu
1. Add Student  
2. Show All Students  
3. Search Student by Name (RegExp)  
4. Display Statistics  
5. Save to File  
6. Load from File  
7. Display SplayTreeSet  
0. Exit  

### Show Students
Students Data:  
Name: Ali , Age: 20 , Dept: Dept.CS  
Name: Sara , Age: 22 , Dept: Dept.IT  

### Statistics
Total students: 4  
The Min Age: 19  
The Max Age: 23  
Departments: {Dept.CS, Dept.IT, Dept.AC, Dept.IS}  

## 🧑‍💻 Technologies Used
Language: Dart  
Collections: List, Set, SplayTreeSet  
File I/O: Read/Write using dart:io  
StringBuffer: For formatted output  
RegExp: For searching students by name  
Records: For min/max age  

## ▶️ How to Run
1. Install Dart SDK.  
2. Save the code in a file (e.g., main.dart).  
3. Run in terminal: dart main.dart  
4. Follow the interactive menu.  

## 🚀 Future Improvements
- Add input validation for age (only positive numbers).  
- Allow partial name search (instead of exact matches).  
- Support deleting/updating student data.  
- Enhance file format to JSON for better structure.  
