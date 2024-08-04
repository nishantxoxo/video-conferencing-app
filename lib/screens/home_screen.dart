import 'package:flutter/material.dart';
import 'package:video_conferencing_app/screens/history_meeting_screen.dart';
import 'package:video_conferencing_app/screens/meetings_screen.dart';
import 'package:video_conferencing_app/utils/colors.dart';
import 'package:video_conferencing_app/widgets/home_meeting_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pg = 0;
  onPageChanged(int page) {
    setState(() {
      _pg = page;
    });
  }
  List<Widget> pages = [ MeetingsScreen(), HistoryMeetingScreen(), Text('contacts'), Text('settings')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('meet and chat'),
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      body: pages[_pg],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onPageChanged,
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _pg,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.comment_bank,
              ),
              label: "meet and chat"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.lock_clock,
              ),
              label: "meetings"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              label: "contacts"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_outlined,
              ),
              label: "setting"),
          
        ],
      ),
    );
  }
}

