import 'package:flutter/material.dart';

class perfil extends StatelessWidget {
  const perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Esta es la vista perfil", style: TextStyle(fontSize: 30),),
      ],
    );
  }
}