part of 'app_bloc.dart';

sealed class AppEvent {}

class EmploymentEvent extends AppEvent {
  final String pinfl;

  EmploymentEvent({required this.pinfl});
}

class StatisticsEvent extends AppEvent {}

class RegionStatisticsEvent extends AppEvent {
  final String region;

  RegionStatisticsEvent({required this.region});
}

class BooksEvent extends AppEvent {
  final String? search;
  final int? categoryId;

  BooksEvent({this.search, this.categoryId});
}

class BooksCategoryEvent extends AppEvent {}

class ContentEvent extends AppEvent {}

class GraduateUserEvent extends AppEvent {}

class VideoCallsEvent extends AppEvent {}

class VideoGalleryEvent extends AppEvent {}

class NewsEvent extends AppEvent {}

class ModeratorUserEvent extends AppEvent {}

class TeacherUserEvent extends AppEvent {}

class ForumsEvent extends AppEvent {}

class GetAllUsers extends AppEvent {}

class ChatGroupEvent extends AppEvent {}

class ChatUsersEvent extends AppEvent {}

class ChatPutMessageEvent extends AppEvent {
  final String text;

  ChatPutMessageEvent({required this.text});
}

class ChatPutMessageSocketEvent extends AppEvent {
  final String text;
  final int id;
  final String guid;

  ChatPutMessageSocketEvent({
    required this.text,
    required this.id,
    required this.guid,
  });
}

class ChatMessageEvent extends AppEvent {
  final String guid;
  final bool isGroup;

  ChatMessageEvent({required this.guid, this.isGroup = true});
}

class CreateChatEvent extends AppEvent {
  final String name;
  final File? images;
  final List<int> users;
  final VoidCallback onSucces;
  final VoidCallback onError;
  CreateChatEvent({
    required this.name,
    required this.images,
    required this.users,
    required this.onSucces,
    required this.onError,
  });
}
