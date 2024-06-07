import 'package:flutter_application_1/core/domain/usecases/load_transfer_data.dart';
import 'package:flutter_application_1/core/presentation/bloc/transfer_event.dart';
import 'package:flutter_application_1/core/presentation/bloc/transfer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferBloc extends Bloc<TransferEvent, TransferState> {
  final LoadtransferData loadTransferData;

  TransferBloc(this.loadTransferData) : super(const TransferState()) {
    on<LoadTransferDataEvent>((event, emit) async {
      final transferData = await loadTransferData();
      emit(TransferState.fromModel(transferData));
    });

    on<NameChanged>((event, emit) {
      emit(state.copyWith(name: event.name, isValid: _validateTransfer()));
    });
    on<IconTextChanged>((event, emit) {
      emit(state.copyWith(iconText: event.iconText, isValid: _validateTransfer()));
    });
    on<CreditCardNumberChanged>((event, emit) {
      emit(state.copyWith(creditCardNumber: event.creditCardNumber, isValid: _validateTransfer()));
    });
    on<TransferSubmitted>((event, emit) {
      if (state.isValid) {
        // Handle transfer submission logic
      }
    });
  }

  bool _validateTransfer() {
    return state.name.isNotEmpty &&
        state.iconText.isNotEmpty &&
        state.creditCardNumber.isNotEmpty;
  }
}
