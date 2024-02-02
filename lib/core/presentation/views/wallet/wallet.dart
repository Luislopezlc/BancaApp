import "package:flutter/material.dart";

class Wallet extends StatefulWidget {
_Wallet createState() => _Wallet();
}

class _Wallet extends State<Wallet> 
{

  @override

  Widget build(BuildContext context) {
     return 
      Container(
          height: 1800,
          width:3000,
          child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(onPressed: () {},
             child: Text("Editar"))
          
          ]),
     );
  }
}