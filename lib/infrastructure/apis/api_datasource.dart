import 'package:apalive/assets/constants/storage_keys.dart';
import 'package:apalive/data/common/error_handle.dart';
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
import 'package:apalive/infrastructure/core/dio_settings.dart';
import 'package:apalive/infrastructure/core/service_locator.dart';
import 'package:apalive/infrastructure/repo/storage_repository.dart';
import 'package:dio/dio.dart';

abstract class ApiDatasource {
  Future<ResponsModel<List<ContentModel>>> contentList();
  Future<ResponsModel<List<GraduateUserModel>>> graduateUser();
  Future<ResponsModel<List<VideoCallsModel>>> videoCalls();
  Future<ResponsModel<List<VideoGalleryModel>>> videoGallery();
  Future<ResponsModel<List<NewsModel>>> news();
  Future<ResponsModel<List<ModeratorUserModel>>> moderatorUser();
  Future<ResponsModel<List<TeacherUserModel>>> teacherUser();
  Future<ResponsModel<List<ForumsModel>>> forums();
  Future<ResponsModel<List<AllUserModel>>> allUser();
  Future<ResponsModel<List<ChatGroupModel>>> chatGroup();
  Future<ResponsModel<List<ChatMessageModel>>> chatMessage(String giud);
}

class ApiDatasourceImpl implements ApiDatasource {
  final dioAuth = serviceLocator<DioSettings>().dioForAuth;
  final dio = serviceLocator<DioSettings>().dio;
  final ErrorHandle _handle = ErrorHandle();

  @override
  Future<ResponsModel<List<ContentModel>>> contentList() {
    return _handle.apiCantrol(
      request:
          () => dio.get(
            'content/list/',
            options: Options(
              headers:
                  StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
                      ? {
                        'Authorization':
                            'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
                      }
                      : {},
            ),
          ),
      body:
          (response) => ResponsModel.fromJson(
            response,
            (p0) =>
                (p0 as List)
                    .map(
                      (e) => ContentModel.fromJson(e as Map<String, dynamic>),
                    )
                    .toList(),
          ),
    );
  }

  @override
  Future<ResponsModel<List<ForumsModel>>> forums() {
    return _handle.apiCantrol(
      request:
          () => dio.get(
            'forums/list/',
            options: Options(
              headers:
                  StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
                      ? {
                        'Authorization':
                            'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
                      }
                      : {},
            ),
          ),
      body:
          (response) => ResponsModel.fromJson(
            response,
            (p0) =>
                (p0 as List)
                    .map((e) => ForumsModel.fromJson(e as Map<String, dynamic>))
                    .toList(),
          ),
    );
  }

  @override
  Future<ResponsModel<List<GraduateUserModel>>> graduateUser() {
    return _handle.apiCantrol(
      request:
          () => dio.get(
            'graduate-user/list/',
            options: Options(
              headers:
                  StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
                      ? {
                        'Authorization':
                            'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
                      }
                      : {},
            ),
          ),
      body:
          (response) => ResponsModel.fromJson(
            response,
            (p0) =>
                (p0 as List)
                    .map(
                      (e) =>
                          GraduateUserModel.fromJson(e as Map<String, dynamic>),
                    )
                    .toList(),
          ),
    );
  }

  @override
  Future<ResponsModel<List<ModeratorUserModel>>> moderatorUser() {
    return _handle.apiCantrol(
      request:
          () => dio.get(
            'moderator-user/list/',
            options: Options(
              headers:
                  StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
                      ? {
                        'Authorization':
                            'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
                      }
                      : {},
            ),
          ),
      body:
          (response) => ResponsModel.fromJson(
            response,
            (p0) =>
                (p0 as List)
                    .map(
                      (e) => ModeratorUserModel.fromJson(
                        e as Map<String, dynamic>,
                      ),
                    )
                    .toList(),
          ),
    );
  }

