import 'package:flutter_application_1/core/domain/usecases/load_transfer_data.dart';
import 'package:flutter_application_1/core/presentation/bloc/transfer_event.dart';
import 'package:flutter_application_1/core/presentation/bloc/transfer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferBloc extends Bloc<TransferEvent, TransferState> {
  final LoadtransferData loadTransferData;
  
  TransferBloc(this.loadTransferData) : super( TransferState()) {
    on<LoadTransferDataEvent>((event, emit) async {
      final transferData = await loadTransferData.callList();
      emit(TransferState.fromModel(transferData));
    });

    on<TranfersChanged>((event, emit) {
      emit(state.copyWith(transfer: event.transfers));
    });
  }


}
