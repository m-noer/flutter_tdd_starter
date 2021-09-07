import 'package:flutter/material.dart';
import 'package:flutter_tdd_starter/configs/palette.dart';
import 'package:get/get.dart';

class AppSnackbar {
  static void snackbarFailure(String title, String message) {
    Get.snackbar<void>(
      title,
      message,
      colorText: Colors.white,
      backgroundColor: Palette.dangerColor,
      margin: const EdgeInsets.all(10),
    );
  }

  static void snackbarSuccess(String title, String message) {
    Get.snackbar<void>(
      title,
      message,
      colorText: Colors.white,
      backgroundColor: Colors.green,
      margin: const EdgeInsets.all(10),
    );
  }
}
