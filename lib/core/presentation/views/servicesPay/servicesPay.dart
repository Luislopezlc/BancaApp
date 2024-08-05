import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/data/models/respositories/servicesRepository.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/postServiceDTO.dart';
import 'package:flutter_application_1/core/domain/models/servicePaymentModel.dart';
import 'package:flutter_application_1/core/domain/usecases/load_services_data.dart';
import 'package:flutter_application_1/core/presentation/bloc/listServices_bloc.dart';
import 'package:flutter_application_1/core/presentation/bloc/listServices_event.dart';
import 'package:flutter_application_1/core/presentation/bloc/listServices_state.dart';
import 'package:flutter_application_1/core/presentation/views/errorPage.dart';
import 'package:flutter_application_1/core/presentation/widgets/ToastMessageWidget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicePay extends StatelessWidget {
  const ServicePay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyServicePay();
  }
}

class MyServicePay extends StatefulWidget {
  const MyServicePay({Key? key}) : super(key: key);

  @override
  _MyServicePayState createState() => _MyServicePayState();
}

class _MyServicePayState extends State<MyServicePay> {
  final List<Map<String, String?>> allServices = [
    {'name': 'CFE', 'imageUrl': 'assets/Images/cardCFE.png'},
    {'name': 'AGUAKAN', 'imageUrl': 'assets/Images/cardAguakan.jpg'},
    {'name': 'TOTALPLAY', 'imageUrl': 'assets/Images/cardTotalPlay.png'},
    {'name': 'IZZI', 'imageUrl': 'assets/Images/cardIzzi.png'},
    {'name': 'TELMEX', 'imageUrl': 'assets/Images/cardTelmex.jpg'},
    {'name': 'NETFLIX', 'imageUrl': 'assets/Images/cardNetflix.jpg'},
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListServicesBloc(
        LoadServicesData(servicesRepository()),
      )..add(LoadListServicesDataEvent()),
      child: Scaffold(
        body: BlocListener<ListServicesBloc, ListServicesState>(
            listener: (context, state) async {
          if (state is ListServicesError) {
            ToastMessageWidget.show(context, state.message);
          } else if (state is ListServicesSending) {
            ToastMessageWidget.show(context, state.message);
          } else if (state is ListServicesError) {
            ToastMessageWidget.show(context, state.message);
          } else if (state is ListServicesSuccess) {
            ToastMessageWidget.show(context, state.message);
          }
        }, child: BlocBuilder<ListServicesBloc, ListServicesState>(
          builder: (context, state) {
            if (state is ListServicesInitial || state is ListServicesLoading) {
              return buildServices(context, []);
            } else if (state is ListServicesLoaded) {
              return buildServices(context, state.services);
            } else if (state is ListServicesSending) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ListServicesError) {
              return buildServices(context, []);
            } else if (state is ListServicesSuccess) {
              return buildServices(context, state.services);
            } else {
              return ErrorPage();
            }
          },
        )),
      ),
    );
  }

  Widget buildServices(
      BuildContext context, List<ServicePaymentModel> services) {
    var servicesFilter = services;

    void _filterServices(String query) {
      BlocProvider.of<ListServicesBloc>(context)
          .add(ServicesFilterEvent(query));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(124, 77, 246, 1.000),
        title: const Text(
          'Todos los servicios',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar servicios...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: _filterServices,
            ),
          ),
          Expanded(
            child: Container(
              color: Color.fromARGB(255, 255, 255, 255),
              child: GridView.count(
                crossAxisCount: 2,
                children: servicesFilter.map((service) {
                  return ServiceButton(
                    serviceImageUrl: service.imagenUrl,
                    serviceName: service.name ?? '',
                    onPressed: () {
                      _showServiceDialog(context, service.name ?? '', service.id);
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showServiceDialog(BuildContext _context, String serviceName, int idService) {

  TextEditingController referenceController = TextEditingController();
  TextEditingController amountController = TextEditingController();

    showDialog(
      context: _context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pagar $serviceName'),
          content:  Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextField(
                decoration: InputDecoration(labelText: 'Nombre del titular'),
              ),
              TextField(
                controller: referenceController,
                decoration: InputDecoration(labelText: 'Número de referencia'),
              ),
              TextField(
                controller: amountController,
                decoration: InputDecoration(labelText: 'Monto a pagar'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();

                PostServiceDTO services = PostServiceDTO(
                    idService: idService,
                    idUsers: 0,
                    idAccount: 0,
                    amount: int.parse(amountController.text),
                    reference: referenceController.text);

                BlocProvider.of<ListServicesBloc>(_context)
                    .add(PostServiceEvent(services));
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  void _showConfirmationDialog(BuildContext context, String serviceName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmación de pago'),
          content: Text('Pago de $serviceName procesado correctamente.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}

class ServiceButton extends StatelessWidget {
  final String? serviceImageUrl;
  final String serviceName;
  final VoidCallback onPressed;

  const ServiceButton({
    Key? key,
    required this.serviceImageUrl,
    required this.serviceName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (serviceImageUrl != null)
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    serviceImageUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            SizedBox(height: 10),
            Text(
              serviceName,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
