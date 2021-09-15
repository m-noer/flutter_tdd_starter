import 'package:flutter_tdd_starter/app/app.dart';
import 'package:flutter_tdd_starter/core/constants/key_constants.dart';
import 'package:flutter_tdd_starter/core/storage/shared_prefs.dart';
import 'package:flutter_tdd_starter/di/injection.dart';
import 'package:flutter_tdd_starter/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  setUp(() async {
    await init();
  });

  group('App', () {
    testWidgets('render Dashboard', (tester) async {
      final prefs = sl<SharedPrefs>();
      await prefs.putBool(KeyConstants.keyOnBoard, true);
      // await prefs.putString(KeyConstants.keyAccessToken, 'token');

      await tester.pumpWidget(App());
      expect(find.byType(LoginPage), findsOneWidget);
    });
  });
}
