import "package:flutter/material.dart";

class CardsDemo extends StatefulWidget {
  @override
    // TODO: implement createState
  _CardsDemo createState() => _CardsDemo();
  }
 






class _CardsDemo extends State<CardsDemo> 
{
  var algo = "";
  void onPressed()
  {
    setState(() {
    this.algo = "JEJE";
      
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(children: [Text('$algo'),
    IconButton(onPressed: onPressed, icon: Icon(Icons.hdr_auto_select))],);
  }

}