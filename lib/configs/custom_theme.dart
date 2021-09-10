import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tdd_starter/configs/palette.dart';

class CustomTheme {
  CustomTheme._();

  static const appbarTHeme = AppBarTheme(
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle.light,
  );

  static final inputDecorationTheme = InputDecorationTheme(
    filled: true,
    contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    ),
    alignLabelWithHint: true,
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.red, width: 0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.red, width: 0),
    ),
    hintStyle: const TextStyle(color: Colors.grey),
  );

  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      primary: Palette.primaryColor,
      padding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );

  static final outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      primary: Palette.primaryColor,
      padding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      side: const BorderSide(color: Palette.primaryColor),
    ),
  );

  static final lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    primaryColor: Palette.primaryColor,
    primaryColorDark: Palette.primaryColorDark,
    primaryColorLight: Palette.primaryColorLight,
    secondaryHeaderColor: Palette.secondaryColorDark,
    disabledColor: Colors.grey,
    dividerColor: Palette.dividerColor.withOpacity(0.5),
    backgroundColor: Colors.white,
    hintColor: Colors.grey,
    appBarTheme: appbarTHeme,
    inputDecorationTheme: inputDecorationTheme,
    scaffoldBackgroundColor: CupertinoColors.extraLightBackgroundGray,
    iconTheme: const IconThemeData(
      color: Colors.black54,
    ),
    cardTheme: CardTheme(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.white,
      elevation: 6,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    elevatedButtonTheme: elevatedButtonTheme,
    outlinedButtonTheme: outlinedButtonTheme,
    buttonTheme: const ButtonThemeData(
      buttonColor: Palette.primaryColor,
      disabledColor: Colors.grey,
      splashColor: Colors.white,
      // textTheme: ButtonTextTheme.primary,
    ),
  );

  static final darkTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    primaryColor: Palette.primaryColor,
    primaryColorDark: Palette.primaryColorDark,
    primaryColorLight: Palette.primaryColorLight,
    secondaryHeaderColor: Palette.secondaryColorDark,
    disabledColor: Palette.disabledColor,
    dividerColor: Palette.dividerColor.withOpacity(0.5),
    backgroundColor: Colors.white,
    hintColor: Colors.grey,
    appBarTheme: appbarTHeme.copyWith(
        brightness: Brightness.dark, color: Colors.grey[900]),
    inputDecorationTheme:
        inputDecorationTheme.copyWith(fillColor: Colors.grey[800]),
    scaffoldBackgroundColor: Palette.primaryBackgroundDarkTheme,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    cardTheme: CardTheme(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.grey[850],
      elevation: 6,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    elevatedButtonTheme: elevatedButtonTheme,
    outlinedButtonTheme: outlinedButtonTheme,
    buttonTheme: const ButtonThemeData(
      buttonColor: Palette.primaryColor,
      disabledColor: Colors.grey,
      splashColor: Colors.white,
      // textTheme: ButtonTextTheme.primary,
    ),
  );
}
