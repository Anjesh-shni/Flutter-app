import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;

  BigText({
    Key? key,
    this.color = const Color(0xff332d2b),
    this.size = 20,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.clip,
      maxLines: 1,
      style: TextStyle(
        fontFamily: "Roboto",
        fontSize: size,
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
