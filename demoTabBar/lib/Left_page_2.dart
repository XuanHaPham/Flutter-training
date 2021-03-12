import 'package:demoTabBar/ileft_viewmodel.dart';
import 'package:demoTabBar/left_viewmodel.dart';
import 'package:demoTabBar/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class LeftPage2 extends StatefulWidget {
  LeftPage2({Key key}) : super(key: key);

  @override
  _LeftPage2State createState() => _LeftPage2State();
}

class _LeftPage2State extends State<LeftPage2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
       child: Center(child: Column(
         children: <Widget>[
           Text('left page 2'),
           RaisedButton(onPressed: (){
             Navigator.pushNamed(context,Router.left);
           }
           ),
         ],
       )
      ),
    );
  }
}