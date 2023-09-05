import 'model/student.dart';

class StudentService {
  List<Student> students = [];

  List<Student> createClass(List<String> names, List<int> IDs) {
    for(int i = 0; i < IDs.length; i++) {
      students.add(Student(name: names[i], ID: IDs[i]));
    }
    return students;
  }


}