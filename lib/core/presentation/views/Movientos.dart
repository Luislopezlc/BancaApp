import 'package:flutter/material.dart';

void main() {
  runApp(MiApp());
}

class MovimientoTarjeta {
  final String descripcion;
  final double monto;
  final DateTime fecha;

  MovimientoTarjeta({required this.descripcion, required this.monto, required this.fecha});
}

class TarjetaCredito {
  final String numero;
  final String titular;
  final List<MovimientoTarjeta> movimientos;

  TarjetaCredito({required this.numero, required this.titular, required this.movimientos});
}