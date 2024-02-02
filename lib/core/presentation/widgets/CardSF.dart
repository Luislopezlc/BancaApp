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
    return Row(crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
          ),
        ),
      ],
    
    );
  }

}