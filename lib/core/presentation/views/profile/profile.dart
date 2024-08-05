import 'package:flutter/material.dart';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(_profileImageUrl),
              ),
              const SizedBox(height: 20),
              _buildProfileTextField('Nombre', _nameController),
              _buildProfileTextField('Apellido', _lastnameController),
              _buildProfileTextField('Correo Electrónico', _emailController),
              _buildProfileTextField('Número de Teléfono', _phoneController),
              _buildProfileTextField('RFC', _rFCController),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: lockButton ? () {
                     // _saveProfileData();
                      PatchUserDTO user = PatchUserDTO(
                        name: _nameController.text,
                        lastname: _lastnameController.text,
                        email: _emailController.text,
                        rfc: _rFCController.text,
                        phone: _phoneController.text);
                      
                      BlocProvider.of<ProfileBloc>(context)
                    .add(UpdateUserEvent(user));

                    } : null,
                    child: lockButton ? const Text('Guardar') : const CircularProgressIndicator(),
                  ),
                ],
              ),
            ],
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
