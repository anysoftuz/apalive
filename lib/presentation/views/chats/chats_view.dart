import 'package:apalive/app/bloc/app_bloc.dart';
import 'package:apalive/assets/colors/colors.dart';
import 'package:apalive/assets/icons/icons.dart';
import 'package:apalive/data/models/all_user_model.dart';
import 'package:apalive/data/models/chat_group_model.dart';
import 'package:apalive/presentation/views/chats/chat_view.dart';
import 'package:apalive/presentation/views/chats/create_chat_users_view.dart';
import 'package:apalive/presentation/widgets/custom_text_field.dart';
import 'package:apalive/presentation/widgets/w_scale_animation.dart';
import 'package:apalive/presentation/widgets/w_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class ChatsView extends StatefulWidget {
  const ChatsView({super.key});

  @override
  State<ChatsView> createState() => _ChatsViewState();
}

class _ChatsViewState extends State<ChatsView> {
  @override
  void initState() {
    super.initState();
    context.read<AppBloc>().add(ChatGroupEvent());
    context.read<AppBloc>().add(ChatUsersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Chats'),
        actions: [
          WScaleAnimation(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CreateChatUsersView()),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              height: 36,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: borderColor),
              ),
              child: Row(
                spacing: 8,
                children: [
                  AppIcons.userGroup.svg(),
                  Text(
                    'Guruh tuzish',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: textPrimary900,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 60),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
            child: CustomTextField(
              hintText: 'Qidirish',
              prefixIcon: AppIcons.search.svg(),
            ),
          ),
        ),
      ),

      // body: BlocBuilder<AppBloc, AppState>(
      //   builder: (context, state) {
      //     if (state.statusChatGroup.isInProgress) {
      //       return Center(child: CircularProgressIndicator.adaptive());
      //     }
      //     return ListView.separated(
      //       padding: EdgeInsets.only(bottom: 36),
      //       itemBuilder:
      //           (context, index) => ChatIteam(model: state.chatGroup[index]),
      //       separatorBuilder: (context, index) => Divider(height: 4),
      //       itemCount: state.chatGroup.length,
      //     );
      //   },
      // ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              height: 48,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16),
              margin: EdgeInsets.only(bottom: 8),
              child: WTabBar(
                tabs: [Tab(text: 'Chatlar'), Tab(text: 'Guruhlar')],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  BlocBuilder<AppBloc, AppState>(
                    builder: (context, state) {
                      if (state.statusChatGroup.isInProgress) {
                        return Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      }
                      return ListView.separated(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        itemBuilder:
                            (context, index) =>
                                ChatUserIteam(model: state.chatUsers[index]),
                        separatorBuilder:
                            (context, index) => Divider(height: 32),
                        itemCount: state.chatUsers.length,
                      );
                    },
                  ),
                  BlocBuilder<AppBloc, AppState>(
                    builder: (context, state) {
                      if (state.statusChatGroup.isInProgress) {
                        return Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      }
                      return ListView.separated(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        itemBuilder:
                            (context, index) =>
                                ChatIteam(model: state.chatGroup[index]),
                        separatorBuilder:
                            (context, index) => Divider(height: 32),
                        itemCount: state.chatGroup.length,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatIteam extends StatelessWidget {
  const ChatIteam({super.key, required this.model});

  final ChatGroupModel model;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder:
                (context) => ChatView(
                  guid: model.guid,
                  photo: model.logo,
                  name: model.name,
                  isGroup: true,
                ),
          ),
        );
      },
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: white,
        backgroundImage: NetworkImage(model.logo),
      ),
      trailing: Text(
        '5 daq. oldin',
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
      ),
      title: Text(
        model.name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        'Bitiruvchi',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class ChatUserIteam extends StatelessWidget {
  const ChatUserIteam({super.key, required this.model});

  final AllUserModel model;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder:
                (context) => ChatView(
                  guid: model.guid,
                  photo: model.photo,
                  name: model.fullName,
                  isGroup: false,
                ),
          ),
        );
      },
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: white,
        backgroundImage: NetworkImage(
          model.photo.isEmpty
              ? "https://academy.rudn.ru/static/images/profile_default.png"
              : model.photo,
        ),
      ),
      trailing: Text(
        '5 daq. oldin',
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
      ),
      title: Text(
        model.fullName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        'Bitiruvchi',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
