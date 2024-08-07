import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/data/models/respositories/profileRepository.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/patchUserDTO.dart';
import 'package:flutter_application_1/core/domain/models/profileModel.dart';
import 'package:flutter_application_1/core/domain/usecases/load_profile_data.dart';
import 'package:flutter_application_1/core/presentation/bloc/profile_bloc.dart';
import 'package:flutter_application_1/core/presentation/bloc/profile_event.dart';
import 'package:flutter_application_1/core/presentation/bloc/profile_state.dart';
import 'package:flutter_application_1/core/presentation/views/errorPage.dart';
import 'package:flutter_application_1/core/presentation/widgets/ToastMessageWidget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyProfilePage(title: 'Mi Perfil');
  }
}

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  TextEditingController _nameController = TextEditingController(text: '');
  TextEditingController _lastnameController = TextEditingController(text: '');
  TextEditingController _emailController = TextEditingController(text: '');
  TextEditingController _phoneController = TextEditingController(text: '');
  TextEditingController _rFCController = TextEditingController(text: '');
  final _formKey = GlobalKey<FormState>();
  final String _profileImageUrl =
      'https://static.vecteezy.com/system/resources/previews/005/544/718/non_2x/profile-icon-design-free-vector.jpg'; // URL de la imagen de perfil del usuario

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(
        LoadProfileData(profileRepository()),
      )..add(LoadProfileDataEvent()),
      child: Scaffold(
          body: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) async {
          if(state is ProfileSending)
          {
            ToastMessageWidget.show(context, 'Enviando');
          }
          else if(state is ProfileSuccess)
          {
            ToastMessageWidget.show(context, state.message);
          }
           else if(state is ProfileError)
          {
            ToastMessageWidget.show(context, state.message);
          }
        },
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            
            if (state is ProfileInitial ) {
              return buildProfile(context,true);
            } 
            else if (state is ProfileLoading ) {
              _nameController.text = state.model.name;
              _lastnameController.text = state.model.lastname;
              _rFCController.text = state.model.rfc;
              _phoneController.text = state.model.number;
              _emailController.text = state.model.email;
              return buildProfile(context,true);
            } else if (state is ProfileLoaded) {
              _nameController.text = state.model.name;
              _lastnameController.text = state.model.lastname;
              _rFCController.text = state.model.rfc;
              _phoneController.text = state.model.number;
              _emailController.text = state.model.email;
              return buildProfile(context,true);
            }else if(state is ProfileSuccess)
            {
              _nameController.text = state.model.name;
              _lastnameController.text = state.model.lastname;
              _rFCController.text = state.model.rfc;
              _phoneController.text = state.model.number;
              _emailController.text = state.model.email;
              return buildProfile(context,true);
            }
            else if(state is ProfileSending)
            {
              _nameController.text = _nameController.text;
              _lastnameController.text = _lastnameController.text;
              _rFCController.text = _rFCController.text;
              _phoneController.text = _phoneController.text;
              _emailController.text = _emailController.text;
              return buildProfile(context,false);
            }
            else if(state is ProfileError)
            {
              _nameController.text = state.model.name;
              _lastnameController.text = state.model.lastname;
              _rFCController.text = state.model.rfc;
              _phoneController.text = state.model.number;
              _emailController.text = state.model.email;
              return buildProfile(context,true);
            }
             else {
              return ErrorPage();
            }
          },
        ),
      )),
    );
  }

  Widget buildProfile(BuildContext context,bool lockButton) {
    return SingleChildScrollView(
      child: Material(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
        key: _formKey, 
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(_profileImageUrl),
              ),
              const SizedBox(height: 20),
              _buildProfileTextFieldName('Nombre', _nameController),
              _buildProfileTextFieldLastname('Apellido', _lastnameController),
              _buildProfileTextFieldEmail('Correo Electrónico', _emailController),
              _buildProfileTextFieldPhone('Número de Teléfono', _phoneController),
              _buildProfileTextFieldRFC('RFC', _rFCController),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: lockButton ? () {
                     // _saveProfileData();

                       if (_formKey.currentState!.validate()) {
                  // El formulario es válido, procede a enviar los datos
                  PatchUserDTO user = PatchUserDTO(
                    name: _nameController.text,
                    lastname: _lastnameController.text,
                    email: _emailController.text,
                    rfc: _rFCController.text,
                    phone: _phoneController.text,
                  );
                  BlocProvider.of<ProfileBloc>(context).add(UpdateUserEvent(user));
                } else {
                  // Mostrar un mensaje de error si el formulario no es válido
                  ToastMessageWidget.show(context, 'Por favor corrija los errores en el formulario.');
                }
                    } : null,
                    child: lockButton ? const Text('Guardar') : const CircularProgressIndicator(),
                  ),
                ],              
              ),
                   const SizedBox(height: 15),

            ],
          ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileTextField(
      String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }


  Widget _buildProfileTextFieldName(
    String label, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      maxLength: 50, // Limita la longitud máxima del texto a 50 caracteres
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'El nombre no debe estar vacío';
        }
        if (value.length > 50) {
          return 'El nombre debe tener 50 caracteres o menos';
        }
         final namePattern = r"^[A-Za-z\s]+$";
                final regExp = RegExp(namePattern);

                if (!regExp.hasMatch(value)) {
                  return 'El nombre no puede contener números';
                }
        return null; // Si todas las validaciones pasan, no devuelve ningún mensaje de error
      },
    ),
  );
}

 Widget _buildProfileTextFieldLastname(
    String label, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      maxLength: 50, // Limita la longitud máxima del texto a 50 caracteres
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'El apellido no debe estar vacío';
        }
        if (value.length > 50) {
          return 'El apellido debe tener 50 caracteres o menos';
        }
         final namePattern = r"^[A-Za-z\s]+$";
                final regExp = RegExp(namePattern);

                if (!regExp.hasMatch(value)) {
                  return 'El apellido no puede contener números';
                }
        return null; // Si todas las validaciones pasan, no devuelve ningún mensaje de error
      },
    ),
  );
}

Widget _buildProfileTextFieldEmail(
    String label, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingresa tu correo';
                }
                final emailRegExp =
                    RegExp(r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
                if (!emailRegExp.hasMatch(value)) {
                  return 'Correo inválido';
                }
                return null;
              },
    ),
  );
}

Widget _buildProfileTextFieldPhone(
    String label, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
       keyboardType: TextInputType.number, // Muestra el teclado numérico
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly, // Permite solo dígitos
              ],
       maxLength: 13,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingresa tu número de teléfono';
                }
                if (value.length < 10 || value.length > 13) {
                  return 'El número de teléfono debe ser entre 10 y 13 dígitos';
                }
                // Expresión regular para validar el formato del teléfono
                final phonePattern = r"^\+?\d{10,13}$";
                final regExp = RegExp(phonePattern);

                if (!regExp.hasMatch(value)) {
                  return 'El teléfono debe ser un número de teléfono válido';
                }
                return null;
              },
    ),
  );
}

Widget _buildProfileTextFieldRFC(
    String label, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
              maxLength: 13,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingresa tu RFC';
                }

                // Expresión regular para validar el RFC
                final rfcPattern = r"^[A-Z&Ñ]{3,4}\d{6}[A-Z0-9]{3}$";
                final regExp = RegExp(rfcPattern);

                if (!regExp.hasMatch(value)) {
                  return 'Ingresa un RFC válido';
                }

                return null;
              },
    ),
  );
}




  void _saveProfileData(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Datos Guardados'),
          content: Text( message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _rFCController.dispose();
    super.dispose();
  }
}
