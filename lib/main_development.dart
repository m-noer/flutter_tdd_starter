// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_tdd_starter/app/app.dart';
import 'package:flutter_tdd_starter/app/app_bloc_observer.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_tdd_starter/di/injection.dart' as di;
import 'package:flutter_tdd_starter/env/flavor.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = AppBlocObserver();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await di.init();

  FlavorSettings.development();

  runZonedGuarded(
    () => runApp(
      DevicePreview(enabled: !kReleaseMode, builder: (context) => const App()),
    ),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
