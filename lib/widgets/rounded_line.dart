import 'package:flutter/material.dart';

class RoundedLine extends StatelessWidget {
  final Color color;
  final double height;
  final double width;

  RoundedLine({this.color, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 6.0,
      width: width ?? null,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: color ?? Theme.of(context).primaryColor,
      ),
    );
  }
}
