import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jiffy/jiffy.dart';
import 'package:tech_task/_lib.dart';

appPrint(value) {
  if (kDebugMode) {
    log(value.toString());
  }
}

bool hasExpire({required DateTime initalDate, required DateTime expiryDate}) {
  int days = expiryDate.difference(initalDate).inDays;
  return days < 0 ? true : false;
}

String expriedMessage(String itemName, {required DateTime initalDate}) {
  if (Jiffy(initalDate.toString()).isToday) {
    return "$itemName has expired";
  } else {
    return "$itemName would have expired";
  }
}

showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      webPosition: "center",
      timeInSecForIosWeb: 5,
      backgroundColor: AppColors.grey,
      textColor: Colors.black,
      fontSize: 14.0);
}

showErrorToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      webPosition: "center",
      webBgColor: "#e74c3c",
      timeInSecForIosWeb: 5,
      // backgroundColor: AppColors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

Future<void> showOkayDialog(
    {required IconData icon,
    String title = "",
    String buttonMsg = "OK",
    String message = "",
    VoidCallback? onPressed,
    final Color? iconBorderColor,
    BuildContext? cont}) {
  return showAnimatedDialog(
      barrierDismissible: false,
      context: cont ?? context,
      animationType: DialogTransitionType.fadeScale,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 500),
      builder: (context) {
        return OkDialog(
          icon,
          iconBorderColor: iconBorderColor,
          message: message,
          title: title,
          onpressed: onPressed,
          buttonMsg: buttonMsg,
        );
      });
}

slideUpdialogshow(
  Widget widget, {
  BuildContext? con,
}) {
  return showCupertinoModalPopup(
      barrierDismissible: true,
      context: con ?? context,
      builder: (context) => widget);
}

customTimePicker(
    {Function(DateTime?)? onChanged,
    Function(DateTime?)? onConfirmed,
    DateTime? minTime,
    DateTime? maxTime,
    BuildContext? context}) {
  return DatePicker.showDatePicker(context!,
      showTitleActions: true,
      minTime: minTime ?? DateTime.now(),
      maxTime: maxTime,
      onChanged: onChanged,
      onConfirm: onConfirmed,
      currentTime: DateTime.now(),
      theme: DatePickerTheme(
          itemStyle: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: AppColors.white, fontWeight: FontWeight.w600),
          backgroundColor: AppColors.black,
          cancelStyle: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: AppColors.white),
          doneStyle: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: AppColors.white)),
      locale: LocaleType.en);
}
