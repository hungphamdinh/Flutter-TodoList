import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/themes/color.dart';
class TaskCardWidget extends StatelessWidget {
  final String title;
  final String content;
  TaskCardWidget({this.title, this.content, description});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          bottom: 32,
        ),
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
                color: appLightPurple,
              ),
            )
          ],
        ));
  }
}

class TodoWidget extends StatelessWidget {
  final String text;
  final bool isDone;

  const TodoWidget({Key key, this.text, this.isDone}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 24,
      ),
      child: Row(
        children: [
          Container(
              width: 20,
              height: 20,
              margin: EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                  color: isDone ? (appPrimary) : (appWhite),
                  border: isDone ? null : Border.all(color: (appLightPurple), width: 1.5),
                  borderRadius: BorderRadius.circular(6)),
              child: Image(
                image: AssetImage('assets/images/check_icon.png'),
              )),
          Text(
            text ?? 'Unknow todo',
            style: TextStyle(
              color: isDone ? Colors.black : (appLightPurple),
              fontSize: 16,
              fontWeight: isDone ? FontWeight.bold : FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}

class NoGlowBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context, Widget child, AxisDirection axisDirection
  ) {
    return child;
  }
}