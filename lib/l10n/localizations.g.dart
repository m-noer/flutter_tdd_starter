// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localizations.dart';

// **************************************************************************
// SheetLocalizationGenerator
// **************************************************************************

final localizedLabels = <Locale, AppLocalizationsData>{
  Locale.fromSubtags(languageCode: 'id'): const AppLocalizationsData(
    state: const AppLocalizationsDataState(
      loading: 'Proses',
      success: 'Sukses',
      failure: 'Gagal',
    ),
    form: const AppLocalizationsDataForm(
      password: 'Password',
      username: 'Username',
      required: const AppLocalizationsDataFormRequired(
        password: 'Tolong masukkan password',
        username: 'Tolong masukkan username',
      ),
    ),
    auth: const AppLocalizationsDataAuth(
      logout: 'Keluar',
      login: 'Masuk',
    ),
  ),
  Locale.fromSubtags(languageCode: 'en'): const AppLocalizationsData(
    state: const AppLocalizationsDataState(
      loading: 'Loading',
      success: 'Success',
      failure: 'Failure',
    ),
    form: const AppLocalizationsDataForm(
      password: 'Password',
      username: 'Username',
      required: const AppLocalizationsDataFormRequired(
        password: 'Please enter a password',
        username: 'Please enter the username',
      ),
    ),
    auth: const AppLocalizationsDataAuth(
      logout: 'Logout',
      login: 'Login',
    ),
  ),
};

class AppLocalizationsData {
  const AppLocalizationsData({
    required this.state,
    required this.form,
    required this.auth,
  });

  final AppLocalizationsDataState state;
  final AppLocalizationsDataForm form;
  final AppLocalizationsDataAuth auth;
  factory AppLocalizationsData.fromJson(Map<String, Object?> map) =>
      AppLocalizationsData(
        state: AppLocalizationsDataState.fromJson(
            map['state']! as Map<String, Object?>),
        form: AppLocalizationsDataForm.fromJson(
            map['form']! as Map<String, Object?>),
        auth: AppLocalizationsDataAuth.fromJson(
            map['auth']! as Map<String, Object?>),
      );

  AppLocalizationsData copyWith({
    AppLocalizationsDataState? state,
    AppLocalizationsDataForm? form,
    AppLocalizationsDataAuth? auth,
  }) =>
      AppLocalizationsData(
        state: state ?? this.state,
        form: form ?? this.form,
        auth: auth ?? this.auth,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsData &&
          state == other.state &&
          form == other.form &&
          auth == other.auth);
  @override
  int get hashCode =>
      runtimeType.hashCode ^ state.hashCode ^ form.hashCode ^ auth.hashCode;
}

class AppLocalizationsDataState {
  const AppLocalizationsDataState({
    required this.loading,
    required this.success,
    required this.failure,
  });

  final String loading;
  final String success;
  final String failure;
  factory AppLocalizationsDataState.fromJson(Map<String, Object?> map) =>
      AppLocalizationsDataState(
        loading: map['loading']! as String,
        success: map['success']! as String,
        failure: map['failure']! as String,
      );

  AppLocalizationsDataState copyWith({
    String? loading,
    String? success,
    String? failure,
  }) =>
      AppLocalizationsDataState(
        loading: loading ?? this.loading,
        success: success ?? this.success,
        failure: failure ?? this.failure,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsDataState &&
          loading == other.loading &&
          success == other.success &&
          failure == other.failure);
  @override
  int get hashCode =>
      runtimeType.hashCode ^
      loading.hashCode ^
      success.hashCode ^
      failure.hashCode;
}

class AppLocalizationsDataForm {
  const AppLocalizationsDataForm({
    required this.password,
    required this.username,
    required this.required,
  });

  final String password;
  final String username;
  final AppLocalizationsDataFormRequired required;
  factory AppLocalizationsDataForm.fromJson(Map<String, Object?> map) =>
      AppLocalizationsDataForm(
        password: map['password']! as String,
        username: map['username']! as String,
        required: AppLocalizationsDataFormRequired.fromJson(
            map['required']! as Map<String, Object?>),
      );

  AppLocalizationsDataForm copyWith({
    String? password,
    String? username,
    AppLocalizationsDataFormRequired? required,
  }) =>
      AppLocalizationsDataForm(
        password: password ?? this.password,
        username: username ?? this.username,
        required: required ?? this.required,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsDataForm &&
          password == other.password &&
          username == other.username &&
          required == other.required);
  @override
  int get hashCode =>
      runtimeType.hashCode ^
      password.hashCode ^
      username.hashCode ^
      required.hashCode;
}

class AppLocalizationsDataFormRequired {
  const AppLocalizationsDataFormRequired({
    required this.password,
    required this.username,
  });

  final String password;
  final String username;
  factory AppLocalizationsDataFormRequired.fromJson(Map<String, Object?> map) =>
      AppLocalizationsDataFormRequired(
        password: map['password']! as String,
        username: map['username']! as String,
      );

  AppLocalizationsDataFormRequired copyWith({
    String? password,
    String? username,
  }) =>
      AppLocalizationsDataFormRequired(
        password: password ?? this.password,
        username: username ?? this.username,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppLocalizationsDataFormRequired &&
          password == other.password &&
          username == other.username);
  @override
  int get hashCode =>
      runtimeType.hashCode ^ password.hashCode ^ username.hashCode;
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
