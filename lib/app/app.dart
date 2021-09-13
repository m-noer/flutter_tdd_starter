import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_tdd_starter/configs/custom_theme.dart';
import 'package:flutter_tdd_starter/core/storage/shared_prefs.dart';
import 'package:flutter_tdd_starter/di/injection.dart';
import 'package:flutter_tdd_starter/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_tdd_starter/features/auth/presentation/pages/onboarding_page.dart';
import 'package:flutter_tdd_starter/l10n/localizations.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final prefs = sl<SharedPrefs>();

  final ValueNotifier<bool> onBoard = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();
    if (prefs.isKeyExists('onBoard')) {
      onBoard.value = prefs.getBool('onBoard')!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: localizedLabels.keys.first,
      builder: DevicePreview.appBuilder,
      supportedLocales: localizedLabels.keys.toList(),
      home: ValueListenableBuilder(
        valueListenable: onBoard,
        builder: (context, _, __) {
          if (onBoard.value) {
            return const LoginPage();
          } else {
            return const OnBoardingPage();
          }
        },
      ),
    );
  }
}
