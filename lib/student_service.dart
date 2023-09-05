import 'model/student.dart';

class StudentService {
  List<Student> students = [];

  List<Student> createClass(List<String> names, List<int> IDs) {
    List<Student> students = [];
    for(int i = 0; i < IDs.length; i++) {
      students.add(Student(name: names[i], ID: IDs[i]));
    }
    return students;
  }

  List<Student> createSophomoreClass(List<String> names, List<int> IDs, List<int> family) {
    List<Student> students = [];
    for(int i = 0; i < IDs.length; i++) {
      students.add(Student(name: names[i], ID: IDs[i], family: family[i]));
      print('${students[i].name}, ${students[i].family}');
    }
    return students;
  }
}