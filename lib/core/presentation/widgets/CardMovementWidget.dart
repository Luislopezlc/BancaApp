import 'package:flutter/material.dart';

class CardMovementWidget extends StatefulWidget {
  final String title1;
  final String title2;
  final String subtitle1;
  final String subtitle2;

  const CardMovementWidget({
    required this.title1,
    required this.title2,
    required this.subtitle1,
    required this.subtitle2,
  });

  @override
  _CardMovementWidgetState createState() => _CardMovementWidgetState();
}

class _CardMovementWidgetState extends State<CardMovementWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title1,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                widget.title2,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.subtitle1,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black54,
                ),
              ),
              Text(
                widget.subtitle2,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black54,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
