import 'package:flutter_application_1/core/domain/usecases/load_movements_data.dart';
import 'package:flutter_application_1/core/presentation/bloc/movements_event.dart';
import 'package:flutter_application_1/core/presentation/bloc/movements_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovementsBloc extends Bloc<MovementsEvent, MovementsState> {
  final LoadMovementsData loadMovementsData;

  MovementsBloc(this.loadMovementsData) : super(const MovementsState()) {
    on<LoadMovementsDataEvent>((event, emit) async {
      final movementsData = await loadMovementsData();
      emit(MovementsState.fromModel(movementsData));
    });

    on<NameChanged>((event, emit) {
      emit(state.copyWith(name: event.name, isValid: _validateMovements()));
    });
    on<DateChanged>((event, emit) {
      emit(state.copyWith(date: event.date, isValid: _validateMovements()));
    });
    on<AmountChanged>((event, emit) {
      emit(state.copyWith(amount: event.amount, isValid: _validateMovements()));
    });
    on<PaymentTypeChanged>((event, emit) {
      emit(state.copyWith(paymentType: event.paymentType, isValid: _validateMovements()));
    });
    on<MovementsSubmitted>((event, emit) {
      if (state.isValid) {
        // Handle movements submission logic
      }
    });
 
  }
 bool _validateMovements() {
    return state.name.isNotEmpty &&
        state.date.isNotEmpty &&
        state.amount > 0 &&
        state.paymentType.isNotEmpty;
  }
  }