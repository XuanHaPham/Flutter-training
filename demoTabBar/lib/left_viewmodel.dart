
import 'package:demoTabBar/ileft_viewmodel.dart';
import 'package:demoTabBar/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeftViewmodel  extends ChangeNotifier implements ILeftViewmodel{
  int _index = 0;
  int get index => _index;

  @override
  void goPage(int newIndex){
    _index = newIndex;
    //0 != _index && newIndex == 0 ? Navigator.pushNamed(context,Router.left) :  0 == _index && newIndex == 0 ? Navigator.pushNamed(context,Router.left2)  : Navigator.pushNamed(context,Router.right) ;
    notifyListeners();
  }
}