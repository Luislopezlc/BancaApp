import 'package:flutter_application_1/core/data/models/respositories/servicesRepository.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/ServiceDTO.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/paidServiceDTO.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/transferDTO.dart';
import 'package:flutter_application_1/core/domain/models/listMovementsCategory.dart';
import 'package:flutter_application_1/core/data/models/respositories/transfersRepository.dart';
import 'package:flutter_application_1/core/domain/models/movementsCategoryModel.dart';
import 'package:flutter_application_1/core/domain/models/movementsModel.dart';
import 'package:flutter_application_1/core/domain/models/responseAPI.dart';
class LoadListMovementsCategoryData{
  //final ListMovementsCategoryRepository repository;
  final transfersRepository transferRepository;
    final servicesRepository serviceRepository;

  LoadListMovementsCategoryData(this.transferRepository,this.serviceRepository);

  Future<ResponseAPI> getMovementsCategory() async {
    ResponseAPI result = ResponseAPI(status: '400', data: {});
    List<TransferDTO> transfers = [];
    List<PaidServiceDTO> servicesPaid = [];
    List<ServiceDTO> services = [];
    List<MovementsCategoryModel> movements = [];


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

    var responseTransfers = await this.transferRepository.getTransfers();

    if (responseTransfers.status != "200") {
      return responseTransfers;
    }

    if (responseTransfers.data is List<TransferDTO>) {
      transfers = responseTransfers.data as List<TransferDTO>;
    }

    MovementsCategoryModel tranferences = MovementsCategoryModel(title: "Transferencias", movements: [],);
    for(var transfer in transfers)
    {
        MovementsModel model = MovementsModel(name: '', date: '', amount: 0, paymentType: '');

        model.name = transfer.concept;
        model.amount = transfer.amount;
        model.paymentType = "Credito";
        tranferences.movements.add(model);
    }

      MovementsCategoryModel movementsPaidServices = MovementsCategoryModel(title: "Pago de Servicios", movements: [],);
      for(var servicePaid in servicesPaid)
      {
        var service = services.where((element) => element.id == servicePaid.idService).firstOrNull;
        var amount = double.parse(servicePaid.amount);
        var name = (service?.name != null || service!.name.isEmpty) ? service!.name : 'Servicio';
        var movement = MovementsModel(name: name , date: '', amount:  amount, paymentType: 'Credito');

        movementsPaidServices.movements.add(movement);
     }


    result.data = movements;
    result.status = '200';
    return result;
  }
}
