part of 'app_bloc.dart';

sealed class AppEvent {}

class ContentEvent extends AppEvent {}

class GraduateUserEvent extends AppEvent {}

class VideoCallsEvent extends AppEvent {}

class VideoGalleryEvent extends AppEvent {}

class NewsEvent extends AppEvent {}

class ModeratorUserEvent extends AppEvent {}

class TeacherUserEvent extends AppEvent {}

class ForumsEvent extends AppEvent {}

class ChatGroupEvent extends AppEvent {}

class ChatUsersEvent extends AppEvent {}

class ChatPutMessageEvent extends AppEvent {
  final String text;

  ChatPutMessageEvent({required this.text});
}

class ChatMessageEvent extends AppEvent {
  final String guid;

  ChatMessageEvent({required this.guid});
}
