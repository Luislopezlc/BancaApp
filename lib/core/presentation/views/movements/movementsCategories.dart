import "package:flutter/material.dart";
import "package:flutter_application_1/core/presentation/widgets/CardMovementWidget.dart";

class MovementsCategories extends StatefulWidget {
  _MovementsCategories createState() => _MovementsCategories();
}

class _MovementsCategories extends State<MovementsCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(124, 77, 246, 1.000),
          title: const Text(
            'Categorias',
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
                  // Entretenimiento
                  Text(
                    'Entretenimiento',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 12),
                  // Línea de separación

                  CardMovementWidget(
                    title1: 'Boletos de Cine',
                    title2: '\$15.00',
                    subtitle1: '6 abr',
                    subtitle2: 'Débito',
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
                    title1: 'Reserva de Hotel',
                    title2: '\$200.00',
                    subtitle1: '4 abr',
                    subtitle2: 'Crédito',
                  ),
                  SizedBox(height: 12),
                  // Compras en línea
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                    height: 20,
                  ),
                  Text(
                    'Compras en línea',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 12),
                  CardMovementWidget(
                    title1: 'Amazon Prime',
                    title2: '\$90.00',
                    subtitle1: '10 abr',
                    subtitle2: 'Crédito',
                  ),
                  SizedBox(height: 8),
                  CardMovementWidget(
                    title1: 'Mercado Libre',
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
                  SizedBox(height: 8),
                  CardMovementWidget(
                    title1: 'Libros de Ciencia Ficción',
                    title2: '\$120.00',
                    subtitle1: '8 abr',
                    subtitle2: 'Crédito',
                  ),
                  SizedBox(height: 12),
                   Divider(
                    color: Colors.grey,
                    thickness: 1,
                    height: 20,
                  ),
                  // Alimentación
                  Text(
                    'Alimentación',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 12),

                  CardMovementWidget(
                    title1: 'Comida para Mascotas',
                    title2: '\$120.00',
                    subtitle1: '7 abr',
                    subtitle2: 'Crédito',
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
                    title1: 'Comida a Domicilio',
                    title2: '\$30.00',
                    subtitle1: '2 abr',
                    subtitle2: 'Crédito',
                  ),
                  SizedBox(height: 12),
                   Divider(
                    color: Colors.grey,
                    thickness: 1,
                    height: 20,
                  ),
                  // Moda y Accesorios
                  Text(
                    'Moda y Accesorios',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 12),

                  CardMovementWidget(
                    title1: 'Zapatillas Deportivas Nike',
                    title2: '\$165.00',
                    subtitle1: '8 abr',
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
                    title1: 'Accesorios de Hogar',
                    title2: '\$35.00',
                    subtitle1: '4 abr',
                    subtitle2: 'Débito',
                  ),
                  SizedBox(height: 12),
                   Divider(
                    color: Colors.grey,
                    thickness: 1,
                    height: 20,
                  ),
                  // Tecnología y Hogar
                  Text(
                    'Tecnología y Hogar',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 12),

                  CardMovementWidget(
                    title1: 'Compras de Electrodomésticos',
                    title2: '\$500.00',
                    subtitle1: '3 abr',
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
                    title1: 'Productos de Belleza',
                    title2: '\$90.00',
                    subtitle1: '5 abr',
                    subtitle2: 'Crédito',
                  ),
                  SizedBox(height: 12),
                   Divider(
                    color: Colors.grey,
                    thickness: 1,
                    height: 20,
                  ),
                  // Otros
                  Text(
                    'Otros',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 12),
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
