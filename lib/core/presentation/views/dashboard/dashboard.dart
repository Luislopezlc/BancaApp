import 'package:flutter/material.dart';

void main() {
  runApp(BancoApp());
}

class BancoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: BancoHomePage(),
    );
  }
}

class BancoHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.purple[200],
              padding: EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(Icons.help),
                        onPressed: () {
                          // Acción para la función de ayuda
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.person),
                        onPressed: () {
                          // Acción para el perfil
                        },
                      ),
                    ],
                  ),
                  SizedBox(height:  66),
                  Text(
                    'Bienvenido, Isabella',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height:24),
                  Column(
                    children: [
                      Text(
                        'Tu Dinero',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$20,002',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonOption(
                    icon: Icons.credit_card,
                    label: 'Retiro sin tarjeta',
                    onPressed: () {
                      // Acción para el retiro sin tarjeta
                    },
                  ),
                  ButtonOption(
                    icon: Icons.history,
                    label: 'Movimientos',
                    onPressed: () {
                      // Acción para los movimientos
                    },
                  ),
                  ButtonOption(
                    icon: Icons.payment,
                    label: 'Pago de servicios',
                    onPressed: () {
                      // Acción para el pago de servicios
                    },
                  ),
                ],
              ),
            ),
            Container(
              color: Color.fromARGB(185, 238, 236, 236),
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mi día a día',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Ingresos'),
                      Text('\$1,000'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Gastos'),
                      Text('\$1,000'),
                    ],
                  ),
                  SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      // Acción para ver más detalles
                    },
                    child: Text(
                      'Ver más',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const ButtonOption({
    Key? key,
    required this.icon,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, size: 32),
          onPressed: onPressed,
        ),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}