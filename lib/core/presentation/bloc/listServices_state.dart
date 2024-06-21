import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/domain/models/listServicesModel.dart';


class ListServicesState extends Equatable {
  final ListServicesModel services;

  ListServicesState({
    ListServicesModel? services,
  }) : services = services ?? ListServicesModel(services: []);

  factory ListServicesState.fromModel(ListServicesModel model) {
    return ListServicesState(
      services: model,
    );
  }

  ListServicesState copyWith({
    ListServicesModel? services,
  }) {
    return ListServicesState(
      services: services ?? this.services,
    );
  }

  @override
  List<Object?> get props => [services];
}
