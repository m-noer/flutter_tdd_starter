import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_tdd_starter/configs/routes/routes.dart';
import 'package:flutter_tdd_starter/configs/themes/custom_theme.dart';
import 'package:flutter_tdd_starter/constants/key_constants.dart';
import 'package:flutter_tdd_starter/di/injection.dart';
import 'package:flutter_tdd_starter/l10n/localizations.dart';
import 'package:flutter_tdd_starter/presentation/auth/pages/login_page.dart';
import 'package:flutter_tdd_starter/presentation/dashboard/pages/dashboard_page.dart';
import 'package:flutter_tdd_starter/presentation/onboard/pages/onboarding_page.dart';
import 'package:flutter_tdd_starter/utils/services/shared_prefs.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final prefs = sl<SharedPrefs>();

  @override
  Widget build(BuildContext context) {
    final isLogin = prefs.isKeyExists(KeyConstants.keyAccessToken);
    final onBoard = prefs.getBool(KeyConstants.keyOnBoard) ?? false;

    final routeObserver = Get.put<RouteObserver>(RouteObserver<PageRoute>());

    String initialRoute() {
      if (onBoard) {
        if (isLogin) {
          return DashboardPage.route;
        } else {
          return LoginPage.route;
        }
      } else {
        return OnBoardingPage.route;
      }
    }

    return GetMaterialApp(
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: DevicePreview.appBuilder,
      locale:
          kIsWeb ? localizedLabels.keys.first : DevicePreview.locale(context),
      supportedLocales: localizedLabels.keys.toList(),
      navigatorObservers: [routeObserver],
      initialRoute: initialRoute(),
      getPages: Routes.page.map((page) => page).toList(),
    );
  }
}
