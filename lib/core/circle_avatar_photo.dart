import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PSCircleAvatar extends StatelessWidget {
  PSCircleAvatar(
      {@required this.child,
      this.color = Colors.redAccent,
      this.backgroundColor = Colors.white,
      this.borderWidth = 10});

  final double borderWidth;

  final Color color;
  final Color backgroundColor;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipPath(
        clipper: ShapeBorderClipper(shape: CircleBorder()),
        child: child,
      ),
      decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(width: borderWidth, color: color),
          shape: BoxShape.circle),
    );
  }
}
