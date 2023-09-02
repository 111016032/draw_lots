import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'student_service.dart';
import 'model/student.dart';
import 'student_data.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Student> freshman = [];
  List<Student> sophomore = [];
  Random random = Random();
  int count = 0;
  Student studentFreshman = Student(name: '000', ID: 0);
  Student studentSophomore = Student(name: '00', ID: 0);
  List<Widget> paringList = [];
  bool isLoad = false;

  @override
  void initState() {
    super.initState();
    StudentService service = StudentService();
    freshman = service.createClass(namesFreshman, IDsFreshman);
    sophomore = service.createClass(namesSophomore, IDsSophomore);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isLoad = true;
            int index = random.nextInt(sophomore.length);
            studentFreshman = freshman[count];
            studentSophomore = sophomore[index];
            paringList
                .add(Text('${studentFreshman.ID} ${studentSophomore.name}'));
            sophomore.removeAt(index);
            count++;
            isLoad = false;
          });
        },
        child: Icon(Icons.crop_square),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 39, 40, 41),
        title: Text(
          'Freshman & Sophomore',
          style: GoogleFonts.getFont('Monofett', fontSize: 35),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 246, 224),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('images/wife.png'),
                      backgroundColor: Colors.white,
                      radius: 80,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 80,
                ),
                const Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('images/bacteria.jpeg'),
                      backgroundColor: Colors.white,
                      radius: 80,
                    ),
                  ],
                ),
              ],
            ),
            !isLoad
                ? Expanded(
                    child: ListView.builder(
                      itemCount: paringList.length,
                      itemBuilder: (context, index) {
                        return paringList[index];
                      },
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ],
        ),
      ),
    );
  }
}
