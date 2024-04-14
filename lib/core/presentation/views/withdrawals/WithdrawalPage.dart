import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WithdrawalPage extends StatelessWidget {
  final double amount;
  final DateTime dateTime;

  WithdrawalPage({required this.amount, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd/MM/yyyy HH:mm').format(dateTime);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.purple, // Color morado para el encabezado
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            height: MediaQuery.of(context).size.height * 0.2, // Ajusta la altura del encabezado
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: Colors.white,
                ),
                SizedBox(width: 16), // Espacio entre el icono y el texto
                Text(
                  'Retiro sin Tarjeta',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 16), // Espacio entre el encabezado y el primer texto
                  Text(
                    'Token generado',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Fecha y hora de generación:',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    formattedDate,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Valor a retirar:',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16), // Espacio entre el texto anterior y el siguiente
                  Text(
                    '\$$amount',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8), // Espacio entre el número y el texto siguiente
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Costo del retiro: ',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        '\$0.00',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'más IVA',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.help_outline,
                        size: 24,
                        color: Colors.lightBlue,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
