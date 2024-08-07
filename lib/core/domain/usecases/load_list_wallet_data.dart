import 'dart:math';

import 'package:flutter_application_1/core/data/models/respositories/dashboardRepository.dart';
import 'package:flutter_application_1/core/data/models/respositories/listWalletRepository.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/accountDTO.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/userDTO.dart';
import 'package:flutter_application_1/core/domain/models/listWalletModel.dart';
import 'package:flutter_application_1/core/domain/models/responseAPI.dart';
import 'package:flutter_application_1/core/domain/models/walletModel.dart';
import 'package:flutter_application_1/core/presentation/views/wallet/wallet.dart';

class LoadListWalletData{
  final ListWalletRepository repository;
  final dashboardRepository dashboardRepo;
  LoadListWalletData(this.repository, this.dashboardRepo);


Future<ListWalletModel>call() async{
  final data = await this.repository.loadListWalletModel();
  return data;
}

Future<ResponseAPI>getCards() async
{
  ResponseAPI result = ResponseAPI(status: '400', data: {});
  
  ListWalletModel model =  ListWalletModel(cards: []);
  AccountDTO accountDTO = AccountDTO(
        id: 0,
        idUser: 0,
        balance: 0,
        status: 0,
        card: [],
        user: UserDTO(
            name: '',
            lastname: '',
            email: '',
            rfc: '',
            phone: '',
            password: '',
            id_bank: 0));

    var responseAccount = await dashboardRepo.getAccountDTO();

    if (responseAccount.status != "200") {
      return responseAccount;
    }

    if (responseAccount.data is AccountDTO) {
      accountDTO = responseAccount.data as AccountDTO;
    }

    for(var card in accountDTO.card)
    {
      var cardModel = WalletModel(name: '',cVV:'',creditCardNumber: '', imagenUrl: '',dueDate: '', accountNumber: '');

      cardModel.name = accountDTO.user.name;

      cardModel.cVV = generateRandomCvv();

      cardModel.creditCardNumber = card.cardNumber;

      cardModel.dueDate = generateRandomExpirationDate();

      cardModel.imagenUrl = 'assets/Images/tarjetaMorada.jpg';

      cardModel.accountNumber = card.cardAccount;

      model.cards.add(cardModel);
    }

    result.status = '200';
    result.data = model;
    return result;
}

}
// Genera un número aleatorio entre 100 y 999
 String generateRandomCvv() {
    var random = Random();
    int cvv = random.nextInt(900) + 100; 
    return cvv.toString();
  }


  String generateRandomExpirationDate() {
    var random = Random();
    int month = random.nextInt(12) + 1; // Genera un número aleatorio entre 1 y 12
    int year = random.nextInt(10) + 24; // Genera un número aleatorio entre 24 y 33 (años futuros)
    String monthStr = month.toString().padLeft(2, '0'); // Asegura que el mes tenga dos dígitos
    return '$monthStr/$year';
  }

