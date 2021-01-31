import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/models/job.dart';
import 'package:todolist/themes/color.dart';
import 'package:todolist/themes/fonts.dart';
import 'package:todolist/themes/metrics.dart';

class DropdownWidget extends StatelessWidget {
  final Job job;
  DropdownWidget({this.job});

  @override
  Widget build(BuildContext context) {
    print(job.isDone);
    return Container(
        width: double.infinity,
        child: Column(
          children: [
            new Center(
                child: (TextButton(
              onPressed: () {},
              child: (Text(
                job.name ?? "Blank Text",
                style: TextStyle(
                    fontSize: fontSizeLarge,
                    color: job.isDone ? appWhite : (appLightGray)),
              )),
            ))),
          ],
        ));
  }
}
