import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/domain/models/profileModel.dart';


class ProfileState extends Equatable {
  final String name;
  final String email;
  final String number;
  final String address;
  final bool isValid;

  const ProfileState({
    this.name = '',
    this.email = '',
    this.number = '',
    this.address = '',
    this.isValid = false,
  });

  factory ProfileState.fromModel(ProfileModel model) {
    return ProfileState(
      name: model.name,
      email: model.email,
      number: model.number,
      address: model.address,
      isValid: true,
    );
  }

  ProfileState copyWith({
    String? name,
    String? email,
    String? number,
    String? address,
    bool? isValid,
  }) {
    return ProfileState(
      name: name ?? this.name,
      email: email ?? this.email,
      number: number ?? this.number,
      address: address ?? this.address,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [
        name,
        email,
        number,
        address,
        isValid,
      ];
}
