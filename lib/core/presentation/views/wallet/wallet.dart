import "package:flutter/material.dart";
import "package:flutter_application_1/core/presentation/widgets/CardWalletWidget.dart";
import "package:flutter_application_1/core/presentation/widgets/CreditCardDetailsModal.dart";

class Wallet extends StatefulWidget {
  _Wallet createState() => _Wallet();
}

class _Wallet extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(124, 77, 246, 1.000),
        title: const Text(
          'Mis tarjetas',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        CardWalletWidget(
          cardNumber: "4239 3923 5994 2541",
          cardHolder: "America del Pilar Bolaños Arias",
          imageUrl:
              'assets/Images/tarjetaAzul.jpg',
          onPressed: () {
            // Función que se ejecutará cuando se presione el botón
            showCreditCardDetailsDialog(
              context,
              cardNumber: '4239 3923 5994 2541',
              cardHolder: 'America del Pilar Bolaños Arias',
              expiryDate: '12/26',
              cvv: '123',
            );
          },
        ),
        CardWalletWidget(
          cardNumber: "4239 3923 5994 2541",
          cardHolder: "America del Pilar Bolaños Arias",
          imageUrl:
              'assets/Images/tarjetaBlanca.jpg',
          onPressed: () {
            // Función que se ejecutará cuando se presione el botón
            showCreditCardDetailsDialog(
              context,
              cardNumber: '4239 3923 5994 2541',
              cardHolder: 'America del Pilar Bolaños Arias',
              expiryDate: '12/26',
              cvv: '123',
            );
          },
        ),
        CardWalletWidget(
          cardNumber: "4239 3923 5994 2541",
          cardHolder: "America del Pilar Bolaños Arias",
          imageUrl:
              'assets/Images/tarjetaMorada.jpg',
          onPressed: () {
            // Función que se ejecutará cuando se presione el botón
            showCreditCardDetailsDialog(
              context,
              cardNumber: '4239 3923 5994 2541',
              cardHolder: 'America del Pilar Bolaños Arias',
              expiryDate: '12/26',
              cvv: '123',
            );
          },
        ),
      ]),
    );
  }
}
