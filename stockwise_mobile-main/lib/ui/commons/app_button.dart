import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Function onPressed;
  final double height;
  final Color btnColor;
  final Color textColor;
  final Widget child;

  const AppButton({
    Key key,
    @required this.onPressed,
    this.height = 40,
    this.btnColor,
    this.textColor,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: height,
      child: FlatButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: onPressed,
        color: btnColor ?? Theme.of(context).primaryColor,
        textColor: textColor ?? Colors.white, // TODO theme
        disabledColor: Theme.of(context).disabledColor,
        disabledTextColor: Colors.white, // TODO theme
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: child,
      ),
    );
  }
}
