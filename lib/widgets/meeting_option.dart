import 'package:flutter/material.dart';
import 'package:video_conferencing_app/utils/colors.dart';

class MeetingOption extends StatelessWidget {
  final String text;
  const MeetingOption({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: secondaryBackgroundColor,
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
