import 'package:flutter_application_1/core/domain/usecases/load_history_movements.dart';
import 'package:flutter_application_1/core/presentation/bloc/history_movements_event.dart';
import 'package:flutter_application_1/core/presentation/bloc/history_movements_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryMovementsBloc extends Bloc<HistoryMovementsEvent, HistoryMovementsState> {
  final LoadHistoryMovementsData loadHistoryMovements;

  HistoryMovementsBloc(this.loadHistoryMovements) : super(const HistoryMovementsState()) {
    on<LoadHistoryMovementsDataEvent>((event, emit) async {
     final movementsHistoriaData = await loadHistoryMovements();
      emit(HistoryMovementsState.fromModel(movementsHistoriaData));
    });

     on<MovementsChanged>((event, emit) {
      emit(state.copyWith(movements: event.movements, isLoading: _validateDashboard()));
    });
  }

  bool _validateDashboard() {
    return 
       state.movements.isNotEmpty; // Descomenta esto si MovementsModel está definido y quieres incluirlo
  }
}
