import 'package:flutter_tdd_starter/features/auth/presentation/pages/dashboard_page.dart';
import 'package:flutter_tdd_starter/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_tdd_starter/features/auth/presentation/pages/onboarding_page.dart';
import 'package:get/route_manager.dart';

class Routes {
  const Routes._();

  static List<GetPage> page = <GetPage>[
    GetPage<void>(
      name: OnBoardingPage.route,
      page: () => const OnBoardingPage(),
    ),
    GetPage<void>(
      name: DashboardPage.route,
      page: () => const DashboardPage(),
    ),
    GetPage<void>(
      name: LoginPage.route,
      page: () => const LoginPage(),
    ),
  ];
}
