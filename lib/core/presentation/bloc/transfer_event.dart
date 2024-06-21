import 'package:flutter_application_1/core/domain/models/listTransfersModel.dart';

abstract class TransferEvent {}

class LoadTransferDataEvent extends TransferEvent {}

class TranfersChanged extends TransferEvent {
  final ListTransfersModel transfers;

  TranfersChanged(this.transfers);
} 

class TransferSubmitted extends TransferEvent {}
