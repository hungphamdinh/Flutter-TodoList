import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/screens/JobScreen.dart';
import 'package:todolist/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:todolist/themes/fonts.dart';
import 'package:todolist/themes/metrics.dart';

class MainScreen extends StatefulWidget {
  @override
  MainScreen_State createState() => MainScreen_State();
}

class MainScreen_State extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appPrimary,
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
                Expanded(
                    child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "SomeOne",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: fontSizeLarge,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Halo",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: fontSizeLarge,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: metricsSmall,
                      ),
                      child: Text(
                        "TODAY AT 10:45 AM",
                        style: TextStyle(
                            color: appLightGray,
                            fontSize: fontSizeRegular,
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
