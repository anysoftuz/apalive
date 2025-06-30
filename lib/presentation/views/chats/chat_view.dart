import 'dart:io';

import 'package:apalive/app/bloc/app_bloc.dart';
import 'package:apalive/assets/colors/colors.dart';
import 'package:apalive/assets/constants/storage_keys.dart';
import 'package:apalive/infrastructure/repo/storage_repository.dart';
import 'package:apalive/presentation/widgets/bottom_container.dart';
import 'package:apalive/presentation/widgets/custom_text_field.dart';
import 'package:apalive/utils/log_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class ChatView extends StatefulWidget {
  const ChatView({
    super.key,
    required this.guid,
    required this.photo,
    required this.name,
    required this.isGroup,
  });
  final String guid;
  final String photo;
  final String name;
  final bool isGroup;

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  // ValueNotifier<String> valueNotifier = ValueNotifier('');
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    context.read<AppBloc>().add(ChatMessageEvent(guid: widget.guid,isGroup: widget.isGroup));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 8,
        title: ListTile(
          leading: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(widget.photo),
          ),
          title: Text(widget.name),
          contentPadding: EdgeInsets.zero,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
        ],
      ),

      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: BlocBuilder<AppBloc, AppState>(
                builder: (context, state) {
                  if (state.statusChatMessage.isInProgress) {
                    return Center(child: CircularProgressIndicator.adaptive());
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    reverse: true,
                    itemCount: state.chatMessage.length,
                    itemBuilder: (context, index) {
                      final isMe =
                          state.chatMessage[index].sender.guid ==
                          StorageRepository.getString(StorageKeys.ACCOUNTS);
                      Log.i(StorageRepository.getString(StorageKeys.ACCOUNTS));
                      return Align(
                        alignment:
                            (isMe) ? Alignment.topRight : Alignment.topLeft,
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth:
                                MediaQuery.sizeOf(context).width *
                                ((Platform.isIOS || Platform.isAndroid)
                                    ? 0.9
                                    : 0.18),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(20),
                              topRight: const Radius.circular(20),
                              bottomLeft:
                                  isMe
                                      ? const Radius.circular(20)
                                      : Radius.zero,
                              bottomRight:
                                  isMe
                                      ? Radius.zero
                                      : const Radius.circular(20),
                            ),
                            color: isMe ? blue : Color(0xFFF2F4F7),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          margin: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            state.chatMessage[index].message,
                            style: TextStyle(
                              color: isMe ? Colors.white : Colors.black,
                              fontSize: 16,
                            ),
                            textAlign: isMe ? TextAlign.start : TextAlign.end,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),

          BottomContainer(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            child: Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.attach_file)),
                Expanded(
                  child: CustomTextField(
                    hintText: 'Xabar yozing...',
                    controller: controller,
                    onChanged: (value) {
                      // valueNotifier.value = value;
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.read<AppBloc>().add(
                      ChatPutMessageEvent(text: controller.text),
                    );
                    controller.clear();
                  },
                  icon: CircleAvatar(
                    backgroundColor: blue,
                    child: Icon(Icons.arrow_upward_rounded, color: white),
                  ),
                ),
                // ValueListenableBuilder(
                //   valueListenable: valueNotifier,
                //   builder: (context, value, __) {
                //     return Padding(
                //       padding: const EdgeInsets.symmetric(horizontal: 4),
                //       child: IconButton(
                //         onPressed: () {},
                //         padding: value.isEmpty ? null : EdgeInsets.zero,
                //         icon:
                //             value.isEmpty
                //                 ? Icon(Icons.mic_none_rounded)
                //                 : CircleAvatar(
                //                   backgroundColor: blue,
                //                   child: Icon(
                //                     Icons.arrow_upward_rounded,
                //                     color: white,
                //                   ),
                //                 ),
                //       ),
                //     );
                //   },
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
