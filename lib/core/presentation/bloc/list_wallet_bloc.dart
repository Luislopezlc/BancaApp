import 'package:flutter_application_1/core/domain/models/listWalletModel.dart';
import 'package:flutter_application_1/core/domain/usecases/load_list_wallet_data.dart';
import 'package:flutter_application_1/core/presentation/bloc/list_wallet_event.dart';
import 'package:flutter_application_1/core/presentation/bloc/list_wallet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListWalletBloc extends Bloc<ListWalletEvent,ListWalletState>
{
  final LoadListWalletData loadListWalletData;

  ListWalletBloc(this.loadListWalletData): super (ListWallInitial()){

    on<LoadListWalletDataEvent>((event,emit) async {
      
      var model = ListWalletModel(cards: []);

      emit(ListWallLoading());
      
      final responseWallet = await loadListWalletData.getCards();

      if(responseWallet.status != '200')
      {
        emit(ListWallError(responseWallet.message));
      }

      model = responseWallet.data as ListWalletModel;

      emit(ListWallLoaded(model));
    });
   
  }
}