import 'dart:ui';
import 'package:flutter/material.dart';
class Custom_Text extends StatelessWidget {
  String txt;
  Color color;
  FontWeight weight;
  double size;
  Custom_Text({super.key,required this.txt,required this.size,required this.weight,required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
          color: color,
          fontWeight: weight,
          fontSize: size),
    );
  }
}
