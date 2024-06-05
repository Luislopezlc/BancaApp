import 'package:flutter_application_1/core/data/models/respositories/servicesRepository.dart';
import 'package:flutter_application_1/core/domain/models/ServicesModel.dart';

class LoadServicesData {
  final servicesRepository repository;

  LoadServicesData(this.repository);
  
  Future<ServicesModel> call () async {
    final servicesData = await repository.loadServicesModel();

    if(servicesData.name.isEmpty)
    {
      throw Exception("the field name cant be empty");
    }
    
    if(servicesData.clientName.isEmpty)
    {
      throw Exception("the field clientName cant be empty");
    }

     if(servicesData.amountOfPayment.isEmpty)
    {
      throw Exception("the field amountOfPayment cant be empty");
    }
    
    if(servicesData.numberOfReference.isEmpty)
    {
      throw Exception("the field numberOfReference cant be empty");
    }

     return servicesData;
  }
}