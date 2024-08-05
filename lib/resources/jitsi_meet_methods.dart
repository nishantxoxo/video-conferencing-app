import 'package:flutter/material.dart';
import 'package:jitsi_meet_v1/feature_flag/feature_flag.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
// import 'package:jitsi_meet_v1/jitsi_meet.dart';
import 'package:video_conferencing_app/resources/auth_methods.dart';

class JitsiMeetMethods {
  final AuthMethods _authMethods = AuthMethods();
  void createMeet(
      {required String roomName,
      required bool isAudioMuted,
      required bool isVideoMuted,
      String username = ''}) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p
      featureFlag.meetingPasswordEnabled = false;
      String name;
      if (username.isEmpty) {
        name = _authMethods.user.displayName!;
      } else {
        name = username;
      }
      // var options = JitsiMeetingOptions(room: roomName)
      //   // ..room = "myroom" // Required, spaces will be trimmed
      //   // ..serverURL = "https://someHost.com"
      //   // ..subject = "Meeting with Gunschu"
      //   ..userDisplayName = name
      //   ..userEmail = _authMethods.user.email
      //   ..userAvatarURL = _authMethods.user.photoURL // or .png
      //   // ..token = '1234'
        
      //   ..audioMuted = isAudioMuted
      //   ..videoMuted = isVideoMuted
      //   ..featureFlags = featureFlag
      Map<String, Object> featureFlags = {};
      var options = JitsiMeetingOptions(
          roomNameOrUrl: roomName,
          userDisplayName: name,
          userEmail: _authMethods.user.email,
          userAvatarUrl: _authMethods.user.photoURL,
          isAudioMuted: isAudioMuted,
          isVideoMuted: isVideoMuted,
          );
     

      await JitsiMeetWrapper.joinMeeting(options: options, listener: JitsiMeetingListener(
    onConferenceWillJoin: (url) => print("onConferenceWillJoin: url: $url"),
    onConferenceJoined: (url) => print("onConferenceJoined: url: $url"),
    onConferenceTerminated: (url, error) => print("onConferenceTerminated: url: $url, error: $error"),
  ),);
      // await JitsiMeet.joinMeeting(options);
    } catch (error) {
      debugPrint("error: $error");
    }
  }
}
