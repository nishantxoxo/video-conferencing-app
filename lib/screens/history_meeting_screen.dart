import 'package:flutter/material.dart';
import 'package:video_conferencing_app/resources/firestore_methods.dart';

class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: FirestoreMethods().meetingHistory, builder: (context, snapshot) {
      if (snapshot.connectionState  ==  ConnectionState.waiting){
        return Center(child: Center(child: CircularProgressIndicator(),),);
      }
      return ListTile();
    },);
  }
}