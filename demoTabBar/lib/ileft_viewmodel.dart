import 'package:flutter/material.dart';

abstract class ILeftViewmodel extends ChangeNotifier{
  void goPage(int newIndex, );
  int get index;
}