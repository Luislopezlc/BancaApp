import 'package:flutter_application_1/core/domain/usecases/load_login_data.dart';
import 'package:flutter_application_1/core/presentation/bloc/login_event.dart';
import 'package:flutter_application_1/core/presentation/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoadLoginData loadLoginData;

  LoginBloc(this.loadLoginData) : super(const LoginState()) {
    on<LoadLoginDataEvent>((event, emit) async {
      final loginData = await loadLoginData();
      emit(LoginState.fromModel(loginData));
    });

    on<NameChanged>((event, emit) {
      emit(state.copyWith(name: event.name, isValid: _validateLogin()));
    });
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email, isValid: _validateLogin()));
    });
    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password, isValid: _validateLogin()));
    });
    on<MethodLoginChanged>((event, emit) {
      emit(state.copyWith(methodLogin: event.methodLogin, isValid: _validateLogin()));
    });
    on<LoginSubmitted>((event, emit) {
      if (state.isValid) {
        // Handle login submission logic
      }
    });
  }

  bool _validateLogin() {
    return state.name.isNotEmpty &&
        state.email.isNotEmpty &&
        state.password.isNotEmpty &&
        state.methodLogin.isNotEmpty;
  }
}
