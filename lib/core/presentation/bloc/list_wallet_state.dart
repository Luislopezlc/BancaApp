
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/domain/models/listWalletModel.dart';

class ListWalletState extends Equatable{
  final ListWalletModel cards;


ListWalletState({
  ListWalletModel? cards,
}) : cards = cards ?? ListWalletModel(cards: []);

factory ListWalletState.fromJson(ListWalletModel model)
{
  return ListWalletState(
    cards: model
  );
}


ListWalletState copyWith({
  ListWalletModel? cards,
})
{
  return ListWalletState(
    cards: cards ?? this.cards
  );
}
@override
List<Object> get props => [cards];

}

