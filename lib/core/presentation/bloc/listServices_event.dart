
import 'package:flutter_application_1/core/domain/models/listServicesModel.dart';

abstract class ListServicesEvent {}

class LoadListServicesDataEvent extends ListServicesEvent {}

class ServicesChanged extends ListServicesEvent {
  final ListServicesModel services;

  ServicesChanged(this.services);
}

class ListServicesSubmitted extends ListServicesEvent {}

// Puedes definir más eventos según sea necesario para tu lógica
