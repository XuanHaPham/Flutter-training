import 'package:demoTabBar/ileft_viewmodel.dart';
import 'package:demoTabBar/left_viewmodel.dart';
import 'package:demoTabBar/right_page.dart';
import 'package:demoTabBar/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeftPage extends StatefulWidget {
  LeftPage({Key key}) : super(key: key);

  @override
  _LeftPageState createState() => _LeftPageState();
}

class _LeftPageState extends State<LeftPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green
      ),
       child: Center(child: Column(
         children: <Widget>[
           Text('left page'),
           RaisedButton(onPressed: (){
             Navigator.pushNamed(context,Router.left2);
           }
           ),
         ],
       )
      ),
    );
  }
}