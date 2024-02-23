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
      home: const MyPaymentPage(title: 'Pago de Servicios'),
    );
  }
}

class MyPaymentPage extends StatefulWidget {
  const MyPaymentPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyPaymentPage> createState() => _MyPaymentPageState();
}

class _MyPaymentPageState extends State<MyPaymentPage> {
  late TextEditingController _amountController;
  late TextEditingController _serviceController;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
    _serviceController = TextEditingController();
  }

  @override
  void dispose() {
    _amountController.dispose();
    _serviceController.dispose();
    super.dispose();
  }

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
            Text(
              'Monto a pagar',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Ingrese el monto',
                prefixIcon: Icon(Icons.attach_money),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Servicio',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _serviceController,
              decoration: InputDecoration(
                hintText: 'Ingrese el servicio a pagar',
                prefixIcon: Icon(Icons.assignment),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Aquí puedes manejar la lógica para procesar el pago
                  String amount = _amountController.text;
                  String service = _serviceController.text;
                  // Por ejemplo, puedes imprimir la información del pago
                  print('Monto: \$ $amount');
                  print('Servicio: $service');
                  // También puedes navegar a otra pantalla o realizar otras acciones
                },
                child: Text(
                  'Pagar',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
