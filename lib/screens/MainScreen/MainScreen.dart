import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/screens/JobScreen.dart';
import 'package:todolist/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:todolist/themes/fonts.dart';
import 'package:todolist/themes/metrics.dart';
import 'package:flutter/foundation.dart';

class MainScreen extends StatefulWidget {
  @override
  MainScreen_State createState() => MainScreen_State();
}

class MainScreen_State extends State<MainScreen> {
  String message = "";
  final myController = TextEditingController();
  @override
  void initState() {
    message = "";
    myController.addListener(_printLatestValue);
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController.dispose();
    super.dispose();
  }

  Future<void> onClickChat() {
    print("$message");
  }

  _printLatestValue() {
    setState(() {
      message = myController.text;
    });
  }

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
                  ],
                )),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 60,
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black54,
                      blurRadius: 15.0,
                      offset: Offset(0.0, 10))
                ], borderRadius: BorderRadius.circular(15), color: appPrimary),
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      flex: 5,
                      child: Column(
                        children: <Widget>[
                          new TextField(
                            // onChanged: (value) {
                            //   print(value);
                            //   // setState(() {
                            //   //   message = value;
                            //   // });
                            // },
                            controller: myController,
                            decoration: InputDecoration(
                              hintText: "Type message...",
                              hintStyle: TextStyle(color: appWhite),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              fontSize: fontSizeRegular,
                              fontWeight: FontWeight.normal,
                              color: appWhite,
                            ),
                          ),
                        ],
                      ),
                    ),
                    new Expanded(
                      flex: 1,
                      child: Align(
                        // alignment: Alignment.topRight,
                        child: TextButton(
                            child: Image(
                              image: AssetImage('assets/images/ic-send.png'),
                            ),
                            onPressed: () {
                              onClickChat();
                            },
                            style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
