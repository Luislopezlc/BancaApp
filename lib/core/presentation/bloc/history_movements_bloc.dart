import 'package:flutter_application_1/core/domain/models/movementsModel.dart';
import 'package:flutter_application_1/core/domain/usecases/load_history_movements.dart';
import 'package:flutter_application_1/core/domain/usecases/load_movements_data.dart';
import 'package:flutter_application_1/core/presentation/bloc/history_movements_event.dart';
import 'package:flutter_application_1/core/presentation/bloc/history_movements_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryMovementsBloc
    extends Bloc<HistoryMovementsEvent, HistoryMovementsState> {
  final LoadHistoryMovementsData loadHistoryMovements;
  final LoadMovementsData loadMovementsData;

  HistoryMovementsBloc(this.loadHistoryMovements, this.loadMovementsData): super(HistoryMovementsInitial()) {

    on<LoadHistoryMovementsDataEvent>((event, emit) async {
      emit(HistoryMovementsLoading());

      List<MovementsModel> data = [];

      final movementsHistoriaData = await loadMovementsData.getMovements();

      if (movementsHistoriaData.status != "200")
      {
        emit(HistoryMovementsError(movementsHistoriaData.message));
      } 
      else
      {
        data = movementsHistoriaData.data as List<MovementsModel>;
        emit(HistoryMovementsLoaded(data));
      }
    });
  }
}
