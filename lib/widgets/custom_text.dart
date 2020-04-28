import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText(this.text,
      {this.color = const Color(0XFF171D3E),
      this.family = "Source Sans Pro",
      this.size = 18.0,
      this.textAlign = TextAlign.left,
      this.weight = FontWeight.normal,
      this.height});

  final String text;

  final Color color;
  final String family;
  final double size;
  final TextAlign textAlign;
  final FontWeight weight;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        height: height,
        color: color,
        fontFamily: family,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}
