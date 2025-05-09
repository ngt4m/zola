import 'dart:async';
import 'package:flutter/material.dart';
import 'package:what_chat/app/theme/theme.dart';
import 'package:what_chat/app/welcome_page/welcome_page.dart';

class SlashScreen extends StatefulWidget {
  const SlashScreen({Key? key}) : super(key: key);

  @override
  _SlashScreenState createState() => _SlashScreenState();
}

class _SlashScreenState extends State<SlashScreen> {
  @override
  void initSate() {
    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => WelcomePage(),
            ),
            (route) => false);
      }
    });
       super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
            child: Image.asset(
              "assets/logo.png",
              color: whiteColor,
              width: 300,
              height: 300,
            ),
          ),
     
      );
    
  }
}
