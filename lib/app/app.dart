import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_tdd_starter/configs/custom_theme.dart';
import 'package:flutter_tdd_starter/core/constants/key_constants.dart';
import 'package:flutter_tdd_starter/core/routes/routes.dart';
import 'package:flutter_tdd_starter/core/storage/shared_prefs.dart';
import 'package:flutter_tdd_starter/di/injection.dart';
import 'package:flutter_tdd_starter/features/auth/presentation/pages/dashboard_page.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isLogin = prefs.isKeyExists(KeyConstants.keyAccessToken);
    final onBoard = prefs.isKeyExists(KeyConstants.keyOnBoard);

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
