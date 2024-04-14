import 'package:flutter/material.dart';

class CardMovementsWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;

  const CardMovementsWidget({
    required this.imagePath,
    required this.title,
    required this.price,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(10), // Bordes redondeados
        border: Border.all(color: Colors.grey),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              height: MediaQuery.of(context).size.width *
                  .08, // Ajustar altura al tamaño del widget padre
              width: MediaQuery.of(context).size.width *
                  .08, // Ajustar ancho al tamaño del widget padre
              fit: BoxFit
                  .cover, // Ajustar la imagen para cubrir el espacio asignado
            ),
            Column(
              children: [
                Text(title, style: TextStyle(fontSize: 14)),
                Text(price, style: TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
