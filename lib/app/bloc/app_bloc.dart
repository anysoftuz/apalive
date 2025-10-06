import 'dart:io';

import 'package:apalive/assets/constants/storage_keys.dart';
import 'package:apalive/data/models/all_user_model.dart';
import 'package:apalive/data/models/books/books_category_model.dart';
import 'package:apalive/data/models/books/books_model.dart';
import 'package:apalive/data/models/chat_group_model.dart';
import 'package:apalive/data/models/chat_message_model.dart';
import 'package:apalive/data/models/common/filter_model.dart';
import 'package:apalive/data/models/content_model.dart';
import 'package:apalive/data/models/employment_model.dart';
import 'package:apalive/data/models/forum/forums_model.dart';
import 'package:apalive/data/models/graduate_user_model.dart';
import 'package:apalive/data/models/home/region_statistics_model.dart';
import 'package:apalive/data/models/home/statistics_model.dart';
import 'package:apalive/data/models/moderator_user_model.dart';
import 'package:apalive/data/models/news_model.dart';
import 'package:apalive/data/models/teacher_user_model.dart';
import 'package:apalive/data/models/video_calls_model.dart';
import 'package:apalive/data/models/video_gallery_model.dart';
import 'package:apalive/infrastructure/repo/api_repo.dart';
import 'package:apalive/infrastructure/repo/storage_repository.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final ApiRepo _repo;
  AppBloc(this._repo) : super(AppState()) {
    on<EmploymentEvent>((event, emit) async {
      emit(state.copyWith(statusEmployment: FormzSubmissionStatus.inProgress));
      final response = await _repo.employment(event.pinfl);
      if (response.isRight) {
        emit(
          state.copyWith(
            statusEmployment: FormzSubmissionStatus.success,
            employment: response.right.data,
          ),
        );
      } else {
        emit(state.copyWith(statusEmployment: FormzSubmissionStatus.failure));
      }
    });

    on<StatisticsEvent>((event, emit) async {
      emit(state.copyWith(statusStatistics: FormzSubmissionStatus.inProgress));
      final response = await _repo.statistics();
      if (response.isRight) {
        emit(
          state.copyWith(
            statusStatistics: FormzSubmissionStatus.success,
            statistics: response.right.data,
          ),
        );
      } else {
        emit(state.copyWith(statusStatistics: FormzSubmissionStatus.failure));
      }
    });

    on<RegionStatisticsEvent>((event, emit) async {
      emit(
        state.copyWith(
          statusRegionStatistics: FormzSubmissionStatus.inProgress,
        ),
      );
      final response = await _repo.regionStatistics(event.region);
      if (response.isRight) {
        emit(
          state.copyWith(
            statusRegionStatistics: FormzSubmissionStatus.success,
            regionStatistics: response.right.data,
          ),
        );
      } else {
        emit(
          state.copyWith(statusRegionStatistics: FormzSubmissionStatus.failure),
        );
      }
    });

    on<BooksCategoryEvent>((event, emit) async {
      emit(
        state.copyWith(statusBooksCategory: FormzSubmissionStatus.inProgress),
      );
      final response = await _repo.getBooksCategory();
      if (response.isRight) {
        emit(
          state.copyWith(
            statusBooksCategory: FormzSubmissionStatus.success,
            booksCategory: response.right.data,
          ),
        );
      } else {
        emit(
          state.copyWith(statusBooksCategory: FormzSubmissionStatus.failure),
        );
      }
    });

    on<BooksEvent>((event, emit) async {
      emit(state.copyWith(statusBooks: FormzSubmissionStatus.inProgress));
      FilterModel filter = FilterModel(
        search: event.search,
        categoryId: event.categoryId,
      );
      final response = await _repo.getBooks(filter);
      if (response.isRight) {
        emit(
          state.copyWith(
            statusBooks: FormzSubmissionStatus.success,
            books: response.right.data,
          ),
        );
      } else {
        emit(state.copyWith(statusBooks: FormzSubmissionStatus.failure));
      }
    });

    on<CreateChatEvent>((event, emit) async {
      emit(state.copyWith(statusCreate: FormzSubmissionStatus.inProgress));
      final response = await _repo.chatGroupCreate(
        FormData.fromMap({
          'name': event.name,
          'logo': event.images != null
              ? await MultipartFile.fromFile(event.images!.path)
              : event.images,
        }),
      );
      if (response.isRight) {
        final response2 = await _repo.chatGroupMemberCreate({
          'group': response.right.data.id,
          'users': event.users,
        });
        if (response2.isRight) {
          emit(state.copyWith(statusCreate: FormzSubmissionStatus.success));
          add(ChatGroupEvent());
          event.onSucces();
        } else {
          event.onError();
          emit(state.copyWith(statusCreate: FormzSubmissionStatus.failure));
        }
      } else {
        event.onError();
        emit(state.copyWith(statusCreate: FormzSubmissionStatus.failure));
      }
    });

    on<ContentEvent>((event, emit) async {
      emit(state.copyWith(statusContent: FormzSubmissionStatus.inProgress));
      final response = await _repo.contentList();
      if (response.isRight) {
        emit(
          state.copyWith(
            statusContent: FormzSubmissionStatus.success,
            contentList: response.right.data,
          ),
        );
      } else {
        emit(state.copyWith(statusContent: FormzSubmissionStatus.failure));
      }
    });

    on<GetAllUsers>((event, emit) async {
      emit(state.copyWith(statusAllUsers: FormzSubmissionStatus.inProgress));
      final response = await _repo.allUsers();
      if (response.isRight) {
        emit(
          state.copyWith(
            statusAllUsers: FormzSubmissionStatus.success,
            allUsers: response.right.data,
          ),
        );
      } else {
        emit(state.copyWith(statusAllUsers: FormzSubmissionStatus.failure));
      }
    });

    on<ChatGroupEvent>((event, emit) async {
      emit(state.copyWith(statusChatGroup: FormzSubmissionStatus.inProgress));
      final response = await _repo.chatGroup();
      if (response.isRight) {
        emit(
          state.copyWith(
            statusChatGroup: FormzSubmissionStatus.success,
            chatGroup: response.right.data,
          ),
        );
      } else {
        emit(state.copyWith(statusChatGroup: FormzSubmissionStatus.failure));
      }
    });

    on<ChatUsersEvent>((event, emit) async {
      emit(state.copyWith(statusChatGroup: FormzSubmissionStatus.inProgress));
      final response = await _repo.chatUsers();
      if (response.isRight) {
        emit(
          state.copyWith(
            statusChatGroup: FormzSubmissionStatus.success,
            chatUsers: response.right.data,
          ),
        );
      } else {
        emit(state.copyWith(statusChatGroup: FormzSubmissionStatus.failure));
      }
    });

    on<ChatMessageEvent>((event, emit) async {
      emit(state.copyWith(statusChatMessage: FormzSubmissionStatus.inProgress));
      final response = await _repo.chatMessage(event.guid, event.isGroup);
      if (response.isRight) {
        emit(
          state.copyWith(
            statusChatMessage: FormzSubmissionStatus.success,
            chatMessage: response.right.data,
          ),
        );
      } else {
        emit(state.copyWith(statusChatMessage: FormzSubmissionStatus.failure));
      }
    });
    on<ChatPutMessageSocketEvent>((event, emit) async {
      List<ChatMessageModel> chatMessage = List.from(state.chatMessage);
      chatMessage.insert(
        0,
        ChatMessageModel(
          id: 0,
          guid: '',
          sender: Recipient(
            id: event.id,
            guid: event.guid,
            username: '',
            name: '',
            surname: '',
            middleName: '',
          ),
          recipient: Recipient(
            id: 0,
            guid: StorageRepository.getString(StorageKeys.ACCOUNTS),
            username: '',
            name: '',
            surname: '',
            middleName: '',
          ),
          group: null,
          message: event.text,
          createdBy: null,
          deletedBy: null,
        ),
      );
      emit(state.copyWith(chatMessage: chatMessage));
    });

    on<ChatPutMessageEvent>((event, emit) async {
      List<ChatMessageModel> chatMessage = List.from(state.chatMessage);
      chatMessage.insert(
        0,
        ChatMessageModel(
          id: 0,
          guid: '',
          sender: Recipient(
            id: 0,
            guid: StorageRepository.getString(StorageKeys.ACCOUNTS),
            username: '',
            name: '',
            surname: '',
            middleName: '',
          ),
          recipient: Recipient(
            id: 0,
            guid: StorageRepository.getString(StorageKeys.ACCOUNTS),
            username: '',
            name: '',
            surname: '',
            middleName: '',
          ),
          group: null,
          message: event.text,
          createdBy: null,
          deletedBy: null,
        ),
      );
      emit(state.copyWith(chatMessage: chatMessage));
    });

    on<GraduateUserEvent>((event, emit) async {
      emit(
        state.copyWith(statusGraduateUser: FormzSubmissionStatus.inProgress),
      );
      final response = await _repo.graduateUser();
      if (response.isRight) {
        emit(
          state.copyWith(
            statusGraduateUser: FormzSubmissionStatus.success,
            graduateUser: response.right.data,
          ),
        );
      } else {
        emit(state.copyWith(statusGraduateUser: FormzSubmissionStatus.failure));
      }
    });

    on<VideoCallsEvent>((event, emit) async {
      emit(state.copyWith(statusVideoCalls: FormzSubmissionStatus.inProgress));
      final response = await _repo.videoCalls();
      if (response.isRight) {
        emit(
          state.copyWith(
            statusVideoCalls: FormzSubmissionStatus.success,
            videoCalls: response.right.data,
          ),
        );
      } else {
        emit(state.copyWith(statusVideoCalls: FormzSubmissionStatus.failure));
      }
    });

    on<VideoGalleryEvent>((event, emit) async {
      emit(
        state.copyWith(statusVideoGallery: FormzSubmissionStatus.inProgress),
      );
      final response = await _repo.videoGallery();
      if (response.isRight) {
        emit(
          state.copyWith(
            statusVideoGallery: FormzSubmissionStatus.success,
            videoGallery: response.right.data,
          ),
        );
      } else {
        emit(state.copyWith(statusVideoGallery: FormzSubmissionStatus.failure));
      }
    });

    on<NewsEvent>((event, emit) async {
      emit(state.copyWith(statusNews: FormzSubmissionStatus.inProgress));
      final response = await _repo.news();
      if (response.isRight) {
        emit(
          state.copyWith(
            statusNews: FormzSubmissionStatus.success,
            news: response.right.data,
          ),
        );
      } else {
        emit(state.copyWith(statusNews: FormzSubmissionStatus.failure));
      }
    });

    on<ModeratorUserEvent>((event, emit) async {
      emit(
        state.copyWith(statusModeratorUser: FormzSubmissionStatus.inProgress),
      );
      final response = await _repo.moderatorUser();
      if (response.isRight) {
        emit(
          state.copyWith(
            statusModeratorUser: FormzSubmissionStatus.success,
            moderatorUser: response.right.data,
          ),
        );
      } else {
        emit(
          state.copyWith(statusModeratorUser: FormzSubmissionStatus.failure),
        );
      }
    });

    on<TeacherUserEvent>((event, emit) async {
      emit(state.copyWith(statusTeacherUser: FormzSubmissionStatus.inProgress));
      final response = await _repo.teacherUser();
      if (response.isRight) {
        emit(
          state.copyWith(
            statusTeacherUser: FormzSubmissionStatus.success,
            teacherUser: response.right.data,
          ),
        );
      } else {
        emit(state.copyWith(statusTeacherUser: FormzSubmissionStatus.failure));
      }
    });

    on<ForumsEvent>((event, emit) async {
      emit(state.copyWith(statusForum: FormzSubmissionStatus.inProgress));
      final response = await _repo.forums();
      if (response.isRight) {
        emit(
          state.copyWith(
            statusForum: FormzSubmissionStatus.success,
            forums: response.right.data,
          ),
        );
      } else {
        emit(state.copyWith(statusForum: FormzSubmissionStatus.failure));
      }
    });
  }
}
