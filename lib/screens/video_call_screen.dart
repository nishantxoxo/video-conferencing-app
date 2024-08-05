import 'package:flutter/material.dart';
import 'package:video_conferencing_app/resources/auth_methods.dart';
import 'package:video_conferencing_app/resources/jitsi_meet_methods.dart';
import 'package:video_conferencing_app/utils/colors.dart';
import 'package:video_conferencing_app/widgets/meeting_option.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AuthMethods _authMethods = AuthMethods();
  late TextEditingController meetingidcontroller;
  late TextEditingController namecontroller;
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  onAudioMuted(bool val) {
    setState(() {
      isAudioMuted = val;
    });
  }
  onVideoMuted(bool val) {
    setState(() {
      isVideoMuted = val;
    });
  }
  bool isAudioMuted = true;
  bool isVideoMuted = true;
  @override
  void initState() {
    
    meetingidcontroller = TextEditingController();
    namecontroller = TextEditingController(text: _authMethods.user.displayName);
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
    meetingidcontroller.dispose();
    namecontroller.dispose();
    
  }

  _joinMeeting() {
    _jitsiMeetMethods.createMeet(roomName: meetingidcontroller.text, isAudioMuted: isAudioMuted, isVideoMuted: isVideoMuted, username: namecontroller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          'join a meeting',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextField(
              controller: meetingidcontroller,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'enter room id',
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)),
            ),
          ),
          SizedBox(
            height: 60,
            child: TextField(
              controller: namecontroller,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Name',
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: _joinMeeting,
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'join',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MeetingOption(
            text: 'Mute audio',
            ismute: isAudioMuted,
            onChanged: onAudioMuted,
          ),
          MeetingOption(
            text: 'mute camera',
            ismute: isVideoMuted,
            onChanged: onVideoMuted,
          ),
        ],
      ),
    );
  }
}
