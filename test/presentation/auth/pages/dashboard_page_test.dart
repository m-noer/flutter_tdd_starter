import 'package:flutter_tdd_starter/presentation/auth/pages/dashboard_page.dart';
import 'package:flutter_tdd_starter/presentation/core/widgets/empty.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/pump_app.dart';
import '../../../helpers/widget_setup.dart';

Future<void> main() async {
  widgetSetup();

  group('DashboardPage', () {
    testWidgets('render Dashboard', (tester) async {
      await tester.pumpApp(const DashboardPage());
      expect(find.byType(Empty), findsOneWidget);
    });
  });
}
