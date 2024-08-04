import 'package:flutter_application_1/core/domain/models/profileModel.dart';
import 'package:flutter_application_1/core/domain/usecases/load_profile_data.dart';
import 'package:flutter_application_1/core/presentation/bloc/profile_event.dart';
import 'package:flutter_application_1/core/presentation/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final LoadProfileData loadProfileData;

  ProfileBloc(this.loadProfileData) : super(ProfileInitial()) {
    on<LoadProfileDataEvent>((event, emit) async {
      ProfileModel model = ProfileModel(
          name: 'cargando...',
          lastname: 'cargando...',
          email: 'cargango...',
          number: 'cargando...',
          rfc: 'cargando...');
      emit(ProfileLoading(model, ''));

      try {
        var response = await loadProfileData.getUser();
        if (response.status != '200') {
          emit(ProfileError(model, 'Algo salio mal, intente mas tarde.'));
        }

        model = response.data as ProfileModel;
        emit(ProfileLoaded(model, ''));
      } catch (e) {
        emit(ProfileError(model, 'Algo salio mal, intente mas tarde.'));
      }
    });

    on<UpdateUserEvent>((event, emit) async {
      emit(ProfileSending());
      ProfileModel model = ProfileModel(
          name: event.user.name,
          lastname: event.user.lastname,
          email: event.user.email,
          number: event.user.phone,
          rfc: event.user.rfc);
      try {
        var response = await loadProfileData.patchUser(event.user);
        if (response.status != '200') {
          emit(ProfileError(model, response.message));
        }else
        {
          emit(ProfileSuccess(model, response.message));
        }
      } catch (e) {
        emit(ProfileError(model, 'Algo salio mal, intente más tarde'));
      }
      
    });

    //   on<NameChanged>((event, emit) {
    //     emit(state.copyWith(name: event.name, isValid: _validateProfile()));
    //   });
    //   on<EmailChanged>((event, emit) {
    //     emit(state.copyWith(email: event.email, isValid: _validateProfile()));
    //   });
    //   on<NumberChanged>((event, emit) {
    //     emit(state.copyWith(number: event.number, isValid: _validateProfile()));
    //   });
    //   on<AddressChanged>((event, emit) {
    //     emit(state.copyWith(address: event.address, isValid: _validateProfile()));
    //   });
    //   on<ProfileSubmitted>((event, emit) {
    //     if (state.isValid) {
    //       // Handle profile submission logic
    //     }
    //   });
    // }

    // bool _validateProfile() {
    //   return state.name.isNotEmpty &&
    //       state.email.isNotEmpty &&
    //       state.number.isNotEmpty &&
    //       state.address.isNotEmpty;
    // }
  }
}
