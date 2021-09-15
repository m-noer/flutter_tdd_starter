import 'package:flutter_tdd_starter/app/app.dart';
import 'package:flutter_tdd_starter/core/constants/key_constants.dart';
import 'package:flutter_tdd_starter/core/storage/shared_prefs.dart';
import 'package:flutter_tdd_starter/di/injection.dart';
import 'package:flutter_tdd_starter/features/auth/presentation/pages/dashboard_page.dart';
import 'package:flutter_tdd_starter/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_tdd_starter/features/auth/presentation/pages/onboarding_page.dart';
import 'package:flutter_test/flutter_test.dart';
import '../helpers/widget_setup.dart';

void main() {
  widgetSetup();

  group('App', () {
    testWidgets('App initial route to OnBoardingPage', (tester) async {
      await tester.pumpWidget(App());

      expect(find.byType(OnBoardingPage), findsOneWidget);
    });

    testWidgets('App initial route to LoginPage', (tester) async {
      await tester.pumpWidget(App());

      expect(find.byType(LoginPage), findsOneWidget);
    });

    testWidgets('App initial route to DashboardPage', (tester) async {
      final prefs = sl<SharedPrefs>();
      await prefs.putString(KeyConstants.keyAccessToken, 'token');
      await prefs.putBool(KeyConstants.keyOnBoard, true);

      await tester.pumpWidget(App());

      expect(find.byType(DashboardPage), findsOneWidget);
    });
  });
}
