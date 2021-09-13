// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localizations.dart';

// **************************************************************************
// SheetLocalizationGenerator
// **************************************************************************

final localizedLabels = <Locale, AppLocalizationsData>{
  Locale.fromSubtags(languageCode: 'id'): const AppLocalizationsData(
    auth: const AppLocalizationsDataAuth(
      logout: 'Keluar',
      login: 'Masuk',
    ),
  ),
  Locale.fromSubtags(languageCode: 'en'): const AppLocalizationsData(
    auth: const AppLocalizationsDataAuth(
      logout: 'Logout',
      login: 'Login',
    ),
  ),
};

class AppLocalizationsData {
  const AppLocalizationsData({
    required this.auth,
  });

  final AppLocalizationsDataAuth auth;
  factory AppLocalizationsData.fromJson(Map<String, Object?> map) =>
      AppLocalizationsData(
        auth: AppLocalizationsDataAuth.fromJson(
            map['auth']! as Map<String, Object?>),
      );

  AppLocalizationsData copyWith({
    AppLocalizationsDataAuth? auth,
  }) =>
      AppLocalizationsData(
        auth: auth ?? this.auth,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsData && auth == other.auth);
  @override
  int get hashCode => runtimeType.hashCode ^ auth.hashCode;
}

class AppLocalizationsDataAuth {
  const AppLocalizationsDataAuth({
    required this.logout,
    required this.login,
  });

  final String logout;
  final String login;
  factory AppLocalizationsDataAuth.fromJson(Map<String, Object?> map) =>
      AppLocalizationsDataAuth(
        logout: map['logout']! as String,
        login: map['login']! as String,
      );

  AppLocalizationsDataAuth copyWith({
    String? logout,
    String? login,
  }) =>
      AppLocalizationsDataAuth(
        logout: logout ?? this.logout,
        login: login ?? this.login,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsDataAuth &&
          logout == other.logout &&
          login == other.login);
  @override
  int get hashCode => runtimeType.hashCode ^ logout.hashCode ^ login.hashCode;
}
