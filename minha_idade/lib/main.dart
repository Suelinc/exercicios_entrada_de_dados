import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MinhaIdade()));
}

class MinhaIdade extends StatefulWidget {
  const MinhaIdade({Key? key}) : super(key: key);

  @override
  State<MinhaIdade> createState() => _MinhaIdadeState();
}

class _MinhaIdadeState extends State<MinhaIdade> {
  TextEditingController minhaIdadeControl = TextEditingController();
  final now = DateTime.now();
  DateTime get ano => DateTime(now.year - 1, now.month, now.day);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        centerTitle: true,
        toolbarHeight: 60.0,
        title: const Text(
          'Minha Idade',
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
            TextField(
              controller: minhaIdadeControl,
              readOnly: true,
              keyboardType: TextInputType.number,
              onTap: showBirthDatePicker,
            ),
            ElevatedButton(
              onPressed: showBirthDatePicker,
              child: const Text('Calendário'),
            ),
          ],
        ),
      ),
    );
  }

  void showBirthDatePicker() {
    showDatePicker(
      context: context,
      initialDate: ano,
      firstDate: DateTime(1900),
      lastDate: ano,
    ).then((value) {
      if (value != null){

     
      final dias = now.difference(value).inDays;
      final anos = dias ~/ 365;
      minhaIdadeControl.text = anos.toString();
       }
    }); 
  }

}
