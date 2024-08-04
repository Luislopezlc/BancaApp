import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/data/models/respositories/dashboardRepository.dart';
import 'package:flutter_application_1/core/data/models/respositories/transfersRepository.dart';
import 'package:flutter_application_1/core/domain/models/dashboardModel.dart';
import 'package:flutter_application_1/core/domain/usecases/load_dashboard_data.dart';
import 'package:flutter_application_1/core/domain/usecases/load_movements_data.dart';
import 'package:flutter_application_1/core/presentation/bloc/dashboard_bloc.dart';
import 'package:flutter_application_1/core/presentation/bloc/dashboard_event.dart';
import 'package:flutter_application_1/core/presentation/bloc/dashboard_state.dart';
import 'package:flutter_application_1/core/presentation/views/errorPage.dart';
import 'package:flutter_application_1/core/presentation/views/movements/movements.dart';
import 'package:flutter_application_1/core/presentation/views/servicesPay/servicesPay.dart';
import 'package:flutter_application_1/core/presentation/views/transfers/transfers.dart';
import 'package:flutter_application_1/core/presentation/views/wallet/wallet.dart';
import 'package:flutter_application_1/core/presentation/views/withdrawals/withdrawals.dart';
import 'package:flutter_application_1/core/presentation/widgets/CardMovementWidget.dart';
import 'package:flutter_application_1/core/presentation/widgets/buttonOptionWidget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DashboardPage();
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc(LoadDashboardData(dashboardRepository(), LoadMovementsData() as transfersRepository))..add(LoadDashboardDataEvent()),
      child: Scaffold(
        body: BlocListener<DashboardBloc,DashboardState>(
          listener: (context, state) async {
            
          }, child: BlocBuilder<DashboardBloc,DashboardState>(
            builder: (context, state) {
              if(state is DashboardInitial || state is DashboardLoading )
              {
               return BuilDashboard(context, DashboardModel(name: 'cargando...', totalAmount: 0, income: ' cargando...', bills: 'cargando...', movements: []));
              }
              if(state is DashboardLoaded)
              {
                 return BuilDashboard(context, state.model);
              }
              else{
                return ErrorPage();
              }
            },
          ),
        ),
      ),
    );
  }
}



Widget BuilDashboard(BuildContext context, DashboardModel model)
{
   return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Color.fromRGBO(124, 77, 246, 1.000),
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Column(
                    children: [
                      Text(
                        'Hola, ' + model.name,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 24),
                      Column(
                        children: [
                          Text(
                            'Tu dinero',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$${model.totalAmount}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonOption(
                          icon: Icons.credit_card,
                          label: 'Tarjetas',
                          onPressed: () {
                            // Acción para el retiro sin tarjeta
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Wallet()));
                          },
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .01),
                        ButtonOption(
                          icon: Icons.compare_arrows,
                          label: 'Transferencias',
                          onPressed: () {
                            // Acción para los movimientos
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Transfers()));
                          },
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .01),
                        ButtonOption(
                          icon: Icons.attach_money,
                          label: 'Retiros',
                          onPressed: () {
                            // Acción para los movimientos
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Withdrawals()));
                          },
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .00),
                        ButtonOption(
                          icon: Icons.account_balance_wallet_outlined,
                          label: 'Servicios',
                          onPressed: () {
                            // Acción para el pago de servicios
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ServicePay()));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(15), // Bordes redondeados
                      border: Border.all(color: Colors.grey),
                      // Borde con color gris
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mi día a día',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Ingresos',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '\$${model.income}',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Gastos',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '\$${model.bills}',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Text(
                        "Movimientos",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          // Aquí puedes agregar los estilos que desees
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Maneja la pulsación en la Row
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Movements()));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(15), // Bordes redondeados
                          border: Border.all(color: Colors.grey),
                          // Borde con color gris
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: model.movements.map((movement) {
                            return Column(
                              children: [
                                CardMovementWidget(
                                  title1: movement.name,
                                  title2:
                                      '\$${movement.amount.toStringAsFixed(2)}',
                                  subtitle1: movement.date,
                                  subtitle2: movement.paymentType,
                                ),
                                SizedBox(height: 8),
                              ],
                            );
                          }).toList(),
                        )),
                  ),
                ),
              ],
            ),
          );
}




