import 'package:flutter_application_1/core/domain/models/listServicesModel.dart';
import 'package:flutter_application_1/core/domain/usecases/load_services_data.dart';
import 'package:flutter_application_1/core/presentation/bloc/listServices_event.dart';
import 'package:flutter_application_1/core/presentation/bloc/listServices_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ListServicesBloc extends Bloc<ListServicesEvent, ListServicesState> {
  final LoadServicesData  loadListServices;

  ListServicesBloc(this.loadListServices) : super(ListServicesState()) {
    on<LoadListServicesDataEvent>((event, emit) async {
      final listServices = await loadListServices.callList();
      emit(ListServicesState.fromModel(listServices));
    });

    on<ServicesChanged>((event, emit) {
      emit(state.copyWith(services: event.services));
    });

    on<ListServicesSubmitted>((event, emit) {
      // Lógica para manejar la presentación de la lista de servicios
      // Puedes agregar cualquier lógica adicional necesaria aquí
    });
  }
}
