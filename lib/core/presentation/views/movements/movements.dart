import "package:flutter/material.dart";
import "package:flutter_application_1/core/presentation/views/movements/historyMovements.dart";
import "package:flutter_application_1/core/presentation/views/movements/movementsCategories.dart";
import "package:flutter_application_1/core/presentation/widgets/CardMovementsWidget.dart";
import "package:flutter_application_1/core/presentation/widgets/CardWalletWidget.dart";
import "package:flutter_application_1/core/presentation/widgets/CreditCardDetailsModal.dart";

class Movements extends StatefulWidget {
  _MovementsWidget createState() => _MovementsWidget();
}

class _MovementsWidget extends State<Movements> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(124, 77, 246, 1.000),
          title: const Text(
            'Movimientos',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Acción cuando se presiona el botón
                     Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HistoryMovements()));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20), // Ajusta el valor según sea necesario
                    ),
                    backgroundColor: Color.fromRGBO(
                        124, 77, 246, 1.000), // Color de fondo del botón
                    foregroundColor: Colors
                        .white, // Color del texto del botón cuando está en el estado primario
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * .05,
                        vertical: 15), // Ajusta el relleno del botón
                  ),
                  child: Text('Historial de compras'),
                ),
                ElevatedButton(
                    onPressed: () {
                      // Acción cuando se presiona el botón
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovementsCategories()));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20), // Ajusta el valor según sea necesario
                      ),
                      backgroundColor: Color.fromRGBO(
                          124, 77, 246, 1.000), // Color de fondo del botón
                      foregroundColor: Colors
                          .white, // Color del texto del botón cuando está en el estado primario
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .05,
                          vertical: 15), // Ajusta el relleno del botón
                    ),
                    child: Text(
                      'Gastos por categoría',
                      style: TextStyle(
                        // Estilos del texto
                        fontSize: 14, // Reducir el tamaño del texto
                      ),
                      softWrap: true, // Permitir salto de línea
                    ))
              ],
            ),
            Padding(padding: EdgeInsets.all(8.0)),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width * .9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10), // Bordes redondeados
                border: Border.all(
                  color: Color.fromRGBO(124, 77, 246, 1.000),
                  width: 10,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Total gastado este mes: ',
                    style: TextStyle(
                      color: Colors.black, // Color del texto
                      fontSize: 16, // Tamaño de fuente
                      fontWeight:
                          FontWeight.normal, // Peso de fuente en negrita
                    ),
                  ),
                  Text(
                    '\$23,439',
                    style: TextStyle(
                      color: Colors.black, // Color del texto
                      fontSize: 20, // Tamaño de fuente
                      fontWeight: FontWeight.bold, // Peso de fuente en negrita
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Padding(padding: EdgeInsets.all(8.0)),
                Text(
                  'Este mes',
                  style: TextStyle(
                    color: Colors.black, // Color del texto
                    fontSize: 20, // Tamaño de fuente
                    fontWeight: FontWeight.normal, // Peso de fuente en negrita
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CardMovementsWidget(
                  imagePath: 'assets/Images/logoAguakan.jpg',
                  title: 'Aguakan',
                  price: '\$200',
                ),
                CardMovementsWidget(
                  imagePath: 'assets/Images/logoHbo.jpg',
                  title: 'Hbo max',
                  price: '\$300',
                ),
                CardMovementsWidget(
                  imagePath: 'assets/Images/logoAmazon.png',
                  title: 'Amazon',
                  price: '\$400',
                ),
                CardMovementsWidget(
                  imagePath: 'assets/Images/logoAliexpress.jpg',
                  title: 'Ali express',
                  price: '\$300',
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(padding: EdgeInsets.all(10.0)),
            Row(
              children: [
                Padding(padding: EdgeInsets.all(8.0)),
                Text(
                  'Diciembre 2023',
                  style: TextStyle(
                    color: Colors.black, // Color del texto
                    fontSize: 20, // Tamaño de fuente
                    fontWeight: FontWeight.normal, // Peso de fuente en negrita
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CardMovementsWidget(
                  imagePath: 'assets/Images/logoAguakan.jpg',
                  title: 'Aguakan',
                  price: '\$200',
                ),
                SizedBox(width: 8),
                CardMovementsWidget(
                  imagePath: 'assets/Images/logoHbo.jpg',
                  title: 'Hbo max',
                  price: '\$300',
                ),
                SizedBox(width: 8),
                CardMovementsWidget(
                  imagePath: 'assets/Images/logoAmazon.png',
                  title: 'Amazon',
                  price: '\$400',
                ),
                SizedBox(width: 8),
                CardMovementsWidget(
                  imagePath: 'assets/Images/logoAliexpress.jpg',
                  title: 'Ali express',
                  price: '\$300',
                ),
              ],
            ),
          ],
        ));
  }
}
