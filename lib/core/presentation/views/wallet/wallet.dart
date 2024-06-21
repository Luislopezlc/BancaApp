import "package:flutter/material.dart";
import "package:flutter_application_1/core/data/models/respositories/listWalletRepository.dart";
import "package:flutter_application_1/core/domain/usecases/load_list_wallet_data.dart";
import "package:flutter_application_1/core/presentation/bloc/list_wallet_bloc.dart";
import "package:flutter_application_1/core/presentation/bloc/list_wallet_event.dart";
import "package:flutter_application_1/core/presentation/bloc/list_wallet_state.dart";
import "package:flutter_application_1/core/presentation/widgets/CardWalletWidget.dart";
import "package:flutter_application_1/core/presentation/widgets/CreditCardDetailsModal.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class Wallet extends StatefulWidget {
  _Wallet createState() => _Wallet();
}

class _Wallet extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListWalletBloc(
        LoadListWalletData(ListWalletRepository()),
      )..add(LoadListWalletDataEvent()),
      child: Scaffold(
        body: BlocBuilder<ListWalletBloc, ListWalletState>(
          builder: (context, state) {
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
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: state.cards.cards.map((card) {
                  return Column(
                    children: [
                      CardWalletWidget(
                        cardNumber: card.creditCardNumber,
                        cardHolder: card.name,
                        imageUrl: card.imagenUrl,
                        onPressed: () {
                          // Función que se ejecutará cuando se presione el botón
                          showCreditCardDetailsDialog(
                            context,
                            cardNumber: card.creditCardNumber,
                            cardHolder: card.name,
                            expiryDate: card.dueDate,
                            cvv: card.cVV,
                          );
                        },
                      ),
                    ],
                  );
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
