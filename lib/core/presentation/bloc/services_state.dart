import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/domain/models/ServicesModel.dart';

class ServicesState extends Equatable {
  final String name;
  final String clientName;
  final String numberOfReference;
  final String amountOfPayment;
  final bool isValid;

  const ServicesState({
    this.name = '',
    this.clientName = '',
    this.numberOfReference = '',
    this.amountOfPayment = '',
    this.isValid = false,
  });

  factory ServicesState.fromModel(ServicesModel model) {
    return ServicesState(
      name: model.name,
      clientName: model.clientName,
      numberOfReference: model.numberOfReference,
      amountOfPayment: model.amountOfPayment,
      isValid: true,
    );
  }

  ServicesState copyWith({
    String? name,
    String? clientName,
    String? numberOfReference,
    String? amountOfPayment,
    bool? isValid,
  }) {
    return ServicesState(
      name: name ?? this.name,
      clientName: clientName ?? this.clientName,
      numberOfReference: numberOfReference ?? this.numberOfReference,
      amountOfPayment: amountOfPayment ?? this.amountOfPayment,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [
        name,
        clientName,
        numberOfReference,
        amountOfPayment,
        isValid,
      ];
}
