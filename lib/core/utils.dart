import 'package:flutter/material.dart';
import 'package:get/get.dart';

showGetSnackBar({String? title, message, int? duration, String? position}) {
  return Get.showSnackbar(
    GetSnackBar(
      title: title,
      message: message,
      isDismissible: true,
      snackPosition:
          position == null ? SnackPosition.BOTTOM : SnackPosition.TOP,
      backgroundColor: title!.contains("Error") ? Colors.red : Colors.green,
      duration: Duration(seconds: duration ?? 5),
    ),
  );
}

showCustomDialogBox(
    {BuildContext? context, String? title, message, Function()? onTap}) {
  return showDialog(
    context: context!,
    builder: (context) {
      String contentText = message;
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text(
              title!,
              style: TextStyle(fontSize: 18),
            ),
            content: Text(contentText),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
