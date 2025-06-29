// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_bloc.dart';

class AppState extends Equatable {
  final FormzSubmissionStatus statusForum;
  final FormzSubmissionStatus statusModeratorUser;
  final FormzSubmissionStatus statusNews;
  final FormzSubmissionStatus statusVideoGallery;
  final FormzSubmissionStatus statusVideoCalls;
  final FormzSubmissionStatus statusGraduateUser;
  final FormzSubmissionStatus statusContent;
  final FormzSubmissionStatus statusTeacherUser;
  final FormzSubmissionStatus statusChatGroup;
  final FormzSubmissionStatus statusChatMessage;
  final List<ContentModel> contentList;
  final List<ChatGroupModel> chatGroup;
  final List<GraduateUserModel> graduateUser;
  final List<VideoCallsModel> videoCalls;
  final List<VideoGalleryModel> videoGallery;
  final List<NewsModel> news;
  final List<ModeratorUserModel> moderatorUser;
  final List<ForumsModel> forums;
  final List<TeacherUserModel> teacherUser;
  final List<ChatMessageModel> chatMessage;
  final List<AllUserModel> chatUsers;

  const AppState({
    this.statusForum = FormzSubmissionStatus.initial,
    this.statusModeratorUser = FormzSubmissionStatus.initial,
    this.statusNews = FormzSubmissionStatus.initial,
    this.statusVideoGallery = FormzSubmissionStatus.initial,
    this.statusVideoCalls = FormzSubmissionStatus.initial,
    this.statusGraduateUser = FormzSubmissionStatus.initial,
    this.statusContent = FormzSubmissionStatus.initial,
    this.statusTeacherUser = FormzSubmissionStatus.initial,
    this.statusChatGroup = FormzSubmissionStatus.initial,
    this.statusChatMessage = FormzSubmissionStatus.initial,
    this.chatMessage = const [],
    this.chatGroup = const [],
    this.chatUsers = const [],
    this.teacherUser = const [],
    this.contentList = const [],
    this.graduateUser = const [],
    this.videoCalls = const [],
    this.videoGallery = const [],
    this.news = const [],
    this.moderatorUser = const [],
    this.forums = const [],
  });

  @override
  List<Object> get props => [
    statusForum,
    statusModeratorUser,
    statusNews,
    statusVideoGallery,
    statusVideoCalls,
    statusGraduateUser,
    statusContent,
    statusTeacherUser,
    statusChatGroup,
    statusChatMessage,
    chatMessage,
    chatGroup,
    teacherUser,
    contentList,
    graduateUser,
    videoCalls,
    videoGallery,
    news,
    moderatorUser,
    forums,
  ];

  AppState copyWith({
    FormzSubmissionStatus? statusForum,
    FormzSubmissionStatus? statusModeratorUser,
    FormzSubmissionStatus? statusNews,
    FormzSubmissionStatus? statusVideoGallery,
    FormzSubmissionStatus? statusVideoCalls,
    FormzSubmissionStatus? statusGraduateUser,
    FormzSubmissionStatus? statusContent,
    FormzSubmissionStatus? statusTeacherUser,
    FormzSubmissionStatus? statusChatGroup,
    FormzSubmissionStatus? statusChatMessage,
    List<ContentModel>? contentList,
    List<ChatGroupModel>? chatGroup,
    List<GraduateUserModel>? graduateUser,
    List<VideoCallsModel>? videoCalls,
    List<VideoGalleryModel>? videoGallery,
    List<NewsModel>? news,
    List<ModeratorUserModel>? moderatorUser,
    List<ForumsModel>? forums,
    List<TeacherUserModel>? teacherUser,
    List<ChatMessageModel>? chatMessage,
    List<AllUserModel>? chatUsers,
  }) {
    return AppState(
      statusForum: statusForum ?? this.statusForum,
      statusModeratorUser: statusModeratorUser ?? this.statusModeratorUser,
      statusNews: statusNews ?? this.statusNews,
      statusVideoGallery: statusVideoGallery ?? this.statusVideoGallery,
      statusVideoCalls: statusVideoCalls ?? this.statusVideoCalls,
      statusGraduateUser: statusGraduateUser ?? this.statusGraduateUser,
      statusContent: statusContent ?? this.statusContent,
      statusTeacherUser: statusTeacherUser ?? this.statusTeacherUser,
      statusChatGroup: statusChatGroup ?? this.statusChatGroup,
      statusChatMessage: statusChatMessage ?? this.statusChatMessage,
      contentList: contentList ?? this.contentList,
      chatGroup: chatGroup ?? this.chatGroup,
      graduateUser: graduateUser ?? this.graduateUser,
      videoCalls: videoCalls ?? this.videoCalls,
      videoGallery: videoGallery ?? this.videoGallery,
      news: news ?? this.news,
      moderatorUser: moderatorUser ?? this.moderatorUser,
      forums: forums ?? this.forums,
      teacherUser: teacherUser ?? this.teacherUser,
      chatMessage: chatMessage ?? this.chatMessage,
      chatUsers: chatUsers ?? this.chatUsers,
    );
  }
}
