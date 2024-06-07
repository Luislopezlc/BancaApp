import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/core/domain/models/transfersModel.dart';

class TransferState extends Equatable {
  final String name;
  final String iconText;
  final String creditCardNumber;
  final bool isValid;

  const TransferState({
    this.name = '',
    this.iconText = '',
    this.creditCardNumber = '',
    this.isValid = false,
  });

  factory TransferState.fromModel(TransferModel model) {
    return TransferState(
      name: model.name,
      iconText: model.iconText,
      creditCardNumber: model.creditCardNumber,
      isValid: true,
    );
  }

  TransferState copyWith({
    String? name,
    String? iconText,
    String? creditCardNumber,
    bool? isValid,
  }) {
    return TransferState(
      name: name ?? this.name,
      iconText: iconText ?? this.iconText,
      creditCardNumber: creditCardNumber ?? this.creditCardNumber,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [
        name,
        iconText,
        creditCardNumber,
        isValid,
      ];
}
