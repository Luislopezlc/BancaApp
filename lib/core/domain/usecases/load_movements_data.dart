import 'package:flutter_application_1/core/data/models/respositories/movementsRepository.dart';
import 'package:flutter_application_1/core/data/models/respositories/servicesRepository.dart';
import 'package:flutter_application_1/core/data/models/respositories/transfersRepository.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/ServiceDTO.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/paidServiceDTO.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/transferDTO.dart';
import 'package:flutter_application_1/core/domain/models/movementsModel.dart';
import 'package:flutter_application_1/core/domain/models/responseAPI.dart';
import 'package:flutter_application_1/core/domain/usecases/load_transfer_data.dart';

class LoadMovementsData {
  final movementsRepository repository;
  final transfersRepository transferRepository;
  final servicesRepository serviceRepository;
  final LoadtransferData dataTransfer;
  final servicesRepository paidServicesRepository;
  LoadMovementsData(this.repository, this.transferRepository, this.serviceRepository, this.dataTransfer,this.paidServicesRepository);

  Future<MovementsModel> call() async {
    final movementsData = await repository.loadMovementsModel();

    if (movementsData.name.isEmpty) {
      throw Exception("the field name cant be empty");
    }

    if (movementsData.date.isEmpty) {
      throw Exception("the field date cant be empty");
    }

    return movementsData;
  }

  Future<ResponseAPI> getMovements() async {
    ResponseAPI result = ResponseAPI(status: '400', data: {});
    List<MovementsModel> movements = [];
    List<TransferDTO> transfers = [];
    List<PaidServiceDTO> servicesPaid = [];
    List<ServiceDTO> services = [];

    var responseTransfers = await this.transferRepository.getTransfers();

    if (responseTransfers.status != "200") {
      return responseTransfers;
    }

    if (responseTransfers.data is List<TransferDTO>) {
      transfers = responseTransfers.data as List<TransferDTO>;
    }

    var responsePaidServices = await this.serviceRepository.getPaidServices();

    if (responsePaidServices.status != "200") {
      return responsePaidServices;
    }

    if (responsePaidServices.data is List<PaidServiceDTO>) {
      servicesPaid = responsePaidServices.data as List<PaidServiceDTO>;
    }

    var responseServices = await this.serviceRepository.getServices();

    if (responseServices.status != "200") {
      return responseServices;
    }

    if (responseServices.data is List<ServiceDTO>) {
      services = responseServices.data as List<ServiceDTO>;
    }

    for (var transfer in transfers) {
      var movement = MovementsModel(name: transfer.concept, date: '', amount: transfer.amount, paymentType: 'Credito');
      movements.add(movement);
    }

    for (var servicePaid in servicesPaid) {
      var service = services.where((element) => element.id == servicePaid.idService).firstOrNull;
      var amount = double.parse(servicePaid.amount);
      var name = (service?.name != null || service!.name.isEmpty) ? service!.name : 'Servicio';
      var movement = MovementsModel(name: name , date: '', amount:  amount, paymentType: 'Credito');
      movements.add(movement);
    }

    result.data = movements;
    result.status = '200';
    return result;
  }

  Future<ResponseAPI> getBillsTotal() async
  { 
    ResponseAPI result = ResponseAPI(status: '400', data: {});
    var responseBillsInTransfers = await dataTransfer.getBillsInTranfers();
     if(responseBillsInTransfers.status != '200')
    {
        return responseBillsInTransfers;
    }

    double bills = responseBillsInTransfers.data as double;

    var responseBillsInPaidServices = await paidServicesRepository.getBillsInPaidService();
     if(responseBillsInPaidServices.status != '200')
    {
        return responseBillsInPaidServices;
    }

    bills += responseBillsInPaidServices.data as double;

    result.data = bills;
    result.status = '200';

    return result;
  }
}
