
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/models/job.dart';
import 'package:todolist/screens/PersonalInfo/components/Dropdown.dart';
import 'package:todolist/screens/JobScreen.dart';
import 'package:todolist/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:todolist/themes/fonts.dart';
import 'package:todolist/themes/metrics.dart';

import 'components/CustomAlertDialog.dart';

class PersonalInfoScreen extends StatefulWidget {
  final Job job;

  const PersonalInfoScreen({Key key, this.job}) : super(key: key);

  @override
  PersonalInfoScreen_State createState() => PersonalInfoScreen_State();
}

class PersonalInfoScreen_State extends State<PersonalInfoScreen> {
  List<Job> _taskMap;
  int id = 0;
  String name = "";
  bool isDone = false;
  int dropdownIdx = 0;
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

  Dialog customDialog = Dialog(
    backgroundColor: appPrimary, // your color
    shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(80)), // change 40 to your desired radius
    child: CustomAlertDialog(),
  );

  Future<void> _handleClickMe() async {
    return showDialog(
      barrierDismissible:
          true,
      context: context,
      builder: (context) {
        return customDialog;
      },
    );
  }

  Widget build(BuildContext context) {
    // new Future.delayed(const Duration(seconds: 3), () {
    //   Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) => HomePage()));
    // });
    double width = MediaQuery.of(context).size.width;

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
                        // child: Text(
                        //   "What' s your job ?",
                        //   style: TextStyle(
                        //     color: appWhite,
                        //     fontSize: fontSizeLarge,
                        //   ),
                        // ),
                      ),
                    ],
                  )),
                ),
                Dropdown(
                  title: 'Work Time',
                  listDropdown: ['One', 'Two', 'Three'],
                  value: 'One',
                ),
                Dropdown(
                  title: 'Country',
                  listDropdown: ['One', 'Two', 'Three'],
                  value: 'One',
                ),
                Dropdown(
                  title: 'Gender',
                  listDropdown: ['One', 'Two', 'Three'],
                  value: 'One',
                ),
                Dropdown(
                  title: 'City',
                  listDropdown: ['One', 'Two', 'Three'],
                  value: 'One',
                ),
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
                    _handleClickMe();
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
