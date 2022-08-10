import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:terrific_venture_assessment/auth_feature/1-presentation/1.3-logic-component/auth-viewModel.dart';
import 'package:terrific_venture_assessment/auth_feature/2-domain/2.2-use-cases/login-use-case.dart';
import 'package:terrific_venture_assessment/auth_feature/2-domain/2.3-repository/auth-repository.dart';
import 'package:terrific_venture_assessment/auth_feature/3-data/3.1-repository/auth-repository-IMPL.dart';
import 'package:terrific_venture_assessment/core/utils/networking/network_info.dart';

import 'auth_feature/3-data/3.3-data-sources/local-data-source/auth-local-data-source.dart';
import 'auth_feature/3-data/3.3-data-sources/remote-data-source/auth-remote-data-source.dart';

Future<void> init(GetIt sl) async{
  //! Features
  debugPrint('started initializing container');
  sl.registerFactory(() => AuthViewModel(useCase: sl()));
  debugPrint('initialized 1');
  sl.registerLazySingleton(() => LoginUseCase(repository: sl()));
  debugPrint('initialized 2');
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryIMPL(
      localDataSource: sl(),
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  debugPrint('initialized 3');
  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceIMPL(sharedPreferences: sl()));
  debugPrint('initialized 4');
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceIMPL(
      dio: sl(), interceptor: sl(), localDataSource: sl()));
  debugPrint('initialized 5');
  //!! core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: sl()));
  debugPrint('initialized 6');
  //!!! External
  sl.registerLazySingleton(()=>InternetConnectionChecker());
  debugPrint('initialized 7');
  sl.registerLazySingleton(()=>Dio());
  debugPrint('initialized 8');
  sl.registerLazySingleton<Interceptor>(()=>LoginInterceptor(localDataSource: sl()));
  debugPrint('initialized 9');
  var shared= await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => shared);
  debugPrint('initialized container 10 dependencies');
  // WidgetsFlutterBinding.ensureInitialized();
}
