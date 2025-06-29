import 'package:apalive/app/auth/auth_bloc.dart';
import 'package:apalive/infrastructure/core/exceptions/exceptions.dart';
import 'package:apalive/infrastructure/core/exceptions/failures.dart';
import 'package:apalive/infrastructure/core/service_locator.dart';
import 'package:apalive/utils/log_service.dart';
import 'package:dio/dio.dart';

class ErrorHandle {
  Future<R> apiCantrol<T, R>({
    required Future<Response<T>?> Function() request,
    required R Function(T response) body,
  }) async {
    try {
      final response = await request();
      if (response!.statusCode! >= 200 && response.statusCode! < 300) {
        return body(response.data as T);
      }
      if (response.statusCode == 401) {
        serviceLocator<AuthBloc>().add(RefreshToken());
      }
      // final errorResponse = ErrorResponse.fromJson(
      //   response.data as Map<String, dynamic>,
      // );
      throw ServerException(
        statusCode: response.statusCode ?? 0,
        errorMessage: "Error",
      );
    } on ServerException {
      rethrow;
    } on DioException catch (e) {
      if (e.response != null && e.response?.data is Map<String, dynamic>) {
        // Serverdan qaytgan xatolikni ErrorResponse ga parse qilamiz
        // final errorResponse = ErrorResponse.fromJson(e.response!.data);
        throw ServerException(
          statusCode: e.response!.statusCode ?? 0,
          // errorMessage: errorResponse.message,
          errorMessage: "Error",
        );
      }

      throw ServerException(
        statusCode: e.response?.statusCode ?? 0,
        errorMessage: e.message ?? "Unknown Dio error",
      );
    } on Exception catch (e) {
      Log.e(e);
      throw ParsingException(errorMessage: e.toString());
    } catch (e) {
      Log.e(e);
      rethrow;
    }
  }
}
