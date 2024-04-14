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
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(124, 77, 246, 1.000),
        title: const Text(
          'Retiro sin tarjeta',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '4539 0123 4567 4938 8901',
                    style: TextStyle(fontSize: 25, color:  Color.fromRGBO(124, 77, 246, 1.000), fontWeight: FontWeight.bold),
                  ),
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
