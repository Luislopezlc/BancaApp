import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/presentation/views/dashboard/dashboard.dart';
import 'package:flutter_application_1/core/presentation/views/profile/profile.dart';
import 'package:flutter_application_1/core/presentation/views/support/Support.dart';
import 'package:flutter_application_1/core/presentation/widgets/home2.dart';
import 'package:flutter_application_1/core/presentation/widgets/perfil.dart';
import 'package:flutter_application_1/core/presentation/widgets/settings.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  Widget contenidoDelBody = Dashboard();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          // Lógica para el primer ítem
          contenidoDelBody = Dashboard();
          break;
        case 1:
          // Lógica para el segundo ítem
          contenidoDelBody = Profile();

          break;
        case 2:
          // Lógica para el tercer ítem
          contenidoDelBody = Support();

          break;
      }
    });
  }

  // Formatear la fecha en el formato deseado
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Color.fromRGBO(124, 77, 246, 1.000), // Color de fondo del AppBar
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.white, // Cambiar el color del icono a blanco
              ),
              onPressed: () {
                // Acción para el perfil
                setState(() {
                _onItemTapped(1);
                 });
              },
            ),
          ],
        ),
      ),
      body: contenidoDelBody,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Ajustes',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
