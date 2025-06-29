import 'dart:async';

import 'package:apalive/utils/log_service.dart';
import 'package:flutter/material.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';

class JitsiProvider extends ChangeNotifier {
  bool _isMeetingComplete = false;
  bool get isMeetingComplete => _isMeetingComplete;
  bool _hasUserJoined = false;
  bool get hasUserJoined => _hasUserJoined;
  late Timer _meetingTimer;
  void createMeeting({
    required String appointmentID,
    required String roomName,
    required String meetURL,
    required String meetDescription,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username = '',
    String email = '',
    String userProfile = '',
    bool preJoined = true,
    bool isVideo = true,
    bool isGroup = true,
  }) async {
    try {
      _hasUserJoined = true;
      notifyListeners();

      // Starting a timer for 15 minutes
      // Initialize the meeting timer with a null check
      _meetingTimer = Timer(Duration(milliseconds: 500), () {
        callAPIappointmentCompleted(appointmentID);
        endMeeting();
        JitsiMeet().hangUp();
      });
      Map<String, dynamic> featureFlag = {};
      featureFlag['welcomepage.enabled'] = false;
      featureFlag['prejoinpage.enabled'] = preJoined;
      featureFlag['add-people.enabled'] = isGroup;

      var options = JitsiMeetConferenceOptions(
        room: roomName,
        serverURL: meetURL,
        configOverrides: {
          "startWithAudioMuted": isAudioMuted,
          "startWithVideoMuted": isVideoMuted,
          "subject": meetDescription,
        },
        userInfo: JitsiMeetUserInfo(
          displayName: username,
          email: email,
          avatar: userProfile,
        ),
        featureFlags: {
          "unsaferoomwarning.enabled": false,
          "add-people.enabled": false, // Set it to false here
          'chat.enabled': true,
          'invite.enabled': false,
          'ios.recording.enabled': false,
          'recording.enabled': false,
          'kick-out.enabled': false,
        },
      );
      var eventListeners = JitsiMeetEventListener(
        conferenceJoined: (url) {
          Log.i("conferenceJoined: url: $url");
        },
        conferenceWillJoin: (url) {
          Log.i("conferenceWillJoin: url: $url");
        },
        participantJoined: (email, name, role, participantId) {
          Log.i(
            "participantJoined: email: $email, name: $name, role: $role, "
            "participantId: $participantId",
          );
        },

        audioMutedChanged: (muted) {
          Log.i("audioMutedChanged: isMuted: $muted");
        },
        videoMutedChanged: (muted) {
          Log.i("videoMutedChanged: isMuted: $muted");
        },
        endpointTextMessageReceived: (senderId, message) {
          Log.i(
            "endpointTextMessageReceived: senderId: $senderId, message: $message",
          );
        },
        screenShareToggled: (participantId, sharing) {
          Log.i(
            "screenShareToggled: participantId: $participantId, "
            "isSharing: $sharing",
          );
        },
        chatMessageReceived: (senderId, message, isPrivate, timestamp) {
          Log.i(
            "chatMessageReceived: senderId: $senderId, message: $message, "
            "isPrivate: $isPrivate, timestamp: $timestamp",
          );
        },
        chatToggled: (isOpen) => Log.i("chatToggled: isOpen: $isOpen"),
        participantsInfoRetrieved: (participantsInfo) {
          Log.i(
            "participantsInfoRetrieved: participantsInfo: $participantsInfo, ",
          );
        },
        conferenceTerminated: (url, error) async {
          Log.i("MEET TERMINATED");
          Log.i(url);
          callAPIappointmentCompleted(appointmentID);
          endMeeting();
          await JitsiMeet().hangUp();
        },
        participantLeft: (participantId) async {
          Log.i("user has left");
          Log.i(participantId);
          callAPIappointmentCompleted(appointmentID);
          endMeeting();
          await JitsiMeet().hangUp();
        },
        readyToClose: () async {
          Log.i("readyToClose");
          endMeeting();
          await JitsiMeet().hangUp();
        },
      );
      await JitsiMeet().join(options, eventListeners);
    } catch (error) {
      Log.e("error: $error");
    }
  }

  void onMeetingEnd() {
    // Call your function here
    callAPIappointmentCompleted("YOUR_APPOINTMENT_ID");
    // Print the log message
    Log.i("Log out initiated");
  }

  void endMeeting() {
    _isMeetingComplete = true;
    notifyListeners();
    _meetingTimer.cancel();
    onMeetingEnd();
  }

  Future<void> callAPIappointmentCompleted(String appointmentID) async {
    // await http.post(
    //   Uri.parse("https://your-api.com/appointments/$appointmentID/complete"),
    //   headers: {'Authorization': 'Bearer YOUR_TOKEN'},
    // );
  }
}
