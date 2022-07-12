import 'package:flutter/material.dart';

void main() {
  runApp(const Calculadora());
}

class Calculadora extends StatefulWidget {
  const Calculadora({Key? key}) : super(key: key);

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  num firstNumber = 0;
  num secondNumber = 0;
  num result = 0;
  TextEditingController firstNumberControl = TextEditingController();
  TextEditingController secondNumberControl = TextEditingController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade700,
          centerTitle: true,
          toolbarHeight: 100.0,
          title: const Text(
            'Calculadora Simples',
            
            style: TextStyle(
              color: Colors.white,
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Text('Resultado: $result',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 39.0,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                autofocus: true,
                decoration: const InputDecoration(
                    labelText: 'Informe o primeiro valor'),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                controller: firstNumberControl,
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(labelText: 'Informe o segundo valor'),
                controller: secondNumberControl,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  ElevatedButton(
                    
                    onPressed: somar,
                    child: const Text('Somar'),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  ElevatedButton(
                    
                    onPressed: limpar,
                    child: const Text('Limpar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void limpar() {
    setState(() {
      result = 0;
      firstNumberControl.text = '';
      secondNumberControl.clear();
    });
  }

  void somar() {
    setState(
      () {
        firstNumber = num.parse(firstNumberControl.text);
        secondNumber = num.parse(secondNumberControl.text);
        result = (firstNumber + secondNumber);
      },
    );
  }
}
