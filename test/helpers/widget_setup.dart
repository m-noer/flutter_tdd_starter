import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_tdd_starter/di/injection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'helpers.dart';

void widgetSetup() {
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    setupFirebaseMessagingMocks();
    await init();
    await Firebase.initializeApp();
  });

  tearDown(() async {
    await sl.reset();
  });
}
