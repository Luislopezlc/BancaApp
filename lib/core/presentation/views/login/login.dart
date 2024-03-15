import "package:flutter/material.dart";
import 'package:flutter_application_1/core/presentation/widgets/home2.dart';
import 'package:local_auth/local_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _Login createState() => _Login();
} 



class _Login extends State<LoginPage>  {
  final LocalAuthentication _localAuthentication = LocalAuthentication();
 
 Future<void> _auth() async {
    bool authenticated = false;
    try {
      authenticated = await _localAuthentication.authenticate(
        localizedReason: "Autentícate para acceder",
        options: const AuthenticationOptions(stickyAuth: true, useErrorDialogs: true),
      );
    } catch (e) {
      print(e);
    }

    if (authenticated) {
      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => home2(), 
        ),
      );
    } else {
      print("Fallo auth");
    }
  }

 
 
 
 
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Image.asset("assets/images/loginLogo.jpg"),
      const Text("Bienvenido"),
      TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Correo',
        ),
      ),
      SizedBox(
        height: 30.0,
      ),
      TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Contraseña',
        ),
      ),
      SizedBox(
        height: 30.0,
      ),
      TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20),
          ),
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Entrar"),
              Icon(Icons.arrow_forward, color: Colors.yellow[500])
            ],
          )),
                            IconButton(
                              onPressed: _auth,
                              icon: const Icon(Icons.fingerprint),
                            ),
          
    ]));
  }
}
