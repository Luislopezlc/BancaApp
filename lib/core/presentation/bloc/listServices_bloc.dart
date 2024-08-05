import 'package:flutter_application_1/core/domain/models/listServicesModel.dart';
import 'package:flutter_application_1/core/domain/models/servicePaymentModel.dart';
import 'package:flutter_application_1/core/domain/usecases/load_services_data.dart';
import 'package:flutter_application_1/core/presentation/bloc/listServices_event.dart';
import 'package:flutter_application_1/core/presentation/bloc/listServices_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ListServicesBloc extends Bloc<ListServicesEvent, ListServicesState> {
  final LoadServicesData  loadListServices;

  ListServicesBloc(this.loadListServices) : super(ListServicesInitial()) {


    on<LoadListServicesDataEvent>((event, emit) async {
      emit(ListServicesLoading());
      List<ServicePaymentModel> services = [];
      final listServices = await loadListServices.getServices();
      if(listServices.status != '200')
      {
          emit(ListServicesError(listServices.message,[]));
      }else
      {
        services = listServices.data as List<ServicePaymentModel>;
        emit(ListServicesLoaded(services));
      }

    });

    on<ServicesFilterEvent> ((event, emit) async { 
        emit(ListServicesLoading());
      List<ServicePaymentModel> services = [];
      final listServices = await loadListServices.getServices();
      if(listServices.status != '200')
      {
          emit(ListServicesError(listServices.message,[]));
      }else
      {
        services = listServices.data as List<ServicePaymentModel>;
        var serviceFilter = services.where((s) => s.name.toLowerCase().contains(event.name.toLowerCase())).toList();
        emit(ListServicesLoaded(serviceFilter));
      }

    });


    on<PostServiceEvent> ((event, emit) async { 
      emit(const ListServicesSending('Enviando'));

      List<ServicePaymentModel> services = [];
      final listServices = await loadListServices.getServices();
      if(listServices.status != '200')
      {
          emit(ListServicesError(listServices.message,[]));
      }else
      {
         services = listServices.data as List<ServicePaymentModel>;
      }

      var responseService = await loadListServices.postService(event.service);
       if(responseService.status != '200')
      {
          emit(ListServicesError(responseService.message,services));
      }else
      {
         emit(ListServicesSuccess(responseService.message,services));
      }

    });
    // on<ServicesChanged>((event, emit) {
    //   emit(state.copyWith(services: event.services));
    // });

    // on<ListServicesSubmitted>((event, emit) {
    //   // Lógica para manejar la presentación de la lista de servicios
    //   // Puedes agregar cualquier lógica adicional necesaria aquí
    // });
  }
}
