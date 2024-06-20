import 'package:flutter_application_1/core/domain/usecases/load_profile_data.dart';
import 'package:flutter_application_1/core/presentation/bloc/profile_event.dart';
import 'package:flutter_application_1/core/presentation/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final LoadProfileData loadProfileData;

  ProfileBloc(this.loadProfileData) : super(const ProfileState()) {
    on<LoadProfileDataEvent>((event, emit) async {
      final profileData = await loadProfileData();
      print(profileData);
      emit(ProfileState.fromModel(profileData));
    });

    on<NameChanged>((event, emit) {
      emit(state.copyWith(name: event.name, isValid: _validateProfile()));
    });
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email, isValid: _validateProfile()));
    });
    on<NumberChanged>((event, emit) {
      emit(state.copyWith(number: event.number, isValid: _validateProfile()));
    });
    on<AddressChanged>((event, emit) {
      emit(state.copyWith(address: event.address, isValid: _validateProfile()));
    });
    on<ProfileSubmitted>((event, emit) {
      if (state.isValid) {
        // Handle profile submission logic
      }
    });
  }

  bool _validateProfile() {
    return state.name.isNotEmpty &&
        state.email.isNotEmpty &&
        state.number.isNotEmpty &&
        state.address.isNotEmpty;
  }
}
