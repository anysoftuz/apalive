import 'package:apalive/data/models/auth/user_model.dart';
import 'package:apalive/data/models/common/respons_model.dart';
import 'package:apalive/infrastructure/core/exceptions/failures.dart';
import 'package:apalive/utils/either.dart';

abstract class IAuthRepo {
  Future<Either<Failure, ResponsModel<List<UserModel>>>> getMe();
  Future<Either<Failure, ResponsModel<UserModel>>> login(
    Map<String, dynamic> data,
  );
}
