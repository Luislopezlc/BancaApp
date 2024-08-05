import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/domain/models/listTransfersModel.dart';
import 'package:flutter_application_1/core/domain/models/transfersModel.dart';

class TransferState extends Equatable {
 const TransferState();
  @override
  List<Object?> get props => [];
}

class TransferInitial extends TransferState{}
class TransferSuccess extends TransferState{}
class TransferLoading extends TransferState{}
class TransferLoaded extends TransferState{
  final List<TransferModel> contacts;
  const TransferLoaded(this.contacts);
   @override
  List<Object?> get props => [contacts];
}
class TransferError extends TransferState{
  final String message ;
 const TransferError(this.message);
   @override
  List<Object?> get props => [message];
}