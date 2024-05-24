
import 'package:flutter_application_1/core/domain/models/walletModel.dart';

abstract class implWalletRepository
{
Future<WalletModel> loadWalletModel();
}