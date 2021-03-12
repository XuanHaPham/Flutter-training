import 'package:flutter/material.dart';

class KeyboardUnfocusWrapper extends StatelessWidget {
  final Widget child;

  const KeyboardUnfocusWrapper({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: this.child,
    );
  }
}
