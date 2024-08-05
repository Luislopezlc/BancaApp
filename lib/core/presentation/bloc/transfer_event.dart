import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/PostTransferDTO.dart';
import 'package:flutter_application_1/core/domain/models/listTransfersModel.dart';

abstract class TransferEvent extends Equatable{}

class LoadTransferDataEvent extends TransferEvent {
   @override
  List<Object> get props => [];
}

class TranfersChanged extends TransferEvent {
  final ListTransfersModel transfers;

  TranfersChanged(this.transfers);
   @override
  List<Object> get props => [];
} 


class TransferSendEvent extends TransferEvent {
  final PostTransferDTO transfer;
  TransferSendEvent(this.transfer);
  @override
  List<Object> get props => [];
}
