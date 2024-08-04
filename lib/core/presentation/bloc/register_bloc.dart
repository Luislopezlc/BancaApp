import 'package:flutter_application_1/core/domain/usecases/load_register_data.dart';
import 'package:flutter_application_1/core/presentation/bloc/register_event.dart';
import 'package:flutter_application_1/core/presentation/bloc/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final LoadRegisterData loadRegisterData;
  var logger = Logger();

  RegisterBloc(this.loadRegisterData) : super(RegisterInitial()) {
   
    on<RegisterSubmitted>((event, emit) async {

      emit(RegisterLoading());

      String mensaje = '';
      try {
      var response =  await loadRegisterData(event.register);
      if(response.status=='200')
      {
        mensaje = response.data as String; 
        emit(RegisterSuccess(mensaje));

      }else if(response.status=='400' || response.status=='500' )
      {
        mensaje = response.data as String; 
        emit(RegisterError(mensaje));
      }
      } catch (e) {
        emit(const RegisterError('Algo salio mal, intente mas tarde.'));
      }
    });
  
  }

 
}
