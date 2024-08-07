import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreditCardDetailsDialog extends StatelessWidget {
  final String cardNumber;
  final String cardHolder;
  final String expiryDate;
  final String cvv;
  final String accountNumber;

  const CreditCardDetailsDialog({

    required this.cardNumber,
    required this.cardHolder,
    required this.expiryDate,
    required this.cvv,
    required this.accountNumber
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Detalles de la tarjeta de crédito',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
          'Número de tarjeta: ',
          style: TextStyle(fontSize: 16),
        ),SelectableText(
            cardNumber,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
            SizedBox(height: 8),
            Text(
              'Titular de la tarjeta: $cardHolder',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Fecha de vencimiento: $expiryDate',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'CVV: $cvv',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Número de cuenta: ',
              style: TextStyle(fontSize: 16),
            ),
            SelectableText(
            accountNumber,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cerrar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void showCreditCardDetailsDialog(BuildContext context, {
  required String cardNumber,
  required String cardHolder,
  required String expiryDate,
  required String cvv,
  required String accountNumber,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CreditCardDetailsDialog(
        cardNumber: cardNumber,
        cardHolder: cardHolder,
        expiryDate: expiryDate,
        cvv: cvv,
        accountNumber : accountNumber,
      );
    },
  );
}



