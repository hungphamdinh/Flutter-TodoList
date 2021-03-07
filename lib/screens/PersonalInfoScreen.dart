import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/components/dropdown.dart';
import 'package:todolist/components/widgets.dart';
import 'package:todolist/models/job.dart';
import 'package:todolist/screens/JobScreen.dart';
import 'package:todolist/screens/homepage.dart';
import 'package:todolist/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:todolist/themes/fonts.dart';
import 'package:todolist/themes/metrics.dart';

import '../database_helper.dart';

class PersonalInfoScreen extends StatefulWidget {
  final Job job;

  const PersonalInfoScreen({Key key, this.job}) : super(key: key);

  @override
  PersonalInfoScreen_State createState() => PersonalInfoScreen_State();
}

List<Map<String, dynamic>> taskMap = [
  {
    "id": 0,
    "name": "Developer",
    "isDone": false,
    "textFontSize": fontSizeLarge
  },
  {
    "id": 1,
    "name": "UI/UX Designer",
    "isDone": false,
    "textFontSize": fontSizeLarge
  },
  {"id": 2, "name": "Engineer", "isDone": false, "textFontSize": fontSizeLarge},
  {
    "id": 4,
    "name": "Architecture",
    "isDone": false,
    "textFontSize": fontSizeLarge
  },
  {
    "id": 5,
    "name": "Fashionita",
    "isDone": false,
    "textFontSize": fontSizeLarge
  },
  {"id": 6, "name": "Doctor", "isDone": false, "textFontSize": fontSizeLarge},
  {"id": 7, "name": "Shipper", "isDone": false, "textFontSize": fontSizeLarge},
  {"id": 8, "name": "Other", "isDone": false, "textFontSize": fontSizeLarge},
];

class PersonalInfoScreen_State extends State<PersonalInfoScreen> {
  List<Job> _taskMap;
  int id = 0;
  String name = "";
  bool isDone = false;
  int dropdownIdx = 0;
  String _value = 'one';
  String dropdownValue = 'One';
  double textFontSize = fontSizeLarge;
  @override
  void initState() {
    if (widget.job != null) {
      id = widget.job.id;
      name = widget.job.name;
      isDone = widget.job.isDone;
      textFontSize = widget.job.textFontSize;
    }
    _taskMap = List.generate(taskMap.length, (index) {
      return Job(
        id: taskMap[index]['id'],
        name: taskMap[index]['name'],
        isDone: taskMap[index]['isDone'],
        textFontSize: taskMap[index]['textFontSize'],
      );
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    // new Future.delayed(const Duration(seconds: 3), () {
    //   Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) => HomePage()));
    // });

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
                        "Please help us to know something about yourself",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSizeHuge,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: metricsLarge,
                          bottom: metricsVeryHuge,
                        ),
                        child: Text(
                          "What' s your job ?",
                          style: TextStyle(
                            color: appWhite,
                            fontSize: fontSizeLarge,
                          ),
                        ),
                      ),
                    ],
                  )),
                ),
                Container(
                  child: new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      DropdownButton<String>(
                        value: dropdownValue,
                        iconSize: 24,
                        iconEnabledColor: Colors.white,
                        elevation: 16,
                        style: TextStyle(color: Colors.white, backgroundColor: appLightPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>['One', 'Two', 'Free', 'Four']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                Container(
                    child: Row(children: [
                  Text(
                    "Work time",
                    style: TextStyle(
                      color: appWhite,
                      fontSize: fontSizeLarge,
                    ),
                  ),
                  new DropdownButton<String>(
                    iconEnabledColor: Colors.white,
                    items: <String>['A', 'B', 'C', 'D'].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  )
                ])),
                dropdownIdx == _taskMap.length - 1
                    ? Container(
                        width: 150,
                        margin: EdgeInsets.only(top: metricsHuge),
                        color: appWhite,
                        child: TextField(
                          textAlign: TextAlign.center,
                          onSubmitted: (value) {
                            // Check if the field is not empty
                          },
                          controller: TextEditingController()..text = '',
                          decoration: InputDecoration(
                            hintText: "Your job",
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: fontSizeLarge,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF211551),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: (TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          right: metricsSmall,
                        ),
                        child: Image(
                          image:
                              AssetImage('assets/images/ic-chevron-left.png'),
                        ),
                      ),
                      const Text(
                        "Back",
                        style: TextStyle(
                            fontSize: fontSizeLarge,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF6F6F6)),
                      ),
                    ],
                  ))),
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
                        "Next",
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
