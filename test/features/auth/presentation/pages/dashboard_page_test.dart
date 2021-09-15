import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_tdd_starter/core/widgets/empty.dart';
import 'package:flutter_tdd_starter/di/injection.dart';
import 'package:flutter_tdd_starter/features/auth/presentation/pages/dashboard_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../helpers/helpers.dart';
import 'firebase.mocks.dart';

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  setupFirebaseMessagingMocks();

  setUp(() async {
    await init();
    await Firebase.initializeApp();
  });

  group('DashboardPage', () {
    testWidgets('render Dashboard', (tester) async {
      await tester.pumpApp(const DashboardPage());
      expect(find.byType(Empty), findsOneWidget);
    });
  });
}
