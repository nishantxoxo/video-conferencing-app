import 'package:flutter/material.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';

import 'package:video_conferencing_app/resources/auth_methods.dart';
import 'package:video_conferencing_app/resources/firestore_methods.dart';

class JitsiMeetMethods {
  final AuthMethods _authMethods = AuthMethods();
  final FirestoreMethods _firestoreMethods =FirestoreMethods();
  void createMeet(
      {required String roomName,
      required bool isAudioMuted,
      required bool isVideoMuted,
      String username = ''}) async {
    try {

      String name;
      if (username.isEmpty) {
        name = _authMethods.user.displayName!;
      } else {
        name = username;
      }
      var options = JitsiMeetConferenceOptions(
        room: roomName,
        configOverrides: {
          "startWithAudioMuted": isAudioMuted,
          "startWithVideoMuted": isVideoMuted,
        },
        userInfo: JitsiMeetUserInfo(
          displayName: name,
          email: _authMethods.user.email,
          avatar: _authMethods.user.photoURL,
        ),
      );
      _firestoreMethods.addToMeetingHistory(roomName);
      await JitsiMeet().join(options);

    } catch (error) {
      debugPrint("error: $error");
    }
  }
}
