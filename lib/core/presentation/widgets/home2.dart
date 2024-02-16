import 'package:flutter/material.dart';

class home2 extends StatelessWidget {
  const home2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Esta es la vista home", style: TextStyle(fontSize: 30),),
      ],
    );
  }
}