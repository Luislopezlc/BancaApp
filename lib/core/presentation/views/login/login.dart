import "package:flutter/material.dart";
import 'package:flutter_application_1/core/presentation/views/home/home2.dart';
import 'package:local_auth/local_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
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
          builder: (BuildContext context) => homeApp(),
        ),
      );
    } else {
      print("Fallo auth");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.account_circle,
                size: 100.0,
                color: Colors.green,
              ),
              SizedBox(height: 20.0),
              Text(
                "Iniciar Sesión",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.blue),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Correo',
                  border: OutlineInputBorder(),
                  fillColor: Colors.green,
                  filled: true,
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                  fillColor: Colors.green,
                  filled: true,
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Entrar',
                  style: TextStyle(color: Colors.orange),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
              ),
              SizedBox(height: 10.0),
              TextButton(
                onPressed: () {
                  // Aquí iría la lógica para recuperar la contraseña
                },
                child: Text(
                  '¿Olvidaste tu contraseña?',
                  style: TextStyle(color: Colors.orange),
                ),
              ),
              SizedBox(height: 10.0),
              IconButton(
                onPressed: _auth,
                icon: const Icon(Icons.fingerprint),
                iconSize: 40.0,
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
