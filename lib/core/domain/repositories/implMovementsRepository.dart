import 'package:flutter_application_1/core/domain/models/movementsModel.dart';

abstract class implMovementsRepository
{
Future<MovementsModel> loadMovementsModel();
}