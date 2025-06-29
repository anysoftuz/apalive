import 'package:apalive/assets/constants/storage_keys.dart';
import 'package:apalive/data/common/error_handle.dart';
import 'package:apalive/data/models/auth/user_model.dart';
import 'package:apalive/data/models/common/respons_model.dart';
import 'package:apalive/infrastructure/core/dio_settings.dart';
import 'package:apalive/infrastructure/core/service_locator.dart';
import 'package:apalive/infrastructure/repo/storage_repository.dart';
import 'package:dio/dio.dart';

abstract class AuthDatasourche {
  Future<ResponsModel<List<UserModel>>> getMe();
  Future<ResponsModel<UserModel>> login(Map<String, dynamic> data);
}

class AuthDataSourcheImpl implements AuthDatasourche {
  final dioAuth = serviceLocator<DioSettings>().dioForAuth;
  final dio = serviceLocator<DioSettings>().dio;
  final ErrorHandle _handle = ErrorHandle();

  @override
  Future<ResponsModel<List<UserModel>>> getMe() {
    return _handle.apiCantrol(
      request: () {
        return dioAuth.get(
          'base/me/',
          options: Options(
            headers:
                StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
                    ? {
                      'Authorization':
                          'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
                    }
                    : {},
          ),
        );
      },
      body:
          (response) => ResponsModel.fromJson(
            response,
            (p0) =>
                (p0 as List)
                    .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
                    .toList(),
          ),
    );
  }

  @override
  Future<ResponsModel<UserModel>> login(Map<String, dynamic> data) {
    return _handle.apiCantrol(
      request: () {
        return dioAuth.post('base/login/', data: data);
      },
      body:
          (response) => ResponsModel.fromJson(
            response,
            (p0) => UserModel.fromJson(p0 as Map<String, dynamic>),
          ),
    );
  }
}
