import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_tdd_starter/app/app.dart';
import 'package:flutter_tdd_starter/app/app_bloc_observer.dart';
import 'package:flutter_tdd_starter/di/injection.dart' as di;
import 'package:flutter_tdd_starter/env/config.dart';
import 'package:flutter_tdd_starter/env/flavor.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background,
  // such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  log('Handling a background message ${message.messageId}', name: 'FIREBASE');
}

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      Bloc.observer = AppBlocObserver();
      FlutterError.onError = (details) {
        log(details.exceptionAsString(), stackTrace: details.stack);
      };

      FlavorSettings.staging();

      await di.init();
      await Firebase.initializeApp();

      /// Set the background messaging handler early on, as a named
      /// top-level function
      FirebaseMessaging.onBackgroundMessage(
          _firebaseMessagingBackgroundHandler);

      await Sentry.init(
        (options) => options..dsn = Config.getInstance().apiSentry,
        appRunner: () => runApp(App()),
      );

      ///[console] flavor running
      if (!kReleaseMode) {
        final settings = Config.getInstance();
        log('🚀 APP FLAVOR NAME      : ${settings.flavorName}', name: 'ENV');
        log('🚀 APP API_BASE_URL     : ${settings.apiBaseUrl}', name: 'ENV');
        log('🚀 APP API_SENTRY       : ${settings.apiSentry}', name: 'ENV');
      }
    },
    (error, stackTrace) async {
      log(error.toString(), stackTrace: stackTrace);
      await Sentry.captureException(error, stackTrace: stackTrace);
    },
  );
}
