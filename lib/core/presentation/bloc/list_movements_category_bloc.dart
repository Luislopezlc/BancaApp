import 'package:flutter_application_1/core/domain/models/movementsCategoryModel.dart';
import 'package:flutter_application_1/core/domain/usecases/load_list_movements_category_data.dart';
import 'package:flutter_application_1/core/presentation/bloc/list_movements_category_event.dart';
import 'package:flutter_application_1/core/presentation/bloc/list_movements_category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListMovementsCategoryBloc
    extends Bloc<ListMovementsCategoryEvent, ListMovementsCategoryState> {
  final LoadListMovementsCategoryData loadListMovementsCategory;

  ListMovementsCategoryBloc(this.loadListMovementsCategory): super(ListMovementsCategoryInitial()) {
    
    
    on<LoadMovementsCategoryDataEvent>((event, emit) async {
      emit(ListMovementsCategoryLoading());
      
      List<MovementsCategoryModel> movements = [];

      var response = await loadListMovementsCategory.getMovementsCategory();
      if(response.status != "200")
      {
        emit(ListMovementsCategoryError(response.message));
      }else
      {
        movements = response.data as List<MovementsCategoryModel>;
        emit(ListMovementsCategoryLoaded(movements));
      }
    });

    
  }
}
