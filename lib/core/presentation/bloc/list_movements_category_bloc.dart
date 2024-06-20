import 'package:flutter_application_1/core/domain/usecases/load_list_movements_category_data.dart';
import 'package:flutter_application_1/core/presentation/bloc/list_movements_category_event.dart';
import 'package:flutter_application_1/core/presentation/bloc/list_movements_category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListMovementsCategoryBloc
    extends Bloc<ListMovementsCategoryEvent, ListMovementsCategoryState> {
  final LoadListMovementsCategoryData loadListMovementsCategory;

  ListMovementsCategoryBloc(this.loadListMovementsCategory): super(const ListMovementsCategoryState()) {
    on<LoadListMovementsCategory>((event, emit) async {
      final listMovements = await loadListMovementsCategory();
      emit(ListMovementsCategoryState.fromModel(listMovements));
    });

     on<MovementChanged>((event, emit) {
      emit(state.copyWith(movements: event.movements));
    });
  }
}
