
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/domain/models/listWalletModel.dart';
class ListWalletState extends Equatable{

const ListWalletState();
  @override
  List<Object> get props => []; 
}


class ListWallInitial extends ListWalletState{}
class ListWallLoaded extends ListWalletState{
  final ListWalletModel model;

  const ListWallLoaded(this.model);
  @override
  List<Object> get props => [model]; 
}
class ListWallError extends ListWalletState{
  final String message;
 const ListWallError(this.message);
  @override
  List<Object> get props => [message]; 
}
class ListWallLoading extends ListWalletState{}

