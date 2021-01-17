import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/screens/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  HomePage_State createState() => HomePage_State();
}

class HomePage_State extends State<HomePage> {
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
                        TaskCardWidget(
                          title: "Get Started",
                          content:
                              "As we know, webpages get crawled and indexed in the search engine. There is something that we can do to make this process easy-going, optimize the websites for search engine search.",
                        )
                      ]),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color(0xFF7349FE),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image(image: AssetImage('assets/images/add_icon.png'),),
                    ),
                  )
                ],
              ))),
    );
  }
}
