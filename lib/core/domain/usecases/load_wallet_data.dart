import 'package:flutter_application_1/core/data/models/respositories/walletRepository.dart';
import 'package:flutter_application_1/core/domain/models/walletModel.dart';

class LoadWalletData {
  final walletRepository repository;

  LoadWalletData(this.repository);
  
  Future<WalletModel> call () async {
    final walletData = await repository.loadWalletModel();

    if(walletData.name.isEmpty)
    {
      throw Exception("the field name cant be empty");
    }
     return walletData;
  }
}