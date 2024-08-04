import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/domain/models/apiModels/patchUserDTO.dart';
import 'package:flutter_application_1/core/domain/models/profileModel.dart';

abstract class ProfileEvent extends Equatable {}

class LoadProfileDataEvent extends ProfileEvent {
   @override
  List<Object> get props => [];
}


class UpdateUserEvent extends ProfileEvent 
{
  final PatchUserDTO user;

   UpdateUserEvent(this.user);
   @override
  List<Object>  get props => [user];
}






// class NameChanged extends ProfileEvent {
//   final String name;

//   NameChanged(this.name);
// }

// class EmailChanged extends ProfileEvent {
//   final String email;

//   EmailChanged(this.email);
// }

// class NumberChanged extends ProfileEvent {
//   final String number;

//   NumberChanged(this.number);
// }

// class AddressChanged extends ProfileEvent {
//   final String address;

//   AddressChanged(this.address);
// }

// class ProfileSubmitted extends ProfileEvent {}
