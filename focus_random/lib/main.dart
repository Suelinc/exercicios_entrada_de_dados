import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const Foco());
}

class Foco extends StatefulWidget {
  const Foco({Key? key}) : super(key: key);

  @override
  State<Foco> createState() => _FocoState();
}

class _FocoState extends State<Foco> {
  TextEditingController firstNumberControl = TextEditingController();
  TextEditingController secondNumberControl = TextEditingController();
  TextEditingController thirdNumberControl = TextEditingController();
  TextEditingController forthNumberControl = TextEditingController();
  TextEditingController fifthNumberControl = TextEditingController();

  final foco1 = FocusNode();
  final foco2 = FocusNode();
  final foco3 = FocusNode();
  final foco4 = FocusNode();
  final foco5 = FocusNode();
  int sorteio = 0;
  int randomNumber = 0;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green.shade700,
            centerTitle: true,
            toolbarHeight: 60.0,
            title: const Text(
              'Focus Random',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                Text('Sorteado: $randomNumber',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 29.0,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(
                  height: 5.0,
                ),
                TextField(
                  controller: firstNumberControl,
                  focusNode: foco1,
                ),
                TextField(
                  controller: secondNumberControl,
                  focusNode: foco2,
                ),
                TextField(
                  controller: thirdNumberControl,
                  focusNode: foco3,
                ),
                TextField(
                  controller: forthNumberControl,
                  focusNode: foco4,
                ),
                TextField(
                  controller: fifthNumberControl,
                  focusNode: foco5,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                ElevatedButton(
                  onPressed: focar,
                  child: const Text('Focus Random'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void focar() {
    setState(() {
      Random sorteio = Random();
      randomNumber = sorteio.nextInt(6);
      if (randomNumber == 1) {
        foco1.requestFocus();
      } else if (randomNumber == 2) {
        foco2.requestFocus();
      } else if (randomNumber == 3) {
        foco3.requestFocus();
      } else if (randomNumber == 4) {
        foco4.requestFocus();
      } else if (randomNumber == 5) {
        foco5.requestFocus();
      } else {
        foco1.unfocus();
        foco2.unfocus();
        foco3.unfocus();
        foco4.unfocus();
        foco5.unfocus();
      }
    });
  }
}
