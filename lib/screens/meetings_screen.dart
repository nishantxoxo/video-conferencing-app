import 'dart:math';

import 'package:flutter/material.dart';
import 'package:video_conferencing_app/resources/jitsi_meet_methods.dart';
import 'package:video_conferencing_app/widgets/home_meeting_button.dart';

class MeetingsScreen extends StatelessWidget {
   MeetingsScreen({super.key});
  final JitsiMeetMethods jitsiMeetMethods = JitsiMeetMethods();
  createNewMeeting() async{
    var random = Random();
    String roomName = (random.nextInt(1000000000) + 1000000000).toString();
    jitsiMeetMethods.createMeet(roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }


  joinMeeting(BuildContext context){
    Navigator.pushNamed(context, '/video-call');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
              onpressed: createNewMeeting,
              icon: Icons.videocam,
              text: "new meeting",
            ),
            HomeMeetingButton(
              onpressed: () => joinMeeting(context),
              icon: Icons.add_box_rounded,
              text: "join meeting",
            ),
            HomeMeetingButton(
              onpressed: () {},
              icon: Icons.calendar_today,
              text: "schedule",
            ),
            HomeMeetingButton(
              onpressed: () {},
              icon: Icons.arrow_upward,
              text: "share screem",
            ),
          ],
        ),
        const Expanded(
          child: Center(
            child: Text(
              'create/join meetings with just a click!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        )
      ],
    );
  }
}