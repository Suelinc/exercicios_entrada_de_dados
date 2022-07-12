import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: Login()));
}

TextEditingController loginControl = TextEditingController();
TextEditingController senhaControl = TextEditingController();

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool obscureText = true;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.amber.shade100,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Text('Login',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Colors.blueGrey.shade500)),
          const SizedBox(
            height: 20.0,
          ),
          TextField(
            autofocus: true,
            decoration: const InputDecoration(
              labelText: 'Usuário',
              labelStyle: TextStyle(fontSize: 28),
              border: OutlineInputBorder(),
            ),

            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            controller: loginControl,
            
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextField(
            autofocus: true,
            obscureText: obscureText,
            decoration: const InputDecoration(
              labelText: ('Senha'),
              labelStyle: TextStyle(fontSize: 28),
              border: OutlineInputBorder(),
            ).copyWith(
                suffixIcon: IconButton(
              icon: Icon(
                obscureText ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () => setState(() {
                obscureText = !obscureText;
              }),
            )),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            controller: senhaControl,
          ),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            onPressed: verificarLogin,
            style: ElevatedButton.styleFrom(primary: Colors.blueGrey.shade500),
            child: const Text('Entrar', style: TextStyle(fontSize: 28.0)),
          ),
        ],
      ),
    );
  }

  String usuario = 'Maria';
  String senha = '12345';

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return const AlertDialog(
          title: Text("Maria logado(a) no sistema!"),
        );
      },
    );
  }

  void _showDialogInvalido() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return const AlertDialog(
          title: Text("Usuário ou Senha inválidos"),
        );
      },
    );
  }

  void _showDialogInforme() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return const AlertDialog(
          title: Text("Informe o Usuário"),
        );
      },
    );
  }

  void _showDialogInformeSenha() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return const AlertDialog(
          title: Text("Informe a Senha"),
        );
      },
    );
  }

  String usuariox = '';
  String senhax = '';

  void verificarLogin() {
    setState(() {
      usuariox = loginControl.text;
      senhax = senhaControl.text;
      print(usuariox);
      print(senhax);
      if (usuariox == usuario && senhax == senha) {
        _showDialog();
      } else if (usuariox == '' && senhax == '') {
        _showDialogInforme();
      } else if (usuariox != '' && senhax == '') {
        _showDialogInformeSenha();
      } else {
        _showDialogInvalido();
      }
    });
  }
}
