import "package:flutter/material.dart";
import "package:flutter_application_1/core/presentation/widgets/CardMovementWidget.dart";
import "package:flutter_application_1/core/presentation/widgets/CardMovementsWidget.dart";
import "package:flutter_application_1/core/presentation/widgets/CardWalletWidget.dart";
import "package:flutter_application_1/core/presentation/widgets/CreditCardDetailsModal.dart";

class HistoryMovements extends StatefulWidget {
  _HistoryMovements createState() => _HistoryMovements();
}

class _HistoryMovements extends State<HistoryMovements> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(124, 77, 246, 1.000),
          title: const Text(
            'Historial de compras',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), // Bordes redondeados
                border: Border.all(color: Colors.grey), // Borde con color gris
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardMovementWidget(
                    title1: 'Amazon Prime',
                    title2: '\$90.00',
                    subtitle1: '10 abr',
                    subtitle2: 'Crédito',
                  ),
                  SizedBox(height: 8),
                  CardMovementWidget(
                    title1: 'Mercado libre',
                    title2: '\$120.00',
                    subtitle1: '10 abr',
                    subtitle2: 'Crédito',
                  ),
                  SizedBox(height: 8),
                  CardMovementWidget(
                    title1: 'Temu',
                    title2: '\$165.00',
                    subtitle1: '9 abr',
                    subtitle2: 'Crédito',
                  ),
                  CardMovementWidget(
                    title1: 'Cafetera Nespresso',
                    title2: '\$90.00',
                    subtitle1: '9 abr',
                    subtitle2: 'Débito',
                  ),
                  SizedBox(height: 8),
                  CardMovementWidget(
                    title1: 'Libros de Ciencia Ficción',
                    title2: '\$120.00',
                    subtitle1: '8 abr',
                    subtitle2: 'Crédito',
                  ),
                  SizedBox(height: 8),
                  CardMovementWidget(
                    title1: 'Zapatillas Deportivas Nike',
                    title2: '\$165.00',
                    subtitle1: '8 abr',
                    subtitle2: 'Crédito',
                  ),
                  SizedBox(height: 8),
                  CardMovementWidget(
                    title1: 'Suscripción a Netflix',
                    title2: '\$90.00',
                    subtitle1: '8 abr',
                    subtitle2: 'Débito',
                  ),
                  SizedBox(height: 8),
                  CardMovementWidget(
                    title1: 'Comida para Mascotas',
                    title2: '\$120.00',
                    subtitle1: '7 abr',
                    subtitle2: 'Crédito',
                  ),
                  SizedBox(height: 8),
                  CardMovementWidget(
                    title1: 'Muebles para el Hogar',
                    title2: '\$165.00',
                    subtitle1: '7 abr',
                    subtitle2: 'Crédito',
                  ),
                  SizedBox(height: 8),
                  CardMovementWidget(
                    title1: 'Boletos de Cine',
                    title2: '\$15.00',
                    subtitle1: '6 abr',
                    subtitle2: 'Débito',
                  ),
                  SizedBox(height: 8),
                  CardMovementWidget(
                    title1: 'Compras de Supermercado',
                    title2: '\$75.00',
                    subtitle1: '6 abr',
                    subtitle2: 'Crédito',
                  ),
                  SizedBox(height: 8),
                  CardMovementWidget(
                    title1: 'Ropa de Moda',
                    title2: '\$120.00',
                    subtitle1: '5 abr',
                    subtitle2: 'Crédito',
                  ),
                  SizedBox(height: 8),
                  CardMovementWidget(
                    title1: 'Juguetes para Niños',
                    title2: '\$50.00',
                    subtitle1: '5 abr',
                    subtitle2: 'Débito',
                  ),
                  SizedBox(height: 8),
                  CardMovementWidget(
                    title1: 'Productos de Belleza',
                    title2: '\$90.00',
                    subtitle1: '5 abr',
                    subtitle2: 'Crédito',
                  ),
                  SizedBox(height: 8),
                  CardMovementWidget(
                    title1: 'Accesorios de Hogar',
                    title2: '\$35.00',
                    subtitle1: '4 abr',
                    subtitle2: 'Débito',
                  ),
                  SizedBox(height: 8),
                  CardMovementWidget(
                    title1: 'Reserva de Hotel',
                    title2: '\$200.00',
                    subtitle1: '4 abr',
                    subtitle2: 'Crédito',
                  ),
                  SizedBox(height: 8),
                  CardMovementWidget(
                    title1: 'Compras de Electrodomésticos',
                    title2: '\$500.00',
                    subtitle1: '3 abr',
                    subtitle2: 'Crédito',
                  ),
                  SizedBox(height: 8),
                  CardMovementWidget(
                    title1: 'Entradas para Concierto',
                    title2: '\$80.00',
                    subtitle1: '3 abr',
                    subtitle2: 'Débito',
                  ),
                  SizedBox(height: 8),
                  CardMovementWidget(
                    title1: 'Comida a Domicilio',
                    title2: '\$30.00',
                    subtitle1: '2 abr',
                    subtitle2: 'Crédito',
                  ),
                  SizedBox(height: 8),
                  CardMovementWidget(
                    title1: 'Suscripción a Revista',
                    title2: '\$10.00',
                    subtitle1: '2 abr',
                    subtitle2: 'Débito',
                  ),
                  SizedBox(height: 8),
                  CardMovementWidget(
                    title1: 'Compra de Regalos',
                    title2: '\$100.00',
                    subtitle1: '28 mar',
                    subtitle2: 'Crédito',
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ));
  }
}
