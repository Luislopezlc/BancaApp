import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/domain/models/listTransfersModel.dart';
import 'package:flutter_application_1/core/domain/models/transfersModel.dart';

class TransferState extends Equatable {
  final ListTransfersModel transfers;

 TransferState({
      ListTransfersModel? transfers,
  }) : transfers = transfers ?? ListTransfersModel(transfer: []);

  factory TransferState.fromModel(ListTransfersModel model) {
    return TransferState(
      transfers: model
    );
  }

  TransferState copyWith({
       ListTransfersModel? transfer,
  }) {
    return TransferState(
      transfers: transfer ?? transfers,
    );
  }

  @override
  List<Object?> get props => [transfers];
}
