import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/database_helper.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/models/todo.dart';
import 'package:todolist/widgets.dart';
import 'package:todolist/themes/color.dart';

class Taskpage extends StatefulWidget {
  final Task task;
  Taskpage({@required this.task});

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<Taskpage> {
  DatabaseHelper _dbHelper = DatabaseHelper();
  int _taskId = 0;
  String _taskDescription = "";
  String _taskTitle = "";

  FocusNode _titleFocus;
  FocusNode _descriptionFocus;
  FocusNode _todoFocus;
  bool _contentVisble = false;
  @override
  void initState() {
    if (widget.task != null) {
      _contentVisble = true;
      _taskTitle = widget.task.title;
      _taskDescription = widget.task.description;
      _taskId = widget.task.id;
    }
    _titleFocus = FocusNode();
    _descriptionFocus = FocusNode();
    _todoFocus = FocusNode();
    super.initState();
  }
  @override
  void dispose() {
    _titleFocus.dispose();
    _descriptionFocus.dispose();
    _todoFocus.dispose();
    super.dispose();
  }

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
                    focusNode: _titleFocus,
                    onSubmitted: (value) async {
                      if (value != "") {
                        if (widget.task == null) {
                          Task _newTask = Task(title: value);
                          _taskId = await _dbHelper.insertTask(_newTask);
                          setState(() {
                            _contentVisble = true;
                            _taskTitle = value;
                          });
                        } else {
                          await _dbHelper.updateTaskTitle(_taskId, value);
                        }

                        _descriptionFocus.requestFocus();
                      }
                    },
                    controller: TextEditingController()..text = _taskTitle,
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
            Visibility(
              visible: _contentVisble,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: TextField(
                  focusNode: _descriptionFocus,
                  onSubmitted: (value) async {
                    if (value != "") {
                      if (_taskId != 0) {
                        await _dbHelper.updateTaskDescription(_taskId, value);
                        _taskDescription = value;
                      }
                    }
                    _todoFocus.requestFocus();
                  },
                  controller: TextEditingController()..text = _taskDescription,
                  decoration: InputDecoration(
                    hintText: 'Enter Description for the task...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 24.0),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _contentVisble,
              child: FutureBuilder(
                initialData: [],
                future: _dbHelper.getTodo(_taskId),
                builder: (context, snapshot) {
                  return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () async {
                                if (snapshot.data[index].isDone == 0) {
                                  await _dbHelper.updateTodoDone(
                                      snapshot.data[index].id, 1);
                                } else {
                                  await _dbHelper.updateTodoDone(
                                      snapshot.data[index].id, 0);
                                }
                                setState(() {});
                              },
                              child: TodoWidget(
                                isDone: snapshot.data[index].isDone == 0
                                    ? false
                                    : true,
                                text: snapshot.data[index].title,
                              ),
                            );
                          }));
                },
              ),
            ),
            Visibility(
                visible: _contentVisble,
                child: (Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Row(children: [
                    Container(
                        width: 20,
                        height: 20,
                        margin: EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                            color: (appWhite),
                            border:
                                Border.all(color: (appLightPurple), width: 1.5),
                            borderRadius: BorderRadius.circular(6)),
                        child: Image(
                          image: AssetImage('assets/images/check_icon.png'),
                        )),
                    Expanded(
                        child: TextField(
                      focusNode: _todoFocus,
                      controller: TextEditingController()..text = "",
                      onSubmitted: (value) async {
                        if (value != "") {
                          print(widget.task);
                          if (widget.task != null) {
                            DatabaseHelper _dbHelper = DatabaseHelper();
                            Todo _newTdodo = Todo(
                                title: value,
                                isDone: 0,
                                taskId: _taskId);
                            await _dbHelper.insertTodo(_newTdodo);
                            setState(() {});
                            _todoFocus.requestFocus();
                          } else {
                            print("Task doesn't exist");
                          }
                        }
                      },
                      decoration: InputDecoration(
                          hintText: "Enter to do item...",
                          border: InputBorder.none),
                    )),
                  ]),
                )))
          ],
        ),
        Visibility(
            visible: _contentVisble,
            child: Positioned(
                bottom: 24,
                right: 24,
                child: GestureDetector(
                  onTap: () async {
                    if (_taskId != 0) {
                      await _dbHelper.deleteTask(_taskId);
                      Navigator.pop(context);
                    }
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
                )))
      ],
    ))));
  }
}
