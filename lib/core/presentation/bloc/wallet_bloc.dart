import 'package:flutter_application_1/core/domain/usecases/load_wallet_data.dart';
import 'package:flutter_application_1/core/presentation/bloc/wallet_event.dart';
import 'package:flutter_application_1/core/presentation/bloc/wallet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final LoadWalletData loadWalletData;

  WalletBloc(this.loadWalletData) : super(const WalletState()) {
    on<LoadWalletDataEvent>((event, emit) async {
      final walletData = await loadWalletData();
      emit(WalletState.fromModel(walletData));
    });

    on<NameChanged>((event, emit) {
      emit(state.copyWith(name: event.name, isValid: _validateWallet()));
    });
    on<CreditCardNumberChanged>((event, emit) {
      emit(state.copyWith(creditCardNumber: event.creditCardNumber, isValid: _validateWallet()));
    });
    on<DueDateChanged>((event, emit) {
      emit(state.copyWith(dueDate: event.dueDate, isValid: _validateWallet()));
    });
    on<CVVChanged>((event, emit) {
      emit(state.copyWith(cVV: event.cVV, isValid: _validateWallet()));
    });

    on<ImagenUrl>((event, emit) {
      emit(state.copyWith(imagenUrl: event.imagenUrl, isValid: _validateWallet()));
    });

    on<WalletSubmitted>((event, emit) {
      if (state.isValid) {
        // Handle wallet submission logic
      }
    });
  }

  bool _validateWallet() {
    return state.name.isNotEmpty &&
        state.creditCardNumber.isNotEmpty &&
        state.dueDate.isNotEmpty &&
        state.imagenUrl.isNotEmpty &&
        state.cVV.isNotEmpty;
  }
}
