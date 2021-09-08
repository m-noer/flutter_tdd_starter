import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
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
      maxWidth: 400,
      icon: const Icon(
        IconlyLight.dangerCircle,
        color: Colors.white,
      ),
    );
  }

  static void snackbarSuccess(String title, String message) {
    Get.snackbar<void>(
      title,
      message,
      colorText: Colors.white,
      backgroundColor: Colors.green,
      margin: const EdgeInsets.all(10),
      maxWidth: 400,
      icon: const Icon(
        IconlyLight.tickSquare,
        color: Colors.white,
      ),
    );
  }
}
