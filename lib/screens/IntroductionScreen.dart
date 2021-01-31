import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/screens/JobScreen.dart';
import 'package:todolist/screens/homepage.dart';
import 'package:todolist/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:todolist/themes/fonts.dart';
import 'package:todolist/themes/metrics.dart';
import 'package:todolist/components/widgets.dart';

import '../database_helper.dart';

class IntroductionScreen extends StatefulWidget {
  @override
  IntroductionScreen_State createState() => IntroductionScreen_State();
}

class IntroductionScreen_State extends State<IntroductionScreen> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SafeArea(
          child: Container(
        color: appPrimary,
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 32,
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 100,
                  ),
                  child: new Center(
                      child: Column(
                    children: [
                      Text(
                        "Nice to see you !",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSizeHuge,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: metricsSmall,
                        ),
                        child: Text(
                          "Are you new ?",
                          style: TextStyle(
                              color: appLightGray,
                              fontSize: fontSizeLarge,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: metricsH5,
                        ),
                        child: Image(
                          image: AssetImage('assets/images/ic-coffee.png'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: metricsHuge,
                        ),
                        child: Text(
                          "Do you want a little coffee ?",
                          style: TextStyle(
                            color: appLightGray,
                            fontSize: fontSizeLarge,
                          ),
                        ),
                      ),
                    ],
                  )),
                ),
               
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: (TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => JobScreen()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "Let's go",
                        style: TextStyle(
                            fontSize: fontSizeLarge,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF6F6F6)),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: metricsSmall,
                        ),
                        child: Image(
                          image:
                              AssetImage('assets/images/ic-chevron-right.png'),
                        ),
                      ),
                    ],
                  ))),
            ),
          ],
        ),
      )),
    );
  }
}
