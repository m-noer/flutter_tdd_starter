import 'package:flutter/material.dart';
import 'package:flutter_tdd_starter/features/auth/presentation/pages/onboarding_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/helpers.dart';

void main() {
  widgetSetup();

  group('OnBoardingPage', () {
    testWidgets('onboarding page ...', (tester) async {
      await tester.pumpApp(const OnBoardingPage());

      expect(find.byType(OnBoardingPage), findsOneWidget);

      final skipButton = find.byKey(const Key('onBoardSkip'));

      await tester.tap(skipButton);
      await tester.pump();
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expectSync(find.byType(OnBoardingPage), findsOneWidget);
      expect(find.byType(OnBoardingPage), findsOneWidget);
    });
  });
}
