import "package:flutter/material.dart";
import "package:flutter_application_1/core/data/models/respositories/listMovementsCategoryRepository.dart";
import "package:flutter_application_1/core/domain/usecases/load_list_movements_category_data.dart";
import "package:flutter_application_1/core/presentation/bloc/list_movements_category_bloc.dart";
import "package:flutter_application_1/core/presentation/bloc/list_movements_category_event.dart";
import "package:flutter_application_1/core/presentation/bloc/list_movements_category_state.dart";
import "package:flutter_application_1/core/presentation/widgets/CardMovementWidget.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class MovementsCategories extends StatefulWidget {
  _MovementsCategories createState() => _MovementsCategories();
}

class _MovementsCategories extends State<MovementsCategories> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListMovementsCategoryBloc(
        LoadListMovementsCategoryData(ListMovementsCategoryRepository()),
      )..add(LoadListMovementsCategoryDataEvent()),
      child: Scaffold(
        body:
            BlocBuilder<ListMovementsCategoryBloc, ListMovementsCategoryState>(
                builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Color.fromRGBO(124, 77, 246, 1.000),
                title: const Text(
                  'Categorias',
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
                      borderRadius:
                          BorderRadius.circular(15), // Bordes redondeados
                      border: Border.all(
                          color: Colors.grey), // Borde con color gris
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: state.movements.movements.map((category) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Categoría
                            Text(
                              category.title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 12),
                            // Movimientos
                            ...category.movements.map((movement) {
                              return Column(
                                children: [
                                  CardMovementWidget(
                                    title1: movement.name,
                                    title2: movement.amount.toString(),
                                    subtitle1: movement.date,
                                    subtitle2: movement.paymentType,
                                  ),
                                  SizedBox(height: 8),
                                ],
                              );
                            }).toList(),
                            // Separador entre categorías
                            SizedBox(height: 12),
                            Divider(
                              color: Colors.grey,
                              thickness: 1,
                              height: 20,
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ));
        }),
      ),
    );
  }
}
