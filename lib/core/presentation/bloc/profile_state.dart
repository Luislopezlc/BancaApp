import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/domain/models/profileModel.dart';

class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];
  const ProfileState();
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {
  final ProfileModel model;
  final String message;
  const ProfileLoading(this.model, this.message);
  @override
  List<Object> get props => [model, message];
}

class ProfileLoaded extends ProfileState {
  final ProfileModel model;
  final String message;
  const ProfileLoaded(this.model, this.message);
  @override
  List<Object> get props => [model, message];
}

class ProfileError extends ProfileState {
  final ProfileModel model;
  final String message;
  const ProfileError(this.model, this.message);
    @override
  List<Object> get props => [model, message];
}

class ProfileSuccess extends ProfileState {
  final ProfileModel model;
  final String message;
  const ProfileSuccess(this.model,this.message);
    @override
  List<Object> get props => [ model,message];
}

class ProfileSending extends ProfileState {}

  // final String name;
  // final String email;
  // final String number;
  // final String address;
  // final bool isValid;

  // const ProfileState({
  //   this.name = '',
  //   this.email = '',
  //   this.number = '',
  //   this.address = '',
  //   this.isValid = false,
  // });

  // factory ProfileState.fromModel(ProfileModel model) {
  //   return ProfileState(
  //     name: model.name,
  //     email: model.email,
  //     number: model.number,
  //     address: model.address,
  //     isValid: true,
  //   );
  // }

  // ProfileState copyWith({
  //   String? name,
  //   String? email,
  //   String? number,
  //   String? address,
  //   bool? isValid,
  // }) {
  //   return ProfileState(
  //     name: name ?? this.name,
  //     email: email ?? this.email,
  //     number: number ?? this.number,
  //     address: address ?? this.address,
  //     isValid: isValid ?? this.isValid,
  //   );
  // }

  // @override
  // List<Object?> get props => [
  //       name,
  //       email,
  //       number,
  //       address,
  //       isValid,
  //     ];

