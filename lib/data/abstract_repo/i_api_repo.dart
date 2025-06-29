import 'package:apalive/data/models/all_user_model.dart';
import 'package:apalive/data/models/chat_group_model.dart';
import 'package:apalive/data/models/chat_message_model.dart';
import 'package:apalive/data/models/common/respons_model.dart';
import 'package:apalive/data/models/content_model.dart';
import 'package:apalive/data/models/forum/forums_model.dart';
import 'package:apalive/data/models/graduate_user_model.dart';
import 'package:apalive/data/models/moderator_user_model.dart';
import 'package:apalive/data/models/news_model.dart';
import 'package:apalive/data/models/teacher_user_model.dart';
import 'package:apalive/data/models/video_calls_model.dart';
import 'package:apalive/data/models/video_gallery_model.dart';
import 'package:apalive/infrastructure/core/exceptions/failures.dart';
import 'package:apalive/utils/either.dart';

abstract class IApiRepo {
  Future<Either<Failure, ResponsModel<List<ContentModel>>>> contentList();
  Future<Either<Failure, ResponsModel<List<GraduateUserModel>>>> graduateUser();
  Future<Either<Failure, ResponsModel<List<VideoCallsModel>>>> videoCalls();
  Future<Either<Failure, ResponsModel<List<VideoGalleryModel>>>> videoGallery();
  Future<Either<Failure, ResponsModel<List<NewsModel>>>> news();
  Future<Either<Failure, ResponsModel<List<ModeratorUserModel>>>>
  moderatorUser();
  Future<Either<Failure, ResponsModel<List<TeacherUserModel>>>> teacherUser();
  Future<Either<Failure, ResponsModel<List<ForumsModel>>>> forums();
  Future<Either<Failure, ResponsModel<List<ChatGroupModel>>>> chatGroup();
  Future<Either<Failure, ResponsModel<List<AllUserModel>>>> chatUsers();
  Future<Either<Failure, ResponsModel<List<ChatMessageModel>>>> chatMessage(
    String giud,
  );
}