  @override
  Future<ResponsModel<List<NewsModel>>> news() {
    return _handle.apiCantrol(
      request:
          () => dio.get(
            'news/list/',
            options: Options(
              headers:
                  StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
                      ? {
                        'Authorization':
                            'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
                      }
                      : {},
            ),
          ),
      body:
          (response) => ResponsModel.fromJson(
            response,
            (p0) =>
                (p0 as List)
                    .map((e) => NewsModel.fromJson(e as Map<String, dynamic>))
                    .toList(),
          ),
    );
  }

  @override
  Future<ResponsModel<List<VideoCallsModel>>> videoCalls() {
    return _handle.apiCantrol(
      request:
          () => dio.get(
            'video-calls/list/?p=true&offset=0&limit=10',
            options: Options(
              headers:
                  StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
                      ? {
                        'Authorization':
                            'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
                      }
                      : {},
            ),
          ),
      body:
          (response) => ResponsModel.fromJson(
            response,
            (p0) =>
                (p0 as List)
                    .map(
                      (e) =>
                          VideoCallsModel.fromJson(e as Map<String, dynamic>),
                    )
                    .toList(),
          ),
    );
  }

  @override
  Future<ResponsModel<List<VideoGalleryModel>>> videoGallery() {
    return _handle.apiCantrol(
      request:
          () => dio.get(
            'video-gallery/list/',
            options: Options(
              headers:
                  StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
                      ? {
                        'Authorization':
                            'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
                      }
                      : {},
            ),
          ),
      body:
          (response) => ResponsModel.fromJson(
            response,
            (p0) =>
                (p0 as List)
                    .map(
                      (e) =>
                          VideoGalleryModel.fromJson(e as Map<String, dynamic>),
                    )
                    .toList(),
          ),
    );
  }

  @override
  Future<ResponsModel<List<TeacherUserModel>>> teacherUser() {
    return _handle.apiCantrol(
      request:
          () => dio.get(
            'teacher-user/list/',
            options: Options(
              headers:
                  StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
                      ? {
                        'Authorization':
                            'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
                      }
                      : {},
            ),
          ),
      body:
          (response) => ResponsModel.fromJson(
            response,
            (p0) =>
                (p0 as List)
                    .map(
                      (e) =>
                          TeacherUserModel.fromJson(e as Map<String, dynamic>),
                    )
                    .toList(),
          ),
    );
  }

  @override
  Future<ResponsModel<List<ChatGroupModel>>> chatGroup() {
    return _handle.apiCantrol(
      request:
          () => dio.get(
            'chat-group/list/',
            options: Options(
              headers:
                  StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
                      ? {
                        'Authorization':
                            'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
                      }
                      : {},
            ),
          ),
      body:
          (response) => ResponsModel.fromJson(
            response,
            (p0) =>
                (p0 as List)
                    .map(
                      (e) => ChatGroupModel.fromJson(e as Map<String, dynamic>),
                    )
                    .toList(),
          ),
    );
  }

  @override
  Future<ResponsModel<List<ChatMessageModel>>> chatMessage(String giud) {
    return _handle.apiCantrol(
      request:
          () => dio.get(
            'chat-message/list/?sender_guid=${StorageRepository.getString(StorageKeys.ACCOUNTS)}&recipient_guid=$giud',
            options: Options(
              headers:
                  StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
                      ? {
                        'Authorization':
                            'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
                      }
                      : {},
            ),
          ),
      body:
          (response) => ResponsModel.fromJson(
            response,
            (p0) =>
                (p0 as List)
                    .map(
                      (e) =>
                          ChatMessageModel.fromJson(e as Map<String, dynamic>),
                    )
                    .toList(),
          ),
    );
  }

  @override
  Future<ResponsModel<List<AllUserModel>>> allUser() {
    return _handle.apiCantrol(
      request:
          () => dio.get(
            'base/all-users/?chat_user_guid=${StorageRepository.getString(StorageKeys.ACCOUNTS)}',
            options: Options(
              headers:
                  StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
                      ? {
                        'Authorization':
                            'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
                      }
                      : {},
            ),
          ),
      body:
          (response) => ResponsModel.fromJson(
            response,
            (p0) =>
                (p0 as List)
                    .map(
                      (e) => AllUserModel.fromJson(e as Map<String, dynamic>),
                    )
                    .toList(),
          ),
    );
  }
}
