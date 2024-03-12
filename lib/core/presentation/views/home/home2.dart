import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(homeApp());
}

class homeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sidebar con Nombre de Usuario',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home2(),
    );
  }
}

class Home2 extends StatelessWidget {
  final String username = "Usuario Ejemplo";
 String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página de inicio'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Hola Usuario   ' + formattedDate),
              accountEmail: null,
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
            ListTile(
              title: Text('Opción 1'),
              onTap: () {
                // Action cuando se selecciona la opción 1
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Opción 2'),
              onTap: () {
                // Action cuando se selecciona la opción 2
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Contenido de la página de inicio'),
      ),
    );
  }
}
