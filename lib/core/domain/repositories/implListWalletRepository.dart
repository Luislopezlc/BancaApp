import 'package:flutter_application_1/core/domain/models/listWalletModel.dart';

abstract class implListWalletRepository
{
Future<ListWalletModel> loadListWalletModel();
}