import "package:flutter/material.dart";
import "package:flutter_application_1/core/data/models/respositories/transfersRepository.dart";
import "package:flutter_application_1/core/domain/usecases/load_transfer_data.dart";
import "package:flutter_application_1/core/presentation/bloc/transfer_bloc.dart";
import "package:flutter_application_1/core/presentation/bloc/transfer_event.dart";
import "package:flutter_application_1/core/presentation/bloc/transfer_state.dart";
import "package:flutter_application_1/core/presentation/widgets/CardTransfers.dart";
import "package:flutter_application_1/core/presentation/widgets/CardWalletWidget.dart";
import "package:flutter_application_1/core/presentation/widgets/CreditCardDetailsModal.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class Transfers extends StatefulWidget {
  _Transfers createState() => _Transfers();
}

class _Transfers extends State<Transfers> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransferBloc(
        LoadtransferData(transfersRepository()),
      )..add(LoadTransferDataEvent()),
      child: Scaffold(
        body: BlocBuilder<TransferBloc, TransferState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Color.fromRGBO(124, 77, 246, 1.000),
                title: const Text(
                  'Transferencias',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              body: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Elige al destinatario',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0, // Tamaño del texto del subtítulo
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: 70), // Espacio para el botón
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: state.transfers.transfer.map((transfer) {
                            return Column(
                              children: [
                                SizedBox(height: 10),
                                CardTransfers(
                                  textName: transfer.name,
                                  texto: transfer.iconText,
                                  diametro: 30.0,
                                  espacioEntre:
                                      10.0, // Espacio entre el círculo y el texto
                                  onPressed: () {
                                    // Evento al hacer clic en el botón
                                    _showDialogTransfer(context, transfer.name);
                                  },
                                ),
                                SizedBox(height: 8),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        onPressed: () {
                          // Acción cuando se presiona el botón
                          _showServiceDialog(context);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                20), // Ajusta el valor según sea necesario
                          ),
                          backgroundColor: Color.fromRGBO(
                              124, 77, 246, 1.000), // Color de fondo del botón
                          foregroundColor: Colors
                              .white, // Color del texto del botón cuando está en el estado primario
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * .05,
                              vertical: 25), // Ajusta el relleno del botón
                        ),
                        child: Text('Crear contacto'),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _showServiceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Nuevo contacto'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Nombre del titular'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Número de tarjeta'),
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
                _showConfirmationDialog(context);
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

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Acción relizada correctamente'),
          content: Text('El contacto se guardo correctamente.'),
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

  void _showDialogTransfer(BuildContext context, String name) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tranferir a: $name'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Concepto'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Monto'),
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
                _showConfirmationDialogTransfer(context);
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

  void _showConfirmationDialogTransfer(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Acción relizada correctamente'),
          content: Text('Transferencia compleada correctamente.'),
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
