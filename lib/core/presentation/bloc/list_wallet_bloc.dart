import 'package:flutter_application_1/core/domain/usecases/load_list_wallet_data.dart';
import 'package:flutter_application_1/core/presentation/bloc/list_wallet_event.dart';
import 'package:flutter_application_1/core/presentation/bloc/list_wallet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListWalletBloc extends Bloc<ListWalletEvent,ListWalletState>
{
  final LoadListWalletData loadListWalletData;

  ListWalletBloc(this.loadListWalletData): super (ListWalletState()){
    on<LoadListWalletDataEvent>((event,emit) async {
      final listWallet = await loadListWalletData();
      emit(ListWalletState.fromJson(listWallet));
    });
    on<CardsChanged>((event, emit){
      emit(state.copyWith(cards: event.cards));
    });

  }
}