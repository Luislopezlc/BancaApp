import 'package:flutter/material.dart';

class CardTransfers extends StatelessWidget {
  final String texto;
  final double diametro;
  final String textName;
  final double espacioEntre;
  final VoidCallback? onPressed;

  CardTransfers({
    required this.texto,
    required this.textName,
    required this.diametro,
    this.espacioEntre = 8.0,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        // Contenedor para la cuarta CardTransfers
        alignment: Alignment.centerLeft, // Alineación a la izquierda
        child: GestureDetector(
          onTap: onPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: diametro,
                height: diametro,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(124, 77, 246, 1.000),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    texto,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: espacioEntre),
              Text(
                textName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0, // Tamaño del texto (ajustable)
                ),
              ),
            ],
          ),
        ));
  }
}
