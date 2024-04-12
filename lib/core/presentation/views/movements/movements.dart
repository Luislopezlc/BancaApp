import "package:flutter/material.dart";
import "package:flutter_application_1/core/presentation/widgets/CardWalletWidget.dart";
import "package:flutter_application_1/core/presentation/widgets/CreditCardDetailsModal.dart";

class Movements extends StatefulWidget {
  _Movements createState() => _Movements();
}

class _Movements extends State<Movements> {
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
      body: Column()
    );
  }
}
