import 'package:flutter/material.dart';
import 'package:portfolio/widgets/custom_text.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      width: double.infinity,
      color: Color(0xFF171B36),
      child: Container(
          margin: EdgeInsets.only(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CustomText(
                "BADGERJACK 2020",
                family: "Crillee Italic Std",
                size: 24,
                color: Color(0xFF3C415D),
              ),
            ],
          )),
    );
  }
}
