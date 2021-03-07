import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/models/job.dart';
import 'package:todolist/themes/color.dart';
import 'package:todolist/themes/fonts.dart';
import 'package:todolist/themes/metrics.dart';
import 'dart:developer';

class DropdownWidget extends StatelessWidget {
  final Job job;
  final int index;
  DropdownWidget({Key key, this.job, this.index}): super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: metricsLarge,
              ),
              child: new Center(
                  child: (Text(
                job.name ?? "Blank Text",
                style: TextStyle(
                    fontSize: job.textFontSize,
                    color: job.isDone ? appWhite : (appLightGray)),
              ))),
            )
          ],
        ));
  }
}
