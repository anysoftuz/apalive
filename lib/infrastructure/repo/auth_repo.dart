import 'package:apalive/assets/constants/storage_keys.dart';
import 'package:apalive/data/abstract_repo/i_auth_repo.dart';
import 'package:apalive/data/models/auth/user_model.dart';
import 'package:apalive/data/models/common/respons_model.dart';
import 'package:apalive/infrastructure/apis/auth_datasource.dart';
import 'package:apalive/infrastructure/core/dio_settings.dart';
import 'package:apalive/infrastructure/core/exceptions/exceptions.dart';
import 'package:apalive/infrastructure/core/exceptions/failures.dart';
import 'package:apalive/infrastructure/core/service_locator.dart';
import 'package:apalive/infrastructure/repo/storage_repository.dart';
import 'package:apalive/utils/either.dart';
import 'package:dio/dio.dart';

class AuthRepo implements IAuthRepo {
  final AuthDataSourcheImpl dataSourcheImpl;

  AuthRepo({required this.dataSourcheImpl});

  @override
  Future<Either<Failure, ResponsModel<List<UserModel>>>> getMe() async {
    try {
      final result = await dataSourcheImpl.getMe();
      await StorageRepository.putString(
        StorageKeys.ACCOUNTS,
        result.data.first.guid,
      );
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString(), statusCode: 0));
    }
  }

  @override
  Future<Either<Failure, ResponsModel<UserModel>>> login(
    Map<String, dynamic> data,
  ) async {
    try {
      final result = await dataSourcheImpl.login(data);
      await StorageRepository.putString(StorageKeys.TOKEN, result.data.access);
      await StorageRepository.putString(
        StorageKeys.REFRESH,
        result.data.refresh,
      );
      serviceLocator<DioSettings>().setBaseOptions();
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString(), statusCode: 0));
    }
  }
}
