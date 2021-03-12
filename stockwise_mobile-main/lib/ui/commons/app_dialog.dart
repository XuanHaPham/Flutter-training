import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:stockwise_mobile/ui/commons/app_button.dart';

class _AppDialogUIInfo {
  final double horizontalInsetPadding;

  const _AppDialogUIInfo({
    @required this.horizontalInsetPadding,
  });
}

const _uiInfo = const _AppDialogUIInfo(
  horizontalInsetPadding: 10,
);

class AppDialog extends StatefulWidget {
  /// Default value is `primaryColor`
  final Color headerColor;
  final String titleText;
  final Widget body;
  final List<AppDialogAction> actions;

  AppDialog({
    Key key,
    this.headerColor,
    this.titleText,
    @required this.body,
    this.actions,
  }) : super(key: key);

  @override
  _AppDialogState createState() => _AppDialogState();
}

class _AppDialogState extends State<AppDialog> {
  void _closeDialog() {
    Get.back();
  }

  Widget _buildTitle() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: _uiInfo.horizontalInsetPadding,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: widget.headerColor ?? Theme.of(context).primaryColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.titleText ?? '',
              style: TextStyle(
                color: Colors.white, // TODO theme
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              _closeDialog();
            },
            child: Icon(
              Ionicons.md_close_circle,
              color: Colors.white, // TODO theme
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: _uiInfo.horizontalInsetPadding,
      ),
      child: widget.body,
    );
  }

  Widget _buildActionButtonsGroup() {
    List<AppDialogAction> actions = widget.actions;
    if (actions == null || actions.length <= 0) {
      return SizedBox();
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: _uiInfo.horizontalInsetPadding,
        vertical: 15,
      ),
      child: Row(
        children: [
          ..._buildActionButtons(actions),
        ],
      ),
    );
  }

  List<Widget> _buildActionButtons(List<AppDialogAction> actions) {
    List<Widget> outputList = [];
    for (int i = 0; i < actions.length; i++) {
      AppDialogAction action = actions[i];

      // Action Button
      outputList.add(
        Expanded(
          child: AppButton(
            onPressed: action.onPressed,
            child: Text(
              action.text ?? '',
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            btnColor: action.btnColor,
            textColor: action.txtColor,
          ),
        ),
      );

      // Gap between buttons
      if (i != actions.length - 1) {
        outputList.add(
          SizedBox(width: 10),
        );
      }
    }

    return outputList;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTitle(),
              _buildContent(),
              _buildActionButtonsGroup(),
            ],
          ),
        ),
      ),
    );
  }
}

class AppDialogAction {
  final String text;
  final Color btnColor;
  final Color txtColor;
  final Function onPressed;

  const AppDialogAction({
    @required this.text,
    @required this.onPressed,
    this.btnColor,
    this.txtColor,
  });
}
