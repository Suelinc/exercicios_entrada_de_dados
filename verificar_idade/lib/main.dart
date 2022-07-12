import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Idade()));
}

TextEditingController idadeControl = TextEditingController();

class Idade extends StatefulWidget {
  const Idade({Key? key}) : super(key: key);

  @override
  State<Idade> createState() => _IdadeState();
}

class _IdadeState extends State<Idade> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        centerTitle: true,
        toolbarHeight: 100.0,
        title: const Text(
          'Podes votar?',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          TextField(
            autofocus: true,
            decoration: const InputDecoration(
                labelText: 'Informe sua idade',
                labelStyle: TextStyle(fontSize: 28)),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            controller: idadeControl,
          ),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            onPressed: verificarIdade,
            child: const Text('Verificar Idade'),
          ),
        ],
      ),
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: const Text("Não podes votar"),
          actions: <Widget>[
            // define os botões na base do dialogo
            ElevatedButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDialogFacultativo() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: const Text("Voto Facultativo"),
          actions: <Widget>[
            // define os botões na base do dialogo
            ElevatedButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

 void _showDialogObrigatorio() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: const Text("Voto Obrigatório!"),
          actions: <Widget>[
            // define os botões na base do dialogo
            ElevatedButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void verificarIdade() {
    setState(() {
      if (int.parse(idadeControl.text) < 16) {
        _showDialog();
      } else if (int.parse(idadeControl.text) >= 16 &&
              int.parse(idadeControl.text) < 18 ||
          int.parse(idadeControl.text) > 65) {
        _showDialogFacultativo();
      } else {
        _showDialogObrigatorio();
      }
    });
  }
}
