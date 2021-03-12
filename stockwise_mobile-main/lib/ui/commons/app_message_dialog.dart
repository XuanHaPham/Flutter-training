import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:stockwise_mobile/ui/commons/app_dialog.dart';

enum AppMessageDialogType {
  success,
  error,
  info,
}

class AppMessageDialog extends StatefulWidget {
  final AppMessageDialogType type;
  final String messageText;

  const AppMessageDialog({
    Key key,
    @required this.type,
    @required this.messageText,
  }) : super(key: key);

  @override
  _AppMessageDialogState createState() => _AppMessageDialogState();
}

class _AppMessageDialogState extends State<AppMessageDialog> {
  Color _getColor() {
    switch (widget.type) {
      case AppMessageDialogType.success:
        return Colors.green; // TODO theme
      case AppMessageDialogType.error:
        return Colors.red; // TODO theme
      case AppMessageDialogType.info:
        return Theme.of(context).primaryColor;
      default:
        return Theme.of(context).primaryColor;
    }
  }

  String _getTitle() {
    switch (widget.type) {
      case AppMessageDialogType.success:
        return 'Success';
      case AppMessageDialogType.error:
        return 'Error';
      case AppMessageDialogType.info:
        return 'Info';
      default:
        return 'Unknown';
    }
  }

  IconData _getIconData() {
    switch (widget.type) {
      case AppMessageDialogType.success:
        return Ionicons.md_checkmark_circle;
      case AppMessageDialogType.error:
        return Ionicons.md_close_circle;
      case AppMessageDialogType.info:
        return Ionicons.md_information_circle;
      default:
        return Ionicons.md_information_circle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      // headerColor: _getColor(),
      titleText: _getTitle(),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            Container(
              child: Icon(
                _getIconData(),
                color: _getColor(),
                size: 80,
              ),
            ),
            SizedBox(height: 10),
            Text(
              widget.messageText ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
      actions: [
        AppDialogAction(
          text: 'OK',
          onPressed: () {
            Get.back();
          },
          // btnColor: _getColor(),
        ),
      ],
    );
  }
}
