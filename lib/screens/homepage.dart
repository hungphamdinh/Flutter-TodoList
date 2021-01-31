import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/database_helper.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/screens/taskpage.dart';
import 'package:todolist/components/widgets.dart';
import 'package:todolist/themes/color.dart';

class HomePage extends StatefulWidget {
  @override
  HomePage_State createState() => HomePage_State();
}

class HomePage_State extends State<HomePage> {
  DatabaseHelper _dbHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 32,
              ),
              color: Color(0xFFF6F6F6),
              child: Stack(
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            bottom: 30,
                          ),
                          child: Image(
                            image: AssetImage('assets/images/logo.png'),
                          ),
                        ),
                        Expanded(
                            child: ScrollConfiguration(
                                behavior: NoGlowBehaviour(),
                                child: FutureBuilder(
                                    initialData: [],
                                    future: _dbHelper.getTasks(),
                                    builder: (context, snapshot) {
                                      return ListView.builder(
                                        itemCount: snapshot.data.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Taskpage(
                                                            task: snapshot
                                                                .data[index],
                                                          )),
                                                ).then(
                                                  (value) {
                                                    setState(() {});
                                                  },
                                                );
                                              },
                                              child: TaskCardWidget(
                                                title:
                                                    snapshot.data[index].title,
                                                description: snapshot.data[index].description,
                                              ));
                                        },
                                      );
                                    })))
                      ]),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Taskpage(
                                      task: null,
                                    )),
                          ).then((value) => {setState(() {})});
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [appPrimary, appLightPurple],
                                begin: Alignment(0.0, -1.0),
                                end: Alignment(0.0, 1.0)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image(
                            image: AssetImage('assets/images/add_icon.png'),
                          ),
                        ),
                      ))
                ],
              ))),
    );
  }
}
