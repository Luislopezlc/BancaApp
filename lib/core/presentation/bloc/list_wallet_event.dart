import 'package:flutter_application_1/core/domain/models/listWalletModel.dart';

abstract class ListWalletEvent {}

class LoadListWalletDataEvent extends ListWalletEvent {}

class CardsChanged extends LoadListWalletDataEvent
{
  final ListWalletModel cards;
  CardsChanged(this.cards);
}

class ListWalletSubmitted extends ListWalletEvent{}