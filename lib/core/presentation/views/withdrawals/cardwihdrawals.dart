import 'package:flutter/material.dart';

class Cardwithdrawals extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final double amount;

  Cardwithdrawals({
    required this.onPressed,
    required this.buttonText,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 241, 238, 241),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        padding: EdgeInsets.all(10),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 4, 62, 110),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
