import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/components/dropdown.dart';
import 'package:todolist/components/widgets.dart';
import 'package:todolist/models/job.dart';
import 'package:todolist/screens/PersonalInfo/PersonalInfoScreen.dart';
import 'package:todolist/screens/homepage.dart';
import 'package:todolist/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:todolist/themes/fonts.dart';
import 'package:todolist/themes/metrics.dart';

import '../database_helper.dart';

class JobScreen extends StatefulWidget {
  final Job job;

  const JobScreen({Key key, this.job}) : super(key: key);

  @override
  JobScreen_State createState() => JobScreen_State();
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

class JobScreen_State extends State<JobScreen> {
  List<Job> _taskMap;
  int id = 0;
  String name = "";
  bool isDone = false;
  int dropdownIdx = 0;
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

  Future<List<Job>> _onGetJob() async {
    return List.generate(_taskMap.length, (index) {
      return Job(
        id: _taskMap[index].id,
        name: _taskMap[index].name,
        isDone: _taskMap[index].isDone,
      );
    });
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
                    height: 200,
                    child: ScrollConfiguration(
                        behavior: NoGlowBehaviour(),
                        child: FutureBuilder(
                            initialData: [],
                            future: _onGetJob(),
                            builder: (context, snapshot) {
                              return ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _taskMap
                                              .asMap()
                                              .forEach((idx, value) => {
                                                    value.setIsDone(false),
                                                    if (idx == index)
                                                      {
                                                        value.setTextFontSize(
                                                            fontSizeHuge),
                                                      }
                                                    else
                                                      {
                                                        if (idx < index - 1 ||
                                                            idx > index + 1)
                                                          {
                                                            value.setTextFontSize(
                                                                fontSizeRegular)
                                                          }
                                                        else
                                                          {
                                                            value.setTextFontSize(
                                                                fontSizeLarge),
                                                          }
                                                      }
                                                  });

                                          _taskMap[index].setIsDone(true);
                                          dropdownIdx = index;
                                        });
                                      },
                                      child: DropdownWidget(
                                        job: _taskMap[index],
                                        index: index,
                                      ));
                                },
                              );
                            }))),
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
              alignment: Alignment.bottomRight,
              child: (TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => PersonalInfoScreen()));
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
