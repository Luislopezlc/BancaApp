import 'package:flutter/material.dart';
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
 Widget contenidoDelBody = Text('¡Hola, Flutter!');

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
      case 0:
        // Lógica para el primer ítem
        contenidoDelBody = perfil();
        break;
      case 1:
        // Lógica para el segundo ítem
               contenidoDelBody = settings();

        break;
      case 2:
        // Lógica para el tercer ítem
                contenidoDelBody = home2();

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
        title: Text('Hola Usuario   ' + formattedDate),
      ),
      body: Center(
        child: Column(
          children: [ contenidoDelBody],
        ),
      ),
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