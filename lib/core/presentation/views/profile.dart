import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyProfilePage(title: 'Mi Perfil'),
    );
  }
}

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  TextEditingController _nameController = TextEditingController(text: 'America Bolaños');
  TextEditingController _emailController = TextEditingController(text: '202100086@upqroo.edu.mx');
  TextEditingController _phoneController = TextEditingController(text: '9981066178');
  TextEditingController _addressController = TextEditingController(text: 'Fracc. Heroes');

  String _profileImageUrl =
      'https://example.com/profile_image.jpg'; // URL de la imagen de perfil del usuario

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
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
            _buildProfileTextField('Correo Electrónico', _emailController),
            _buildProfileTextField('Número de Teléfono', _phoneController),
            _buildProfileTextField('Dirección', _addressController),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _saveProfileData();
                  },
                  child: const Text('Guardar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileTextField(String label, TextEditingController controller) {
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

  void _saveProfileData() {
    // Aquí puedes implementar la lógica para guardar los datos del perfil
    // Por ejemplo, podrías guardar los datos en una base de datos o en SharedPreferences
    // En este ejemplo, simplemente mostraremos un mensaje de confirmación
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Datos Guardados'),
          content: const Text('Los datos del perfil han sido guardados exitosamente.'),
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
    _addressController.dispose();
    super.dispose();
  }
}