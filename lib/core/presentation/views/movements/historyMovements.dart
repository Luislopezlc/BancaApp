import "package:flutter/material.dart";
import "package:flutter_application_1/core/data/models/respositories/historyMovementsRepository.dart";
import "package:flutter_application_1/core/domain/usecases/load_history_movements.dart";
import "package:flutter_application_1/core/presentation/bloc/history_movements_bloc.dart";
import "package:flutter_application_1/core/presentation/bloc/history_movements_event.dart";
import "package:flutter_application_1/core/presentation/bloc/history_movements_state.dart";
import "package:flutter_application_1/core/presentation/widgets/CardMovementWidget.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class HistoryMovements extends StatefulWidget {
  _HistoryMovements createState() => _HistoryMovements();
}

class _HistoryMovements extends State<HistoryMovements> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => HistoryMovementsBloc (
      LoadHistoryMovementsData(historyMovementsRepository()),
    )..add(LoadHistoryMovementsDataEvent()),
    child: Scaffold(
      body: BlocBuilder<HistoryMovementsBloc, HistoryMovementsState>(
        builder: (context, state){
          return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(124, 77, 246, 1.000),
          title: const Text(
            'Historial de compras',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), // Bordes redondeados
                border: Border.all(color: Colors.grey), // Borde con color gris
              ),
              child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: state.movements.map((movement) {
    return Column(
      children: [
        CardMovementWidget(
          title1: movement.name,
          title2: '\$${movement.amount.toStringAsFixed(2)}',
          subtitle1: movement.date,
          subtitle2: movement.paymentType,
        ),
        SizedBox(height: 8),
      ],
    );
  }).toList(),
)
            ),
          ),
        ));
        }
      ),
    ),
    );
  }
}
