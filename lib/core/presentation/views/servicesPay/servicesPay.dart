import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/data/models/respositories/servicesRepository.dart';
import 'package:flutter_application_1/core/domain/usecases/load_services_data.dart';
import 'package:flutter_application_1/core/presentation/bloc/listServices_bloc.dart';
import 'package:flutter_application_1/core/presentation/bloc/listServices_event.dart';
import 'package:flutter_application_1/core/presentation/bloc/listServices_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicePay extends StatelessWidget {
  const ServicePay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MyServicePay();
  }
}

class MyServicePay extends StatefulWidget {
  const MyServicePay({Key? key}) : super(key: key);

  @override
  _MyServicePayState createState() => _MyServicePayState();
}

class _MyServicePayState extends State<MyServicePay> {
  final List<Map<String, String?>> allServices = [
    {
      'name': 'CFE',
      'imageUrl': 'assets/Images/cardCFE.png'
    },
    {
      'name': 'AGUAKAN',
      'imageUrl':'assets/Images/cardAguakan.jpg'
    },
    {
      'name': 'TOTALPLAY',
      'imageUrl': 'assets/Images/cardTotalPlay.png'
    },
    {
      'name': 'IZZI',
      'imageUrl':'assets/Images/cardIzzi.png'
    },
    {
      'name': 'TELMEX',
      'imageUrl':'assets/Images/cardTelmex.jpg'
    },
    {
      'name': 'NETFLIX',
      'imageUrl':'assets/Images/cardNetflix.jpg'
    },
  ];

  late List<Map<String, String?>> filteredServices;

  @override
  void initState() {
    super.initState();
    filteredServices = allServices;
  }

  void _filterServices(String query) {
    setState(() {
      filteredServices = allServices.where((service) {
        final serviceName = service['name']!.toLowerCase();
        final searchLower = query.toLowerCase();

        return serviceName.contains(searchLower);
      }).toList();
    });
  }

  @override
 Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ListServicesBloc(
      LoadServicesData(servicesRepository()),
    )..add(LoadListServicesDataEvent()),
    child: Scaffold(
      body: BlocBuilder<ListServicesBloc,ListServicesState>(
        builder: (context,state){
          return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Color.fromRGBO(124, 77, 246, 1.000), 
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
                children: state.services.services.map((service) {
                  return ServiceButton(
                    serviceImageUrl: service.imagenUrl,
                    serviceName: service.name ?? '',
                    onPressed: () {
                      _showServiceDialog(context, service.name ?? '');
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
        },
      ),
    ),
    );
    }

  void _showServiceDialog(BuildContext context, String serviceName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pagar $serviceName'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Nombre del titular'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Número de referencia'),
              ),
              TextField(
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
                _showConfirmationDialog(context, serviceName);
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
                  child: Image.asset(
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
