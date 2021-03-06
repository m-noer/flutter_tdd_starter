import 'package:flutter_tdd_starter/core/network/http_client.dart';
import 'package:flutter_tdd_starter/core/utils/services/notification.dart';
import 'package:flutter_tdd_starter/core/utils/services/shared_prefs.dart';
import 'package:flutter_tdd_starter/data/auth/datasources/auth_remote_data_source.dart';
import 'package:flutter_tdd_starter/data/auth/repositories/repository_impl.dart';
import 'package:flutter_tdd_starter/domain/auth/repositories/repository.dart';
import 'package:flutter_tdd_starter/domain/auth/usecases/usecase.dart';
import 'package:flutter_tdd_starter/env/env_config.dart';
import 'package:flutter_tdd_starter/presentation/auth/blocs/auth_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// [init]
  ///component primay like [storage] and [environment]
  final config = EnvConfig.getInstance();
  final prefs = await SharedPrefs.getInstance();

  sl.registerLazySingleton(() => prefs);

  /// [flavor]
  /// implementation flavor with different [environment] both ios and android
  sl.registerLazySingleton(() => config);

  //! Features - Auth
  // Bloc
  sl.registerFactory(() => AuthBloc(sl()));

  // Use cases
  sl.registerLazySingleton(() => LoginUsecase(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(sl()));

  // Network
  sl.registerLazySingleton(() => sl<HttpClient>().dio);
  sl.registerLazySingleton(() => HttpClient(config: sl(), preferences: sl()));

  sl.registerLazySingleton(() => NotificationService());

  //! External
}
