import 'package:flutter_application_1/core/domain/usecases/load_register_data.dart';
import 'package:flutter_application_1/core/presentation/bloc/register_event.dart';
import 'package:flutter_application_1/core/presentation/bloc/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final LoadRegisterData loadRegisterData;

  RegisterBloc(this.loadRegisterData) : super(const RegisterState()) {
    on<LoadRegisterDataEvent>((event, emit) async {
      final registerData = await loadRegisterData();
      emit(RegisterState.fromModel(registerData));
    });

    on<NameChanged>((event, emit) {
      emit(state.copyWith(name: event.name, isValid: _validateRegister()));
    });
    on<LastnameChanged>((event, emit) {
      emit(state.copyWith(lastname: event.lastname, isValid: _validateRegister()));
    });
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email, isValid: _validateRegister()));
    });
    on<RfcChanged>((event, emit) {
      emit(state.copyWith(rfc: event.rfc, isValid: _validateRegister()));
    });
    on<PhoneChanged>((event, emit) {
      emit(state.copyWith(phone: event.phone, isValid: _validateRegister()));
    });
    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password, isValid: _validateRegister()));
    });
    on<IdBankChanged>((event, emit) {
      emit(state.copyWith(idBank: event.idBank, isValid: _validateRegister()));
    });
    on<RegisterSubmitted>((event, emit) {
      if (state.isValid) {
        // Handle register submission logic
      }
    });
  }

  bool _validateRegister() {
    return state.name.isNotEmpty &&
        state.lastname.isNotEmpty &&
        state.email.isNotEmpty &&
        state.rfc.isNotEmpty &&
        state.phone.isNotEmpty &&
        state.password.isNotEmpty &&
        state.idBank != 0;
  }
}
