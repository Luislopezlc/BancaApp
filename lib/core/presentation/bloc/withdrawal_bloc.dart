import 'package:flutter_application_1/core/domain/usecases/load_withdrawal_data.dart';
import 'package:flutter_application_1/core/presentation/bloc/withdrawal_event.dart';
import 'package:flutter_application_1/core/presentation/bloc/withdrawal_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WithdrawalBloc extends Bloc<WithdrawalEvent, WithdrawalState> {
  final LoadwithdrawalData loadWithdrawalData;

  WithdrawalBloc(this.loadWithdrawalData) : super(const WithdrawalState()) {
    on<LoadWithdrawalDataEvent>((event, emit) async {
      final withdrawalData = await loadWithdrawalData();
      emit(WithdrawalState.fromModel(withdrawalData));
    });

    on<MaxAmountToRetireChanged>((event, emit) {
      emit(state.copyWith(maxAmountToRetire: event.maxAmountToRetire, isValid: _validateWithdrawal()));
    });
    on<AmountToRetireChanged>((event, emit) {
      emit(state.copyWith(amountToRetire: event.amountToRetire, isValid: _validateWithdrawal()));
    });
    on<CodeForRetireChanged>((event, emit) {
      emit(state.copyWith(codeForRetire: event.codeForRetire, isValid: _validateWithdrawal()));
    });
    on<WithdrawalSubmitted>((event, emit) {
      if (state.isValid) {
        // Handle withdrawal submission logic
      }
    });
  }

  bool _validateWithdrawal() {
    return state.maxAmountToRetire > 0 &&
        state.amountToRetire > 0 &&
        state.codeForRetire.isNotEmpty;
  }
}
