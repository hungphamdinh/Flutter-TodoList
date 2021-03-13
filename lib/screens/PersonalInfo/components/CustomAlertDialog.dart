import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/themes/color.dart';
import 'package:todolist/themes/fonts.dart';
import 'package:todolist/themes/metrics.dart';

class CustomAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: appPrimary,
      height: 300,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
            0.1,
            0.9
          ], colors: [
            appLightGray.withOpacity(.8),
            appLightGray.withOpacity(.1)
          ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: metricsVeryHuge),
              child: Center(
                child: Image(
                  image: AssetImage('assets/images/ic-flower.png'),
                ),
              ),
            ),
            Container(
              child: Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Find someone !!!',
                    style: TextStyle(
                        color: appWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: fontSizeLarge),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: metricsVeryHuge + 50),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Wait',
                    style:
                        TextStyle(color: appLightGray, fontSize: fontSizeLarge),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
