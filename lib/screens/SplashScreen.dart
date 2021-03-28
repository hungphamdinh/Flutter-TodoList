import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/screens/IntroductionScreen/IntroductionScreen.dart';
import 'package:todolist/themes/color.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreen_State createState() => SplashScreen_State();
}

class SplashScreen_State extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    new Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => IntroductionScreen()));
    });
    return Scaffold(
      body: Container(
          color: appPrimary,
          padding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 32,
          ),
          child: new Center(
            child: Image(
              image: AssetImage('assets/images/ic-hand.png'),
            ),
          )),
    );
  }
}
