import 'package:flutter_application_1/core/domain/models/withdrawalModel.dart';

abstract class implwithdrawalModelRepository
{
Future<withdrawalModel> loadWithdrawalModel();
}