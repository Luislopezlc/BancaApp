import 'dart:async';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart'; // Importa Cupertino para widgets nativos de iOS
import 'package:flutter_application_1/core/data/models/respositories/loginRepository.dart';
import 'package:flutter_application_1/core/domain/usecases/load_login_data.dart';
import 'package:flutter_application_1/core/presentation/bloc/login_bloc.dart';
import 'package:flutter_application_1/core/presentation/bloc/login_event.dart';
import 'package:flutter_application_1/core/presentation/views/home/home.dart';
import 'package:flutter_application_1/core/presentation/views/login/register.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter_application_1/core/presentation/bloc/login_state.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LocalAuthentication _localAuthentication = LocalAuthentication();
   TextEditingController _emailController = TextEditingController();
   TextEditingController _passwordController = TextEditingController();

  Future<void> _auth() async {
    final String correo = "test@example.com";
    const String contrasena = "12345678";
    final String nombre = _emailController.text;
    final String password = _passwordController.text;

    if (nombre == correo && password == contrasena) {
      bool authenticated = false;
      try {
        authenticated = await _localAuthentication.authenticate(
          localizedReason: "Autenticarse para acceder",
        );
      } catch (e) {
        print(e);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Algo ha fallado'),
              content: const Text(
                  'La autentificación ha fallado. Intentar de nuevo.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }

      if (authenticated) {
        Navigator.pushReplacement<void, void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => HomePage(),
          ),
        );
      } else {
        print("La autentificación ha fallado");
      }
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Datos requeridos'),
            content: const Text('Requiere correo y contraseña.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => LoginBloc(
      LoadLoginData(LoginRepository()), 
    )..add(LoadLoginDataEvent()),
        child: Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
      builder: (context,state)
      {
         _emailController = TextEditingController(text: state.email);
         _passwordController = TextEditingController(text: state.password);

         return SingleChildScrollView(
        child: Container( 
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Images/Login.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 180.0),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 5.0),
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 25.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bienvenido',
                        style: TextStyle(
                          color: Colors.white, // Color del texto
                          fontSize: 32.0, // Tamaño de la fuente
                          fontWeight: FontWeight.bold, // Peso de la fuente
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 30.0, bottom: 15.0),
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Correo',
                            labelStyle: TextStyle(
                              color: Colors.white, // Color del texto
                              fontSize: 12.0, // Tamaño de la fuente
                              fontWeight: FontWeight.bold, // Peso de la fuente
                            ),
                            suffixIcon: const Icon(Icons.email),
                          ),
                          style: TextStyle(
                            color: Colors.white, // Color del texto
                            fontSize: 14.0, // Tamaño de la fuente
                            fontWeight: FontWeight.bold, // Peso de la fuente
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Contraseña',
                              labelStyle: const TextStyle(
                                color: Colors
                                    .white, // Color del texto de la etiqueta
                                fontSize:
                                    12.0, // Tamaño de la fuente de la etiqueta
                                fontWeight: FontWeight
                                    .bold, // Peso de la fuente de la etiqueta
                              ),
                              // Establecer el color del texto del TextField
                              // Aquí establecemos el color del texto del TextField como blanco
                              // Puedes ajustar el estilo según tus preferencias
                              hintStyle: TextStyle(color: Colors.white),
                              // Puedes agregar más estilos según sea necesario
                            ),
                            style: TextStyle(
                              color: Colors.white, // Color del texto
                              fontSize: 14.0, // Tamaño de la fuente
                              fontWeight: FontWeight.bold, // Peso de la fuente
                            )),
                      ),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 25.0, top: 30.0, right: 25.0),
                          child: Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterPage()));
                                },
                                child: Text(
                                  'Crear cuenta',
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.cyan,
                                ),
                              ),
                              SizedBox(height: 20)
                              ,
                              GestureDetector(
                                onTap: _auth,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Entrar',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.cyan,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 35.0),
                              GestureDetector(
                                onTap: () {},
                                child: IconButton(
                                  onPressed: _auth,
                                  icon: const Icon(Icons.fingerprint),
                                  iconSize: 40.0,
                                  color: Colors.cyan,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      }
      ),
    ),
    );
  }
}
