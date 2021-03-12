import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stockwise_mobile/ui/commons/app_message_dialog.dart';

class DialogUtils {
  static Future<void> showMessageDialog({
    @required AppMessageDialogType type,
    @required String messageText,
  }) async {
    await Get.dialog(
      AppMessageDialog(type: type, messageText: messageText),
    );
  }
}
