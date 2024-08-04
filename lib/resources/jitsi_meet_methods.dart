
import 'package:flutter/material.dart';
import 'package:jitsi_meet_v1/feature_flag/feature_flag.dart';
import 'package:jitsi_meet_v1/jitsi_meet.dart';
import 'package:video_conferencing_app/resources/auth_methods.dart';

class JitsiMeetMethods{
  final AuthMethods _authMethods = AuthMethods();
  void createMeet({required String roomName, required bool isAudioMuted, required bool isVideoMuted}) async{
   try {
	  FeatureFlag featureFlag = FeatureFlag();
	  featureFlag.welcomePageEnabled = false;
	  featureFlag.resolution = FeatureFlagVideoResolution.MD_RESOLUTION; // Limit video resolution to 360p
	  
      var options = JitsiMeetingOptions( room: roomName )
        // ..room = "myroom" // Required, spaces will be trimmed
        // ..serverURL = "https://someHost.com"
        // ..subject = "Meeting with Gunschu"
        ..userDisplayName = _authMethods.user.displayName
        ..userEmail = _authMethods.user.email
        ..userAvatarURL = _authMethods.user.photoURL // or .png
        
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;
        

      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      debugPrint("error: $error");
    }
}

}