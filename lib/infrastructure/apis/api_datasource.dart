import 'package:apalive/assets/constants/storage_keys.dart';
import 'package:apalive/data/common/error_handle.dart';
import 'package:apalive/data/models/all_user_model.dart';
import 'package:apalive/data/models/books/books_category_model.dart';
import 'package:apalive/data/models/books/books_model.dart';
import 'package:apalive/data/models/chat_group_model.dart';
import 'package:apalive/data/models/chat_message_model.dart';
import 'package:apalive/data/models/common/filter_model.dart';
import 'package:apalive/data/models/common/respons_model.dart';
import 'package:apalive/data/models/content_model.dart';
import 'package:apalive/data/models/employment_model.dart';
import 'package:apalive/data/models/home/region_statistics_model.dart';
import 'package:apalive/data/models/home/statistics_model.dart';
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
  Future<ResponsModel<List<AllUserModel>>> allUser(bool isChat);
  Future<ResponsModel<List<ChatGroupModel>>> chatGroup();
  Future<ResponsModel<List<ChatMessageModel>>> chatMessage(
    String giud,
    bool isGroup,
  );
  Future<ResponsModel<ChatGroupModel>> chatGroupCreate(FormData data);
  Future<bool> chatGroupMemberCreate(Map<String, dynamic> data);
  Future<ResponsModel<List<BooksModel>>> getBooks(FilterModel filter);
  Future<ResponsModel<List<BooksCategoryModel>>> getBooksCategory();
  Future<ResponsModel<StatisticsModel>> statistics();
  Future<ResponsModel<RegionStatisticsModel>> regionStatistics(String region);
  Future<ResponsModel<List<EmploymentModel>>> employment(String pinfl);
}

class ApiDatasourceImpl implements ApiDatasource {
  final dioAuth = serviceLocator<DioSettings>().dioForAuth;
  final dio = serviceLocator<DioSettings>().dio;
  final ErrorHandle _handle = ErrorHandle();

