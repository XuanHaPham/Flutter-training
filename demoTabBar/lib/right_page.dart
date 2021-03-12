import 'package:demoTabBar/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RightPage extends StatefulWidget {
  RightPage({Key key}) : super(key: key);

  @override
  _RightPageState createState() => _RightPageState();
}

class _RightPageState extends State<RightPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
       child: Center(child: Column(
         children: <Widget>[
           Text('right page'),
           RaisedButton(onPressed: (){
             Navigator.pushNamed(context, Router.left);
           }
           ),
         ],
       )
      ),
    );
  }
}