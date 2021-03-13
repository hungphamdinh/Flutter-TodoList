import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/themes/color.dart';
import 'package:todolist/themes/fonts.dart';
import 'package:todolist/themes/metrics.dart';

class Dropdown extends StatefulWidget {
  final String value;
  final List<String> listDropdown;
  final String title;

  const Dropdown({Key key, this.value, this.listDropdown, this.title})
      : super(key: key);
  @override
  DropdownState createState() => DropdownState();
}

class DropdownState extends State<Dropdown> {
  String dropdownValue;
  List<String> listDrop;
  String tit;
  @override
  void initState() {
    if (widget.listDropdown.length > 0 &&
        widget.value != '' &&
        widget.title != '') {
      dropdownValue = widget.value;
      listDrop = widget.listDropdown;
      tit = widget.title;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: metricsHuge),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: width / 1.2,
                height: 13,
                child: Text(
                  tit,
                  style: TextStyle(
                      color: appLightGray, fontSize: fontSizeRegular - 1),
                ),
              ),
              Container(
                height: 40,
                width: width / 1.2,
                decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: appWhite, width: 1))),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  dropdownColor: appPrimary,
                  iconSize: 24,
                  iconEnabledColor: Colors.white,
                  elevation: 16,
                  isExpanded: true,
                  style: TextStyle(
                    color: appWhite,
                  ),
                  underline: Container(
                    height: 0,
                    color: Colors.white,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: listDrop.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
