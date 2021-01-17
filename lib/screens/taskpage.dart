import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 24,
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Image(
                      image: AssetImage('assets/images/back_arrow_icon.png'),
                    ),
                  ),
                ),
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter task title",
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF211551),
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    )));
  }
}
