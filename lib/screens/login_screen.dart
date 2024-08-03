import 'package:flutter/material.dart';
import 'package:video_conferencing_app/resources/auth_methods.dart';
import 'package:video_conferencing_app/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'start or join a meeting',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          //image
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 38, ),
            child: Center(child: Image.asset('assets/images/onboarding.jpg')),
          ),
          CustomButton(text: 'Google Signin', onPressed: () async{
            bool res = await _authMethods.signinwithgoogle(context);
            if (res){
              Navigator.pushNamed(context, '/home');
            }
          },)
        ],
      ),
    );
  }
}
