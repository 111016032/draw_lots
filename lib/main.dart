import 'package:flutter/material.dart';
import 'page.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
// StudentService service = StudentService();
// final freshman = service.createClass(namesFreshman, IDsFreshman);
// final sophomore = service.createClass(namesSophomore,IDsSophomore);
// final random = Random();
// for(int i=0; i<45;i++){
//   int index = random.nextInt(sophomore.length);
//   final Student student  = sophomore[index];
//   sophomore.removeAt(index);
//   print('${freshman[i].name} : ${student.name}');
// }
