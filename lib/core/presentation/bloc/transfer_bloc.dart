import 'package:flutter_application_1/core/domain/models/transfersModel.dart';
import 'package:flutter_application_1/core/domain/usecases/load_transfer_data.dart';
import 'package:flutter_application_1/core/presentation/bloc/transfer_event.dart';
import 'package:flutter_application_1/core/presentation/bloc/transfer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferBloc extends Bloc<TransferEvent, TransferState> {
  final LoadtransferData loadTransferData;
  
  TransferBloc(this.loadTransferData) : super( TransferInitial()) {



    on<LoadTransferDataEvent>((event, emit) async {
      emit(TransferLoading());
      List<TransferModel> contacts = [];

      final transferData = await loadTransferData.getContacts();
      if(transferData.status != '200')
      {
        emit(const TransferError('No se pudo cargar la infomación, intentar más tarde.',[]));
      } 
      contacts = transferData.data as List<TransferModel>;

      emit(TransferLoaded(contacts));
    });


    on<TransferSendEvent>((event, emit) async {

      emit(const TransferSending('Enviando'));
      List<TransferModel> contacts = [];
      final transferData = await loadTransferData.getContacts();
      if(transferData.status != '200')
      {
        emit(const TransferError('No se pudo cargar la infomación, intentar más tarde.',[]));
      } 
      contacts = transferData.data as List<TransferModel>;

       var responseTransfer = await loadTransferData.postTranfers(event.transfer);

      if(responseTransfer.status != '200')
      {
        emit(TransferError(responseTransfer.message,contacts));
      }else
      {
      emit(TransferSuccess(responseTransfer.message,contacts));
      }


    });


    on<ContactSendEvent> ((event, emit) async {
      emit(const TransferSending('Enviando'));
      List<TransferModel> contacts = [];
      

       var reponseContact = await loadTransferData.postContact(event.contact);

      final transferData = await loadTransferData.getContacts();
      if(transferData.status != '200')
      {
        emit(const TransferError('No se pudo cargar la infomación, intentar más tarde.',[]));
      } 

      contacts = transferData.data as List<TransferModel>;


      if(reponseContact.status != '200')
      {
        emit(TransferError(reponseContact.message,contacts));
      }else
      {
      emit(TransferSuccess(reponseContact.message,contacts));
      }

    });
  }


}
