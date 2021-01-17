import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  final String title;
  final String content;
  TaskCardWidget({this.title, this.content});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 32,
          horizontal: 24,
        ),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? "(Unamed Task)",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            Padding(padding: EdgeInsets.only(top: 15)),
            Text(
              content ?? "Blank Text",
              style: TextStyle(
                fontSize: 16.0,
                height: 1.5,
                color: Color(0xFF86829D),
              ),
            )
          ],
        ));
  }
}
