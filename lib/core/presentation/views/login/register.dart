import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/data/models/respositories/registerRepository.dart';
import 'package:flutter_application_1/core/domain/models/registerModel.dart';
import 'package:flutter_application_1/core/domain/usecases/load_register_data.dart';
import 'package:flutter_application_1/core/presentation/bloc/register_bloc.dart';
import 'package:flutter_application_1/core/presentation/bloc/register_event.dart';
import 'package:flutter_application_1/core/presentation/bloc/register_state.dart';
import 'package:flutter_application_1/core/presentation/views/errorPage.dart';
import 'package:flutter_application_1/core/presentation/widgets/ToastMessageWidget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _nameController = TextEditingController();
    final _lastnameController = TextEditingController();
    final _emailController = TextEditingController();
    final _rfcController = TextEditingController();
    final _phoneController = TextEditingController();
    final _passwordController = TextEditingController();
    final _idBankController = TextEditingController();
    return BlocProvider(
        create: (context) =>
            RegisterBloc(LoadRegisterData(RegisterRepository())),
        child: Scaffold(
          body: BlocListener<RegisterBloc, RegisterState>(
              listener: (context, state) async {
            if (state is RegisterSuccess) {
              ToastMessageWidget.show(context, state.message);
            } else if (state is RegisterError) {
              ToastMessageWidget.show(context, state.message);
            } else if (state is RegisterLoading) {
              ToastMessageWidget.show(context, "Creando cuenta");
            }
          }, child: BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
            if (state is RegisterInitial || state is RegisterLoading) {
              return buildView(
                  context,
                  _formKey,
                  _nameController,
                  _lastnameController,
                  _emailController,
                  _rfcController,
                  _phoneController,
                  _passwordController);
            } else if (state is RegisterSuccess) {
              return buildView(
                  context,
                  _formKey,
                  _nameController,
                  _lastnameController,
                  _emailController,
                  _rfcController,
                  _phoneController,
                  _passwordController);
            } else if (state is RegisterError) {
              return buildView(
                  context,
                  _formKey,
                  _nameController,
                  _lastnameController,
                  _emailController,
                  _rfcController,
                  _phoneController,
                  _passwordController);
            } else {
              return ErrorPage();
            }
          })),
        ));
  }
}

Widget buildView(
    BuildContext context,
    GlobalKey<FormState> globalKey,
    TextEditingController nameControl,
    TextEditingController lastnameControl,
    TextEditingController emailControl,
    TextEditingController rfcControl,
    TextEditingController phoneControl,
    TextEditingController passwordControl) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Color.fromRGBO(124, 77, 246, 1.000),
      title: const Text(
        'Registro de usuario',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
    body: Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: globalKey,
        child: ListView(
          children: <Widget>[
            Center(
              child: const Text(
                "Crea una cuenta para ZonaZero",
                style: TextStyle(
                  color: Color.fromRGBO(124, 77, 246, 1.000), // Color morado
                  fontSize: 24.0, // Tamaño de fuente grande
                  fontWeight: FontWeight.bold, // Negrita
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: nameControl,
              decoration: InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              maxLength: 50,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingresa tu nombre';
                }
                return null;
              },
            ),
            TextFormField(
              controller: lastnameControl,
              decoration: InputDecoration(
                labelText: 'Apellido',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              maxLength: 50,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingresa tu apellido';
                }
                return null;
              },
            ),
            TextFormField(
              controller: emailControl,
              decoration: InputDecoration(
                labelText: 'Correo',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingresa tu correo';
                }
                final emailRegExp =
                    RegExp(r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
                if (!emailRegExp.hasMatch(value)) {
                  return 'Correo invalido';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: rfcControl,
              decoration: InputDecoration(
                labelText: 'RFC',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              maxLength: 13,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingresa tu RFC';
                }
                return null;
              },
            ),
            TextFormField(
              controller: phoneControl,
              decoration: InputDecoration(
                labelText: 'Telefono',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              keyboardType: TextInputType.phone,
              maxLength: 13,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingresa tu numero de telefono';
                }
                if (value.length < 10 || value.length > 13) {
                  return 'El numero de telefono debe ser entre 10 t 13 digitos';
                }
                return null;
              },
            ),
            TextFormField(
              controller: passwordControl,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingresa tu contraseña';
                }
                if (value.length < 8) {
                  return 'La contraseña debe contener mas de 9 caracteres';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final registerModel = RegisterModel(
                  name: nameControl.text,
                  lastname: lastnameControl.text,
                  email: emailControl.text,
                  rfc: rfcControl.text,
                  phone: phoneControl.text,
                  password: passwordControl.text,
                  id_bank: 8,
                );
                BlocProvider.of<RegisterBloc>(context)
                    .add(RegisterSubmitted(registerModel));
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      20), // Ajusta el valor según sea necesario
                ),
                backgroundColor: Color.fromRGBO(
                    124, 77, 246, 1.000), // Color de fondo del botón
                foregroundColor: Colors
                    .white, // Color del texto del botón cuando está en el estado primario
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .05,
                    vertical: 15), // Ajusta el relleno del botón
              ),
              child: Text('Crear'),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    ),
  );
}
