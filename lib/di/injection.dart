import 'package:flutter_tdd_starter/core/network/http_client.dart';
import 'package:flutter_tdd_starter/core/packages/shared_prefs.dart';
import 'package:flutter_tdd_starter/core/util/notification.dart';
import 'package:flutter_tdd_starter/env/config.dart';
import 'package:flutter_tdd_starter/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_tdd_starter/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_tdd_starter/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_tdd_starter/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_tdd_starter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// [init]
  ///component primay like [storage] and [environment]
  final config = Config.getInstance();
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
}
