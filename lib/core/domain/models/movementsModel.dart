import 'dart:ffi';

class MovementsModel
{
 String name;
 String Date;
 Double Amount;
 String PaymentType;

  MovementsModel({
    required this.name,
    required this.Date,
    required this.Amount,
    required this.PaymentType,
  });
}