import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/components/dropdown.dart';
import 'package:todolist/components/widgets.dart';
import 'package:todolist/models/job.dart';
import 'package:todolist/screens/homepage.dart';
import 'package:todolist/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:todolist/themes/fonts.dart';
import 'package:todolist/themes/metrics.dart';

import '../database_helper.dart';

class JobScreen extends StatefulWidget {
  @override
  JobScreen_State createState() => JobScreen_State();
}

Future<List<Job>> _onGetJob() async {
  List<Map<String, dynamic>> taskMap = [
    {"id": 0, "name": "Developer", "isDone": false},
    {"id": 1, "name": "UI/UX Designer", "isDone": false},
    {"id": 2, "name": "Engineer", "isDone": false},
    {"id": 4, "name": "Architecture", "isDone": false},
    {"id": 5, "name": "Fashionita", "isDone": false},
    {"id": 6, "name": "Doctor", "isDone": false},
    {"id": 7, "name": "Shipper", "isDone": false},
  ];
  return List.generate(taskMap.length, (index) {
    return Job(
      id: taskMap[index]['id'],
      name: taskMap[index]['name'],
      isDone: taskMap[index]['isDone'],
    );
  });
}

class JobScreen_State extends State<JobScreen> {
  @override
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
                    child:
                    ScrollConfiguration(
                        behavior: NoGlowBehaviour(),
                        child: FutureBuilder(
                            initialData: [],
                            future: _onGetJob(),
                            builder: (context, snapshot) {
                              return 
                              ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                      onTap: () {
                                        snapshot.data[index].isDone = true;
                                        setState(() {
                                        });
                                      },
                                      child: DropdownWidget(
                                        job: snapshot.data[index],
                                      ));
                                },
                              );
                            })))
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