  @override
  Future<ResponsModel<List<ContentModel>>> contentList() {
    return _handle.apiCantrol(
      request: () => dio.get(
        'content/list/',
        options: Options(
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
                }
              : {},
        ),
      ),
      body: (response) => ResponsModel.fromJson(
        response,
        (p0) => (p0 as List)
            .map((e) => ContentModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  @override
  Future<ResponsModel<List<ForumsModel>>> forums() {
    return _handle.apiCantrol(
      request: () => dio.get(
        'forums/list/',
        options: Options(
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
                }
              : {},
        ),
      ),
      body: (response) => ResponsModel.fromJson(
        response,
        (p0) => (p0 as List)
            .map((e) => ForumsModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  @override
  Future<ResponsModel<List<GraduateUserModel>>> graduateUser() {
    return _handle.apiCantrol(
      request: () => dio.get(
        'graduate-user/list/',
        options: Options(
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
                }
              : {},
        ),
      ),
      body: (response) => ResponsModel.fromJson(
        response,
        (p0) => (p0 as List)
            .map((e) => GraduateUserModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  @override
  Future<ResponsModel<List<ModeratorUserModel>>> moderatorUser() {
    return _handle.apiCantrol(
      request: () => dio.get(
        'moderator-user/list/',
        options: Options(
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
                }
              : {},
        ),
      ),
      body: (response) => ResponsModel.fromJson(
        response,
        (p0) => (p0 as List)
            .map((e) => ModeratorUserModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  @override
  Future<ResponsModel<List<NewsModel>>> news() {
    return _handle.apiCantrol(
      request: () => dio.get(
        'news/list/',
        options: Options(
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
                }
              : {},
        ),
      ),
      body: (response) => ResponsModel.fromJson(
        response,
        (p0) => (p0 as List)
            .map((e) => NewsModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  @override
  Future<ResponsModel<List<VideoCallsModel>>> videoCalls() {
    return _handle.apiCantrol(
      request: () => dio.get(
        'video-calls/list/?p=true&offset=0&limit=10',
        options: Options(
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
                }
              : {},
        ),
      ),
      body: (response) => ResponsModel.fromJson(
        response,
        (p0) => (p0 as List)
            .map((e) => VideoCallsModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  @override
  Future<ResponsModel<List<VideoGalleryModel>>> videoGallery() {
    return _handle.apiCantrol(
      request: () => dio.get(
        'video-gallery/list/',
        options: Options(
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
                }
              : {},
        ),
      ),
      body: (response) => ResponsModel.fromJson(
        response,
        (p0) => (p0 as List)
            .map((e) => VideoGalleryModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  @override
  Future<ResponsModel<List<TeacherUserModel>>> teacherUser() {
    return _handle.apiCantrol(
      request: () => dio.get(
        'teacher-user/list/',
        options: Options(
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
                }
              : {},
        ),
      ),
      body: (response) => ResponsModel.fromJson(
        response,
        (p0) => (p0 as List)
            .map((e) => TeacherUserModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  @override
  Future<ResponsModel<List<ChatGroupModel>>> chatGroup() {
    return _handle.apiCantrol(
      request: () => dio.get(
        'chat-group/list/',
        options: Options(
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
                }
              : {},
        ),
      ),
      body: (response) => ResponsModel.fromJson(
        response,
        (p0) => (p0 as List)
            .map((e) => ChatGroupModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  @override
  Future<ResponsModel<List<ChatMessageModel>>> chatMessage(
    String giud,
    bool isGroup,
  ) {
    final text = isGroup
        ? "?group_guid=$giud"
        : "?sender_guid=${StorageRepository.getString(StorageKeys.ACCOUNTS)}&recipient_guid=$giud";
    return _handle.apiCantrol(
      request: () => dio.get(
        'chat-message/list/$text',
        options: Options(
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
                }
              : {},
        ),
      ),
      body: (response) => ResponsModel.fromJson(
        response,
        (p0) => (p0 as List)
            .map((e) => ChatMessageModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  @override
  Future<ResponsModel<List<AllUserModel>>> allUser(bool isChat) {
    return _handle.apiCantrol(
      request: () => dio.get(
        'base/all-users/',
        queryParameters: isChat
            ? {
                'chat_user_guid': StorageRepository.getString(
                  StorageKeys.ACCOUNTS,
                ),
              }
            : null,
        options: Options(
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
                }
              : {},
        ),
      ),
      body: (response) => ResponsModel.fromJson(
        response,
        (p0) => (p0 as List)
            .map((e) => AllUserModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  @override
  Future<ResponsModel<ChatGroupModel>> chatGroupCreate(FormData data) {
    return _handle.apiCantrol(
      request: () => dio.post(
        'chat-group/create/',
        data: data,
        options: Options(
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
                }
              : {},
        ),
      ),
      body: (response) => ResponsModel.fromJson(
        response,
        (p0) => ChatGroupModel.fromJson(p0 as Map<String, dynamic>),
      ),
    );
  }

  @override
  Future<bool> chatGroupMemberCreate(Map<String, dynamic> data) {
    return _handle.apiCantrol(
      request: () => dio.post(
        'chat-group-member/create/',
        data: data,
        options: Options(
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
                }
              : {},
        ),
      ),
      body: (response) => response['status_code'] == 201,
    );
  }

  @override
  Future<ResponsModel<List<BooksModel>>> getBooks(FilterModel filter) {
    return _handle.apiCantrol(
      request: () => dio.get(
        'library/files/',
        queryParameters: filter.toJson(),
        options: Options(
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
                }
              : {},
        ),
      ),
      body: (response) => ResponsModel.fromJson(
        response,
        (p0) => (p0 as List)
            .map((e) => BooksModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  @override
  Future<ResponsModel<List<BooksCategoryModel>>> getBooksCategory() {
    return _handle.apiCantrol(
      request: () => dio.get(
        'library/categories/',
        options: Options(
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
                }
              : {},
        ),
      ),
      body: (response) => ResponsModel.fromJson(
        response,
        (p0) => (p0 as List)
            .map((e) => BooksCategoryModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  @override
  Future<ResponsModel<RegionStatisticsModel>> regionStatistics(
    String region,
  ) async {
    final response = await dio.get(
      'dashboard/region-statistics/?region=$region',
      options: Options(
        headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
            ? {
                'Authorization':
                    'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
              }
            : {},
      ),
    );

    // Wrap the response in a 'data' field to match ResponsModel structure
    final wrappedResponse = {'data': response.data};

    return _handle.apiCantrol(
      request: () async => Response(
        data: wrappedResponse,
        statusCode: response.statusCode,
        requestOptions: response.requestOptions,
        headers: response.headers,
        isRedirect: response.isRedirect,
        redirects: response.redirects,
        statusMessage: response.statusMessage,
        extra: response.extra,
      ),
      body: (response) => ResponsModel.fromJson(
        response,
        (p0) => RegionStatisticsModel.fromJson(p0 as Map<String, dynamic>),
      ),
    );
  }

  @override
  Future<ResponsModel<StatisticsModel>> statistics() async {
    final response = await dio.get(
      'dashboard/statistics/',
      options: Options(
        headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
            ? {
                'Authorization':
                    'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
              }
            : {},
      ),
    );

    // Wrap the response in a 'data' field to match ResponsModel structure
    final wrappedResponse = {'data': response.data};

    return _handle.apiCantrol(
      request: () async => Response(
        data: wrappedResponse,
        statusCode: response.statusCode,
        requestOptions: response.requestOptions,
        headers: response.headers,
        isRedirect: response.isRedirect,
        redirects: response.redirects,
        statusMessage: response.statusMessage,
        extra: response.extra,
      ),
      body: (response) => ResponsModel.fromJson(
        response,
        (p0) => StatisticsModel.fromJson(p0 as Map<String, dynamic>),
      ),
    );
  }

  @override
  Future<ResponsModel<List<EmploymentModel>>> employment(String pinfl) {
    return _handle.apiCantrol(
      request: () => dio.get(
        'dsba/employment/?pinfl=$pinfl',
        options: Options(
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}',
                }
              : {},
        ),
      ),
      body: (response) => ResponsModel.fromJson(
        response,
        (p0) => (p0 as List)
            .map((e) => EmploymentModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }
}
