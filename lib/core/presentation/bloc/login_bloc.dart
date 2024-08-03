import 'package:flutter_application_1/core/domain/usecases/load_login_data.dart';
import 'package:flutter_application_1/core/presentation/bloc/login_event.dart';
import 'package:flutter_application_1/core/presentation/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoadLoginData loadLoginData;

  LoginBloc(this.loadLoginData) : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());
      String mensaje = '';
      try {
        var response = await loadLoginData(event.credentials);

        if (response.status == '200') {
          emit(LoginSuccess());
        } else {
          mensaje = response.data as String;
          emit(LoginError(mensaje));
        }
      } catch (e) {
        emit(LoginError('Algo salio mal, intente mas tarde.'));
      }
    });
  }
}
