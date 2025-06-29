import 'dart:async';

import 'package:apalive/app/auth/auth_bloc.dart';
import 'package:apalive/app/bloc/app_bloc.dart';
import 'package:apalive/assets/colors/colors.dart';
import 'package:apalive/assets/icons/icons.dart';
import 'package:apalive/data/models/video_calls_model.dart';
import 'package:apalive/presentation/routes/app_routes.dart';
import 'package:apalive/presentation/widgets/custom_snackbar.dart';
import 'package:apalive/presentation/widgets/custom_text_field.dart';
import 'package:apalive/utils/log_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';

class MeetsView extends StatefulWidget {
  const MeetsView({super.key});

  @override
  State<MeetsView> createState() => _MeetsViewState();
}

class _MeetsViewState extends State<MeetsView> {
  bool audioMuted = true;
  bool videoMuted = true;
  bool screenShareOn = false;
  List<String> participants = [];
  final _jitsiMeetPlugin = JitsiMeet();

  bool _isMeetingComplete = false;
  @override
  void initState() {
    context.read<AppBloc>().add(VideoCallsEvent());
    super.initState();
  }

  void _joinMeeting(VideoCallsModel model) async {
    final userModel = context.read<AuthBloc>().state.userModel;
    try {
      final options = JitsiMeetConferenceOptions(
        serverURL: 'https://apa-live-backend.gettest.uz/',
        room: model.roomName,
        userInfo: JitsiMeetUserInfo(
          displayName:
              userModel.name.isEmpty ? userModel.username : userModel.name,
          avatar:
              "https://avatars.githubusercontent.com/u/57035818?s=400&u=02572f10fe61bca6fc20426548f3920d53f79693&v=4",
        ),
        configOverrides: {
          "startWithAudioMuted": true,
          "startWithVideoMuted": true,
        },
        featureFlags: {
          FeatureFlags.welcomePageEnabled: false,
          FeatureFlags.preJoinPageEnabled: true,
          FeatureFlags.chatEnabled: true,
          FeatureFlags.videoMuteEnabled: true,
          FeatureFlags.audioMuteButtonEnabled: true,
          FeatureFlags.recordingEnabled: false,
        },
      );

      var listener = JitsiMeetEventListener(
        conferenceJoined: (url) {
          debugPrint("✅ conferenceJoined: $url");
        },
        conferenceTerminated: (url, error) async {
          if (_isMeetingComplete) return;
          _isMeetingComplete = true;

          debugPrint("❌ conferenceTerminated: $url, error: $error");
          await _jitsiMeetPlugin.hangUp();
          await Future.delayed(const Duration(milliseconds: 300));
          if (AppRouts.navigatorKey.currentState?.canPop() ?? false) {
            AppRouts.navigatorKey.currentState?.pop();
          }
        },
        conferenceWillJoin: (url) async {
          debugPrint("🟡 conferenceWillJoin: $url");
        },
        participantJoined: (email, name, role, participantId) {
          debugPrint("👤 participantJoined: $participantId");
          participants.add(participantId!);
        },
        participantLeft: (participantId) {
          debugPrint("🚪 participantLeft: $participantId");
        },
        audioMutedChanged: (muted) {
          debugPrint("🔇 audioMutedChanged: $muted");
        },
        videoMutedChanged: (muted) {
          debugPrint("🎥 videoMutedChanged: $muted");
        },
      );

      await _jitsiMeetPlugin.join(options, listener);
    } catch (e) {
      Log.e("Error: $e");
      if (mounted) {
        CustomSnackbar.show(context, "Video call failed: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video muloqotlar'),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 56),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: CustomTextField(
              hintText: 'Muloqtni qidirish',
              prefixIcon: AppIcons.search.svg(),
            ),
          ),
        ),
      ),
      body: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if (state.statusVideoCalls.isInProgress) {
            return Center(child: CircularProgressIndicator.adaptive());
          }
          if (state.videoCalls.isEmpty) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppIcons.meetsEmpty.svg(),
                  SizedBox(height: 28),
                  Text(
                    'Hozirda hech qanday reja qilingan uchrashuvlar mavjud emas',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Hozirda hec qanday rejalashtirilgan uchrashuvlar\n mavjud emas, uchrashuvlar rejalashtirilganida\n menyuda bu haqida ko’rsatiladi',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          } else {
            return RefreshIndicator.adaptive(
              onRefresh: () async {
                context.read<AppBloc>().add(VideoCallsEvent());
                await Future.delayed(Duration.zero);
              },
              child: ListView.separated(
                padding: EdgeInsets.all(16),
                itemBuilder:
                    (context, index) => Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: borderColor),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 16,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: borderColor),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: white,
                                border: Border.all(color: borderColor),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 2,
                                    spreadRadius: 0,
                                    offset: Offset(0, 1),
                                    color: Color(
                                      0xFF0A0D12,
                                    ).withValues(alpha: .1),
                                  ),
                                  BoxShadow(
                                    blurRadius: 3,
                                    spreadRadius: 0,
                                    offset: Offset(0, 3),
                                    color: Color(
                                      0xFF0A0D12,
                                    ).withValues(alpha: .1),
                                  ),
                                  BoxShadow(
                                    blurRadius: 5,
                                    spreadRadius: 0,
                                    offset: Offset(1, 8),
                                    color: Color(
                                      0xFF0A0D12,
                                    ).withValues(alpha: .05),
                                  ),
                                  BoxShadow(
                                    blurRadius: 2,
                                    spreadRadius: 0,
                                    offset: Offset(0, -2),
                                    color: Color(
                                      0xFF0A0D12,
                                    ).withValues(alpha: .1),
                                  ),
                                ],
                              ),

                              padding: EdgeInsets.all(6),
                              child: AppIcons.video.svg(),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  state.videoCalls[index].title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _joinMeeting(state.videoCalls[index]);
                                },
                                child: AppIcons.arrowUpRight.svg(),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Boshlanish vaqti',
                                style: TextStyle(fontWeight: FontWeight.w400),
                              ),

                              Text(
                                "${state.videoCalls[index].date} ${state.videoCalls[index].startTime}",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ishtirokchilar',
                                style: TextStyle(fontWeight: FontWeight.w400),
                              ),

                              CircleAvatar(
                                radius: 16,
                                child: Text(
                                  '${state.videoCalls[index].participants.length}',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(height: 16),
                itemCount: state.videoCalls.length,
              ),
            );
          }
        },
      ),
    );
  }
}
