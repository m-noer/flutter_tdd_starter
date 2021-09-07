import 'package:flutter_tdd_starter/env/config.dart';

/// * This file is configuration to make separate between environment
/// see details about [flutter flavor]
class FlavorSettings {
  FlavorSettings.development() {
    Config.getInstance(
      flavorName: 'development',
      apiBaseUrl: 'https://api.smartschool.var-x.id/v1',
      apiSentry: '',
    );
  }

  FlavorSettings.staging() {
    Config.getInstance(
      flavorName: 'staging',
      apiBaseUrl: 'https://api.smartschool.var-x.id/v1',
      apiSentry: '',
    );
  }

  FlavorSettings.production() {
    Config.getInstance(
      flavorName: 'production',
      apiBaseUrl: 'https://api.smartschool.var-x.id/v2',
      apiSentry: '',
    );
  }
}
