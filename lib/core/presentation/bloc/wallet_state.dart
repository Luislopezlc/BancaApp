import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/domain/models/walletModel.dart';

class WalletState extends Equatable {
  final String name;
  final String creditCardNumber;
  final String dueDate;
  final String cVV;
  final bool isValid;
  final String imagenUrl;

  const WalletState({
    this.name = '',
    this.creditCardNumber = '',
    this.dueDate = '',
    this.cVV = '',
    this.imagenUrl = '',
    this.isValid = false,
  });

  factory WalletState.fromModel(WalletModel model) {
    return WalletState(
      name: model.name,
      creditCardNumber: model.creditCardNumber,
      dueDate: model.dueDate,
      cVV: model.cVV,
      imagenUrl : model.imagenUrl,
      isValid: true,
    );
  }

  WalletState copyWith({
    String? name,
    String? creditCardNumber,
    String? dueDate,
    String? cVV,
    bool? isValid,
    String? imagenUrl,
  }) {
    return WalletState(
      name: name ?? this.name,
      creditCardNumber: creditCardNumber ?? this.creditCardNumber,
      dueDate: dueDate ?? this.dueDate,
      cVV: cVV ?? this.cVV,
      imagenUrl: imagenUrl ?? this.imagenUrl,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [
        name,
        creditCardNumber,
        dueDate,
        cVV,
        imagenUrl,
        isValid,
      ];
}
