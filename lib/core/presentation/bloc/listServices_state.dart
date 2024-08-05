import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/domain/models/listServicesModel.dart';
import 'package:flutter_application_1/core/domain/models/servicePaymentModel.dart';


class ListServicesState extends Equatable {
 const ListServicesState();
 @override
  List<Object> get props => [];
}


class ListServicesLoading extends ListServicesState {}
class ListServicesLoaded extends ListServicesState {
  final List<ServicePaymentModel> services;

  const ListServicesLoaded(this.services);
     @override
  List<Object> get props => [services];
}
class ListServicesInitial extends ListServicesState {}

class ListServicesError extends ListServicesState{
  final String message;
  final List<ServicePaymentModel> services;

  const ListServicesError(this.message,this.services);
    @override
  List<Object> get props => [message,services];
}

class ListServicesSuccess extends ListServicesState{
  final String message;
  final List<ServicePaymentModel> services;

  const ListServicesSuccess(this.message,this.services);
    @override
  List<Object> get props => [message,services];
}

class ListServicesSending extends ListServicesState{
  final String message;
  const ListServicesSending(this.message);
    @override
  List<Object> get props => [message];
}