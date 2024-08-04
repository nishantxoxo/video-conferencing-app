import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:video_conferencing_app/firebase_options.dart';
import 'package:video_conferencing_app/resources/auth_methods.dart';
import 'package:video_conferencing_app/screens/home_screen.dart';
import 'package:video_conferencing_app/screens/login_screen.dart';
import 'package:video_conferencing_app/screens/video_call_screen.dart';
import 'package:video_conferencing_app/utils/colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'zoom clone',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      home: StreamBuilder(stream: AuthMethods().Authchanged, builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(),);
        }
        if(snapshot.hasData){
          return HomeScreen();
        }
        return LoginScreen();
      },) ,
      routes: {'/login' : (context) => LoginScreen(), '/home' : (context) => HomeScreen(),  '/video-call': (context) => VideoCallScreen()} ,
    );
  }
}
 