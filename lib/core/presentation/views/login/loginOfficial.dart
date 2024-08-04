import 'dart:async';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart'; // Importa Cupertino para widgets nativos de iOS
import 'package:flutter_application_1/core/data/models/respositories/loginRepository.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/loginDTO.dart';
import 'package:flutter_application_1/core/domain/usecases/load_login_data.dart';
import 'package:flutter_application_1/core/presentation/bloc/login_bloc.dart';
import 'package:flutter_application_1/core/presentation/bloc/login_event.dart';
import 'package:flutter_application_1/core/presentation/views/errorPage.dart';
import 'package:flutter_application_1/core/presentation/views/home/home.dart';
import 'package:flutter_application_1/core/presentation/views/login/register.dart';
import 'package:flutter_application_1/core/presentation/widgets/ToastMessageWidget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter_application_1/core/presentation/bloc/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(LoadLoginData(LoginRepository())),
      child: Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) async {
          if (state is LoginInitial || state is LoginLoading) {

          }else if(state is LoginSuccess)
          {
            Navigator.pushReplacement<void, void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => HomePage(),
          ),
        );
          }
          else if(state is LoginError)
          {
            ToastMessageWidget.show(context,state.message);
          }
        }, child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginInitial || state is LoginLoading) {
              return builLogin(context);
            } else if (state is LoginSuccess) {
              return builLogin(context);
            } else if (state is LoginError) {
              return builLogin(context);
            } 
            else {
              return ErrorPage();
            }
          },
        )),
      ),
    );
  }
}


Widget builLogin(BuildContext context) {
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
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
                margin:
                    const EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0),
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
                        controller: _numberController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Telefono',
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
                                        builder: (context) => RegisterPage()));
                              },
                              child: Text(
                                'Crear cuenta',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.cyan,
                              ),
                            ),
                            SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {},
                              child: ElevatedButton(
                                onPressed: () async {
                                var isAuthentication =
                                    await _localAuthentication.authenticate(
                                  localizedReason: "Autenticarse para acceder",
                                );
                              print(isAuthentication);
                                if (isAuthentication) {
                                  final credentials = LoginDTO(
                                      phone: _numberController.text,
                                      password: _passwordController.text);
                                  BlocProvider.of<LoginBloc>(context)
                                      .add(LoginSubmitted(credentials));
                                } else {
                                  AlertDialog(
                                    title: const Text('No se puedo reconocer'),
                                    content: const Text(
                                        'No se puede iniciar sesión.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                }
                              },
                                child: Text(
                                  'Entrar',
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.cyan,
                                ),
                              ),
                            ),
                            const SizedBox(height: 35.0)
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
