import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 

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
  String _selectedCategory = 'Agua'; 

  final List<String> _serviceCategories = ['Agua', 'Luz', 'Internet']; 

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
              'Categoría de servicio',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: _selectedCategory,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCategory = newValue!;
                });
              },
              items: _serviceCategories.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
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
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
              decoration: InputDecoration(
                hintText: 'Ingrese el monto',
                prefixIcon: Icon(Icons.attach_money),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
              
                  if (_serviceController.text.isNotEmpty && _amountController.text.isNotEmpty) {
                  
                    String amount = _amountController.text;
                    String service = _serviceController.text;
                  
                    print('Categoría: $_selectedCategory');
                    print('Servicio: $service');
                    print('Monto: \$ $amount');
                 
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Confirmación de pago'),
                          content: Text('Pago de $amount por el servicio de $service ha sido procesado.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Aceptar'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text('Por favor complete todos los campos.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Aceptar'),
                            ),
                          ],
                        );
                      },
                    );
                  }
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
