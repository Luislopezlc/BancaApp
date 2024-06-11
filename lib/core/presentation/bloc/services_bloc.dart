import 'package:flutter_application_1/core/domain/usecases/load_services_data.dart';
import 'package:flutter_application_1/core/presentation/bloc/services_event.dart';
import 'package:flutter_application_1/core/presentation/bloc/services_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  final LoadServicesData loadServicesData;

  ServicesBloc(this.loadServicesData) : super(const ServicesState()) {
    on<LoadServicesDataEvent>((event, emit) async {
      final servicesData = await loadServicesData();
      emit(ServicesState.fromModel(servicesData));
    });

    on<NameChanged>((event, emit) {
      emit(state.copyWith(name: event.name, isValid: _validateServices()));
    });
    on<ClientNameChanged>((event, emit) {
      emit(state.copyWith(clientName: event.clientName, isValid: _validateServices()));
    });
    on<NumberOfReferenceChanged>((event, emit) {
      emit(state.copyWith(numberOfReference: event.numberOfReference, isValid: _validateServices()));
    });
    on<AmountOfPaymentChanged>((event, emit) {
      emit(state.copyWith(amountOfPayment: event.amountOfPayment, isValid: _validateServices()));
    });
    on<ServicesSubmitted>((event, emit) {
      if (state.isValid) {
        // Handle services submission logic
      }
    });
  }

  bool _validateServices() {
    return state.name.isNotEmpty &&
        state.clientName.isNotEmpty &&
        state.numberOfReference.isNotEmpty &&
        state.amountOfPayment.isNotEmpty;
  }
}
