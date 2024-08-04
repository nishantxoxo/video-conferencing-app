import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_conferencing_app/utils/colors.dart';

class HomeMeetingButton extends StatelessWidget {
  final VoidCallback onpressed;
  final IconData icon;
  final String text;
  const HomeMeetingButton({super.key, required this.onpressed, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.06),
                    offset: Offset(0, 4))
              ],
            ),
            width: 60,
            height: 60,
            child: Icon(icon, color: Colors.white, size: 30,),
          ),
          SizedBox( height: 10,),
          Text(text, style: TextStyle(color: Colors.grey),)
          
        ],
      ),
    );
  }
}
