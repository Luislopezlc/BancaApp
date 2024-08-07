import 'package:flutter/material.dart';

class CardWalletWidget extends StatelessWidget {
  final String cardNumber;
  final String cardHolder;
  final String imageUrl;
  final String accountNumber;
  final VoidCallback onPressed;

  const CardWalletWidget({
   
    required this.cardNumber,
    required this.cardHolder,
    required this.imageUrl,
    required this.accountNumber,
    required this.onPressed,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
          border: Border(
            top: BorderSide(
              color: Color.fromRGBO(41, 0, 93, 1.000),
              width: 10.0,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child:  Image.asset(
                imageUrl,
                width: 60,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    formatCardNumber(cardNumber),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    cardHolder,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: onPressed,
              child: Text(
                'Ver',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
  String formatCardNumber(String cardNumber) {
  // Remover cualquier espacio existente en el número de tarjeta
  cardNumber = cardNumber.replaceAll(' ', '');
  
  // Asegurarse de que el número de tarjeta tenga solo dígitos
  if (!RegExp(r'^\d+$').hasMatch(cardNumber)) {
    throw FormatException('El número de tarjeta debe contener solo dígitos');
  }
  
  // Dividir el número de tarjeta en grupos de 4 dígitos
  List<String> parts = [];
  for (int i = 0; i < cardNumber.length; i += 4) {
    int end = (i + 4 < cardNumber.length) ? i + 4 : cardNumber.length;
    parts.add(cardNumber.substring(i, end));
  }
  
  // Unir los grupos con espacios
  return parts.join(' ');
}