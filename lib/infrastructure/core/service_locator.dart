import 'package:apalive/app/auth/auth_bloc.dart';
import 'package:apalive/app/bloc/app_bloc.dart';
import 'package:apalive/infrastructure/apis/api_datasource.dart';
import 'package:apalive/infrastructure/apis/auth_datasource.dart';
import 'package:apalive/infrastructure/core/dio_settings.dart';
import 'package:apalive/infrastructure/repo/api_repo.dart';
import 'package:apalive/infrastructure/repo/auth_repo.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.I;

void setupLocator() {
  serviceLocator
    ..registerLazySingleton(DioSettings.new)
    ..registerLazySingleton(
      () => AuthRepo(dataSourcheImpl: AuthDataSourcheImpl()),
    )
    ..registerLazySingleton(() => ApiRepo(dataSourcheImpl: ApiDatasourceImpl()))
    ..registerSingleton(AuthBloc(serviceLocator<AuthRepo>()))
    ..registerSingleton(AppBloc(serviceLocator<ApiRepo>()));
}

Future resetLocator() async {
  await serviceLocator.reset();
  setupLocator();
}
