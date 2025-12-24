import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

showSnackBar({
  required String title,
  required String message,
  required ContentType contentType,
}) {
  return SnackBar(
    elevation: 5,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    duration: const Duration(seconds: 2),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
    margin: const EdgeInsets.symmetric(vertical: 10),
    padding: const EdgeInsets.all(20),
    hitTestBehavior: HitTestBehavior.translucent,
    animation: Animation.fromValueListenable(const AlwaysStoppedAnimation(1.0)),
    content: AwesomeSnackbarContent(
      title: title,
      message: message,
      messageTextStyle: TextStyle(fontSize: 14.sp, color: Colors.white),
      contentType: contentType,
    ),
  );
}
