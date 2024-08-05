
import 'package:flutter_application_1/core/domain/models/apiModels/PostTransferDTO.dart';
import 'package:flutter_application_1/core/domain/models/listTransfersModel.dart';
import 'package:flutter_application_1/core/domain/models/responseAPI.dart';
import 'package:flutter_application_1/core/domain/models/transfersModel.dart';

abstract class implTransfersRepository
{
Future<TransferModel> loadTransferModel();
Future<ListTransfersModel> loadListTransferModel();
Future<ResponseAPI> getTransfers();
Future<ResponseAPI> getContacts();
Future<ResponseAPI> postTransfer(PostTransferDTO transfer);
}