import 'package:flutter_application_1/core/data/models/respositories/listWalletRepository.dart';
import 'package:flutter_application_1/core/domain/models/listWalletModel.dart';

class LoadListWalletData{
  final ListWalletRepository repository;
  LoadListWalletData(this.repository);
Future<ListWalletModel>call() async{
  final data = await this.repository.loadListWalletModel();
  return data;
}

}