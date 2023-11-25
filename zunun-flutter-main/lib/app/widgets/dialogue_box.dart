import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zunun/utils/theme/text_style.dart';

class DialogUtil {
  static void showCupertinoDialog({
    required String title,
    required String message,
    required VoidCallback onPositiveBtnPressed,
    required VoidCallback onNegativeBtnPressed,
  }) {
    Get.dialog(
      CupertinoAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            onPressed: onNegativeBtnPressed,
            child: const Text('Cancel'),
          ),
          CupertinoDialogAction(
            onPressed: onPositiveBtnPressed,
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  static void showMaterialDialog({
    required String title,
    required String message,
    required VoidCallback onPositiveBtnPressed,
    VoidCallback? onNegativeBtnPressed,
  }) {
    Get.dialog(
      AlertDialog(
        title: Text(title, style: TextStyles.titleStyle),
        content: Text(
          message,
        ),
        actions: [
          onNegativeBtnPressed != null
              ? TextButton(
                  onPressed: onNegativeBtnPressed,
                  child: const Text('Cancel'),
                )
              : Container(),
          TextButton(
            onPressed: onPositiveBtnPressed,
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
