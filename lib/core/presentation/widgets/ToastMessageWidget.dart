import 'package:flutter/material.dart';

class ToastMessageWidget {
  static void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(124, 77, 246, 1.000),
      duration: const Duration(milliseconds: 2000)
      ),
    );
  }
}