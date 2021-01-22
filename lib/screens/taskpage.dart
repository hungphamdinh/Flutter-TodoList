import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/database_helper.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/screens/widgets.dart';
import 'package:todolist/themes/color.dart';

class TaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                child: Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 24,
                bottom: 6,
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
                        onSubmitted: (value) async{
                          if(value != "") {
                            DatabaseHelper _dbHelper = DatabaseHelper();
                            Task _newTask = Task(title: value);
                            await _dbHelper.insertTask(_newTask);
                            print("New task has been insert");
                          }
                        },
                    decoration: InputDecoration(
                      hintText: "Enter task title",
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      color: appBlue,
                    ),
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter Description for the task...',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 24.0),
                ),
              ),
            ),
            TodoWidget(
              text: "Create your first task",
              isDone: true,
            ),
            TodoWidget(
              text: "Create your first todo as well",
              isDone: false,
            ),
            TodoWidget(isDone: false)
          ],
        ),
        Positioned(
                      bottom: 24,
                      right: 24,
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => TaskPage()),
                          // );
                          print("object");
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: appPink,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image(
                            image: AssetImage('assets/images/delete_icon.png'),
                          ),
                        ),
                      ))
      ],
    ))));
  }
}
