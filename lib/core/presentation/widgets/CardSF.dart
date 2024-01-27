import "package:flutter/material.dart";

class CardsDemo extends StatefulWidget {
  @override
    // TODO: implement createState
  _CardsDemo createState() => _CardsDemo();
  }
 






class _CardsDemo extends State<CardsDemo> 
{
  final TextEditingController emailController = TextEditingController();
  var algo = "";
  void onPressed()
  {
    setState(() {
     algo = emailController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(children: [
    TextField(onChanged: (value) 
    {
      algo = value.toString();
    }, controller: emailController ),
    Text('$algo'),
    IconButton(onPressed: onPressed, icon: Icon(Icons.hdr_auto_select))],);
  }

}