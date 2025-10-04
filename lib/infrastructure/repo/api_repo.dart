import 'package:apalive/data/abstract_repo/i_api_repo.dart';
import 'package:apalive/data/models/all_user_model.dart';
import 'package:apalive/data/models/books/books_category_model.dart';
import 'package:apalive/data/models/books/books_model.dart';
import 'package:apalive/data/models/chat_group_model.dart';
import 'package:apalive/data/models/chat_message_model.dart';
import 'package:apalive/data/models/common/filter_model.dart';
import 'package:apalive/data/models/common/respons_model.dart';
import 'package:apalive/data/models/content_model.dart';
import 'package:apalive/data/models/forum/forums_model.dart';
import 'package:apalive/data/models/graduate_user_model.dart';
import 'package:apalive/data/models/home/region_statistics_model.dart';
import 'package:apalive/data/models/home/statistics_model.dart';
import 'package:apalive/data/models/moderator_user_model.dart';
import 'package:apalive/data/models/news_model.dart';
import 'package:apalive/data/models/teacher_user_model.dart';
import 'package:apalive/data/models/video_calls_model.dart';
import 'package:apalive/data/models/video_gallery_model.dart';
import 'package:apalive/infrastructure/apis/api_datasource.dart';
import 'package:apalive/infrastructure/core/exceptions/exceptions.dart';
import 'package:apalive/infrastructure/core/exceptions/failures.dart';
import 'package:apalive/utils/either.dart';
import 'package:dio/dio.dart';

class ApiRepo implements IApiRepo {
  final ApiDatasourceImpl dataSourcheImpl;

  ApiRepo({required this.dataSourcheImpl});

  @override
  Future<Either<Failure, ResponsModel<List<ContentModel>>>>
  contentList() async {
    try {
      final result = await dataSourcheImpl.contentList();
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    }
  }

  @override
  Future<Either<Failure, ResponsModel<List<ForumsModel>>>> forums() async {
    try {
      final result = await dataSourcheImpl.forums();
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    }
  }

  @override
  Future<Either<Failure, ResponsModel<List<GraduateUserModel>>>>
  graduateUser() async {
    try {
      final result = await dataSourcheImpl.graduateUser();
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    }
  }

  @override
  Future<Either<Failure, ResponsModel<List<ModeratorUserModel>>>>
  moderatorUser() async {
    try {
      final result = await dataSourcheImpl.moderatorUser();
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    }
  }

  @override
  Future<Either<Failure, ResponsModel<List<NewsModel>>>> news() async {
    try {
      final result = await dataSourcheImpl.news();
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    }
  }

  @override
  Future<Either<Failure, ResponsModel<List<VideoCallsModel>>>>
  videoCalls() async {
    try {
      final result = await dataSourcheImpl.videoCalls();
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    }
  }

  @override
  Future<Either<Failure, ResponsModel<List<VideoGalleryModel>>>>
  videoGallery() async {
    try {
      final result = await dataSourcheImpl.videoGallery();
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    }
  }

  @override
  Future<Either<Failure, ResponsModel<List<TeacherUserModel>>>>
  teacherUser() async {
    try {
      final result = await dataSourcheImpl.teacherUser();
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    }
  }

  @override
  Future<Either<Failure, ResponsModel<List<ChatGroupModel>>>>
  chatGroup() async {
    try {
      final result = await dataSourcheImpl.chatGroup();
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    }
  }

  @override
  Future<Either<Failure, ResponsModel<List<ChatMessageModel>>>> chatMessage(
    String giud,
    bool isGroup,
  ) async {
    try {
      final result = await dataSourcheImpl.chatMessage(giud, isGroup);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    }
  }

  @override
  Future<Either<Failure, ResponsModel<List<AllUserModel>>>> chatUsers() async {
    try {
      final result = await dataSourcheImpl.allUser(true);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    }
  }

  @override
  Future<Either<Failure, ResponsModel<List<AllUserModel>>>> allUsers() async {
    try {
      final result = await dataSourcheImpl.allUser(false);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    }
  }

  @override
  Future<Either<Failure, ResponsModel<ChatGroupModel>>> chatGroupCreate(
    FormData data,
  ) async {
    try {
      final result = await dataSourcheImpl.chatGroupCreate(data);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> chatGroupMemberCreate(
    Map<String, dynamic> data,
  ) async {
    try {
      final result = await dataSourcheImpl.chatGroupMemberCreate(data);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    }
  }

  @override
  Future<Either<Failure, ResponsModel<List<BooksModel>>>> getBooks(
    FilterModel filter,
  ) async {
    try {
      final result = await dataSourcheImpl.getBooks(filter);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    }
  }

  @override
  Future<Either<Failure, ResponsModel<List<BooksCategoryModel>>>>
  getBooksCategory() async {
    try {
      final result = await dataSourcheImpl.getBooksCategory();
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    }
  }

  @override
  Future<Either<Failure, ResponsModel<RegionStatisticsModel>>>
  regionStatistics(String region) async {
    try {
      final result = await dataSourcheImpl.regionStatistics(region);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    }
  }

  @override
  Future<Either<Failure, ResponsModel<StatisticsModel>>> statistics() async {
    try {
      final result = await dataSourcheImpl.statistics();
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    }
  }
}
