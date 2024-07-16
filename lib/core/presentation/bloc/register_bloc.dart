import 'package:flutter_application_1/core/domain/usecases/load_register_data.dart';
import 'package:flutter_application_1/core/presentation/bloc/register_event.dart';
import 'package:flutter_application_1/core/presentation/bloc/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final LoadRegisterData loadRegisterData;

  RegisterBloc(this.loadRegisterData) : super(RegisterInitial()) {
   
    on<RegisterSubmitted>((event, emit) async {
      emit(RegisterLoading());
      try {
        await loadRegisterData(event.register);
        emit(RegisterSuccess());
      } catch (e) {
        emit(RegisterError('Failed to submit Register'));
      }
    });
  
  }

 
}
