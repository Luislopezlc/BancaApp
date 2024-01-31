import "package:flutter/material.dart";

class MyTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

     return Row(children: [Text("BancaApp",style: TextStyle(color: Colors.white,fontSize: 22,),),
           SizedBox(width: 100,),Text("Credito",style: TextStyle(color:Colors.white),)],);
  }



}