import 'package:flutter/material.dart';

void main() {
  runApp(const ServicePay());
}

class ServicePay extends StatelessWidget {
  const ServicePay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyServicePay(),
    );
  }
}

class MyServicePay extends StatefulWidget {
  const MyServicePay({Key? key}) : super(key: key);

  @override
  _MyServicePayState createState() => _MyServicePayState();
}

class _MyServicePayState extends State<MyServicePay> {
  final List<Map<String, String?>> allServices = [
  {'name': 'CFE', 'imageUrl': 'data:image/png;base64,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'},
  {'name': 'AGUAKAN', 'imageUrl': 'data:image/jpeg;base64,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'},
  {'name': 'TOTALPLAY', 'imageUrl': 'data:image/png;base64,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'},
  {'name': 'IZZI', 'imageUrl': 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAQMAAADDCAMAAACxkIT5AAAAwFBMVEUAAAD////Jycn/aQD7AHEAvbb/zwDt7e29vb2Li4snJydDQ0Pk5OQ9PT3g4OCysrL/AHY/GQFzMQCHOQHrYAHoAGna2tpzADNUVFQKCgoBl5IAMjDvwwBPQAL/1ABiVQFcXFzcAWU5ABkAExLWsAEAxb0APjv29vbR0dFwcHAzMzNkZGSdnZ0aGhp6MwAaCwA8FwPOAV19fX1kAi4aAAupqamXl5dNTU0rKyseHh6CgoIBKCbJpQH/3AFVRwEeGQINdBHiAAADKklEQVR4nO3abUPSUBiHcUYpiIJaSWplVNpAxcpSs8fv/61yb8bh/He2G8J2ltfvZezs4Wobx6OtFgAAAAAAAAAAAAAAAAAAAAAAAAAAzbB78SR38aHus6nH00eO3brPph40oEGGBjTI0IAGGRrQIEMDGmQunjk+1n02AGJ0M27bXeXDJosMazvHcweOT/2z+bTnePsvrj8zShYwyIdtLDIscY43N3DTP5s3j2d24mwwLL4UGtCABjSgAQ1oQAP/Uh5og8utQdDW8g32dhwrbzDuzKS92b9PN/shvW3/Wtrh/buH8od1nQ/LG3x+7vjyt9fsm/vP6VVvf6frX8ugesyddmm58gb3a/EGci1bpgNJufHcx41qIHd0Z2o5jiQYzn/epAZD/1pS080jCfybp0EN5C5IZL2jiCTo+Fs0p4EmuLEc5EoS3PqbNKaBvA5tCa79UQXPT1MayB2djCyHkLlj2q/YKN4GmmBiOcLEdPM0o4HMDpNLywHOTAma0UDea8mGZf/7MuyscLsmNDiXazm37L4vwwLPTwMayKvdluBr6g8LPT/xN9BlgW3Lzqcdf1jw+Ym+waUk6Aa2nCcJroObxt5Av91sCwYDf1jJ8xN5A00wLNzOJxPrsucn7gb6Bb/kmknp8xN1A11YXHLNpPwVEnODG0kgP/YWkinVuHz7iBtsagLTspFMqapeIfE26MscJzWtmch8ovIVEm0DneYlBT/2KvkmqX5+Ym1wqwlMaybyTdI5qBwTaQOd6SYjyy7lNZrKypmKtMGSCfQ1anl+4mygvx4cWXZ46j9AqemKomwgk/1k37I/eYBsXyT33OCdSz4NNdDfpZhO7NZPUDE1yt1vg8OTtdzJe//TUAO5CxL9ksjNVgX8iUG6Hdade08cOFadoHW4tpoGJcINSpkerpVY1X1AAxrQgAY0oAEN/qMGzJEq7oNh4G80OwtIv+XDIm3w/YVDf2harUnXrm1alwMemB8vZ9Zf1X029Tg+Ws/9pMH6EQ1oQAMa0IAGNKBBiwaZ46OZhzpP/PXa8bvuswEAAAAAAAAAAAAAAAAAAAAAAAAAAFX+AL1ZXeCsF1OwAAAAAElFTkSuQmCC'},
  {'name': 'TELMEX', 'imageUrl': 'data:image/jpeg;base64,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'},
  {'name': 'NETFLIX', 'imageUrl': 'data:image/jpeg;base64,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'},

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7C4DF6),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Todos los servicios',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
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
                children: filteredServices.map((service) {
                  return ServiceButton(
                    serviceImageUrl: service['imageUrl'],
                    serviceName: service['name'] ?? '',
                    onPressed: () {
                      _showServiceDialog(context, service['name'] ?? '');
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



