import 'package:flutter_application_1/core/domain/usecases/load_dashboard_data.dart';
import 'package:flutter_application_1/core/presentation/bloc/dashboard_event.dart';
import 'package:flutter_application_1/core/presentation/bloc/dashboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final LoadDashboardData loadDashboardData;

  DashboardBloc(this.loadDashboardData) : super(const DashboardState()) {
    on<LoadDashboardDataEvent>((event, emit) async {
      final dashboardData = await loadDashboardData();
      emit(DashboardState.fromModel(dashboardData));
    });

    on<NameChanged>((event, emit) {
      emit(state.copyWith(name: event.name, isValid: _validateDashboard()));
    });
    on<TotalAmountChanged>((event, emit) {
      emit(state.copyWith(totalAmount: event.totalAmount, isValid: _validateDashboard()));
    });
    on<IncomeChanged>((event, emit) {
      emit(state.copyWith(income: event.income, isValid: _validateDashboard()));
    });
    on<BillsChanged>((event, emit) {
      emit(state.copyWith(bills: event.bills, isValid: _validateDashboard()));
    });
    on<MovementsChanged>((event, emit) {
      emit(state.copyWith(movements: event.movements, isValid: _validateDashboard()));
    });
    // on<MovementsChanged>((event, emit) { 
    //   emit(state.copyWith(movements: event.movements, isValid: _validateDashboard()));
    // }); // Descomenta esto si MovementsModel está definido y quieres incluirlo
    on<DashboardSubmitted>((event, emit) {
      if (state.isValid) {
        // Handle dashboard submission logic
      }
    });
  }

  bool _validateDashboard() {
    return state.name.isNotEmpty &&
        state.totalAmount > 0 &&
        state.income.isNotEmpty &&
        state.bills.isNotEmpty;
       state.movements.isNotEmpty; // Descomenta esto si MovementsModel está definido y quieres incluirlo
  }
}
