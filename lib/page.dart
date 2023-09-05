import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'student_service.dart';
import 'model/student.dart';
import 'student_data.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<Student> freshman = [];
  List<Student> sophomore = [];
  Random random = Random();
  int count = 0;
  Student studentFreshman = Student(name: '', ID: 0);
  Student studentSophomore = Student(name: '', ID: 0);
  List<Widget> paringList = [];
  bool isLoad = false;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    StudentService service = StudentService();
    freshman = service.createClass(namesFreshman, IDsFreshman);
    sophomore = service.createClass(namesSophomore, IDsSophomore);

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 97, 103, 122),
        hoverColor: const Color.fromARGB(255, 39, 40, 41),
        onPressed: () {
          setState(() {
            isLoad = true;
            animationController.forward().then((value) {
              animationController.reset();
              setState(() {
                isLoad = false;
              });
            });
            int index = random.nextInt(sophomore.length);
            studentFreshman = freshman[count];
            studentSophomore = sophomore[index];
            paringList.add(
              Text(
                '${studentFreshman.ID} ${studentFreshman.name}',
                style: const TextStyle(
                  fontFamily: 'HanyiSentyTea',
                  fontSize: 20,
                ),
              ),
            );
            sophomore.removeAt(index);
            count++;
          });
        },
        child: Icon(Icons.local_attraction_outlined),
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
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('images/wife.png'),
                      backgroundColor: Colors.white,
                      radius: 80,
                    ),
                  ],
                ),
                SizedBox(
                  width: 80,
                ),
                Column(
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
            Visibility(
              visible: !isLoad,
              child: Center(
                child: Expanded(
                  child: ListView.builder(
                    itemCount: paringList.length,
                    itemBuilder: (context, index) {
                      return paringList[index];
                    },
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isLoad,
              child: Expanded(
                child: Lottie.network(
                    'https://lottie.host/3ce5ac25-f597-4c29-b8e6-7c7426b11d15/N9htv2NFEe.json',
                    controller: animationController),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
