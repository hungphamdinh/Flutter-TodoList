import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:todolist/screens/MainScreen/MainScreen.dart';
import 'package:todolist/themes/color.dart';
import 'package:todolist/themes/fonts.dart';
import 'package:todolist/themes/metrics.dart';

class CustomAlertDialog extends StatelessWidget {
  final spinkit = SpinKitFadingCircle(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.red : Colors.green,
        ),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    Future<void> _handleClickMe() async {
      return showDialog(
        barrierDismissible:
            true, // set false if you dont want the dialog to be dismissed when user taps anywhere [![enter image description here][1]][1]outside of the alert
        context: context,
        builder: (context) {
          return SpinKitPouringHourglass(color: Colors.white);
        },
      );
    }

    Future<void> _onSubmit() {
      _handleClickMe();
      Future.delayed(const Duration(milliseconds: 3000), () {
        // Here you can write your code
        Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => MainScreen(),
                    ),
                    ModalRoute.withName('/'));
      });
    }

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
                  onPressed: () {
                    _onSubmit();
                  },
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
