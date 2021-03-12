import 'package:flutter/material.dart';
class Weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "WEATHER PAGE",
          style: TextStyle(fontSize: 25.0),
        ),
        padding: EdgeInsets.all(10.0),
      ),
    );
  }
}