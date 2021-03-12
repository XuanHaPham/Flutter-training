import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:progress_dialog/progress_dialog.dart';

class LoadingDialogUtils {
  static ProgressDialog _progressDialog;

  /// show loading and return the dialog
  static Future<void> showLoading({String message = 'Please wait...'}) async {
    if (_progressDialog == null) {
      _progressDialog = ProgressDialog(
        Get.overlayContext,
        isDismissible: false,
      );
      _progressDialog.style(message: message);
    }
    await _progressDialog.show();
  }

  static Future<void> hideLoading() async {
    try {
      if (_progressDialog?.isShowing() == true) {
        await _progressDialog.hide();
      }
    } catch (e) {
      Logger().e(e);
    }
  }
}
