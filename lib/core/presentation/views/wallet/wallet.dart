import "package:flutter/material.dart";
import "package:flutter_application_1/core/data/models/respositories/dashboardRepository.dart";
import "package:flutter_application_1/core/data/models/respositories/listWalletRepository.dart";
import "package:flutter_application_1/core/domain/models/walletModel.dart";
import "package:flutter_application_1/core/domain/usecases/load_list_wallet_data.dart";
import "package:flutter_application_1/core/presentation/bloc/list_wallet_bloc.dart";
import "package:flutter_application_1/core/presentation/bloc/list_wallet_event.dart";
import "package:flutter_application_1/core/presentation/bloc/list_wallet_state.dart";
import "package:flutter_application_1/core/presentation/views/errorPage.dart";
import "package:flutter_application_1/core/presentation/widgets/CardWalletWidget.dart";
import "package:flutter_application_1/core/presentation/widgets/CreditCardDetailsModal.dart";
import "package:flutter_application_1/core/presentation/widgets/ToastMessageWidget.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class Wallet extends StatefulWidget {
  _Wallet createState() => _Wallet();
}

class _Wallet extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListWalletBloc(
        LoadListWalletData(ListWalletRepository(), dashboardRepository()),
      )..add(LoadListWalletDataEvent()),
      child: Scaffold(
        body: BlocListener<ListWalletBloc, ListWalletState>(
          listener: (context, state) async {
            if (state is ListWallError) {
              ToastMessageWidget.show(context, state.message);
            }
          },
          child: BlocBuilder<ListWalletBloc, ListWalletState>(
            builder: (context, state) {
              if (state is ListWallInitial || state is ListWallLoading) {
                return buildWallet(context, []);
              } else if (state is ListWallLoaded) {
                return buildWallet(context, state.model.cards);
              } else if (state is ListWallError) {
                return buildWallet(context, []);
              } else {
                return ErrorPage();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildWallet(BuildContext context, List<WalletModel> cards) {
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
        children: cards.map((card) {
          return Column(
            children: [
              CardWalletWidget(
                cardNumber: card.creditCardNumber,
                cardHolder: card.name,
                imageUrl: card.imagenUrl,
                accountNumber : card.accountNumber,
                onPressed: () {
                  // Función que se ejecutará cuando se presione el botón
                  showCreditCardDetailsDialog(
                    context,
                    cardNumber: card.creditCardNumber,
                    cardHolder: card.name,
                    expiryDate: card.dueDate,
                    cvv: card.cVV,
                    accountNumber: card.accountNumber,
                  );
                },
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
