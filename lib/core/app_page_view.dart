import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppPageView extends StatelessWidget {
  AppPageView({@required this.child, this.backgroundColor = Colors.white});

  final Color backgroundColor;

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(child: child),
      backgroundColor: backgroundColor,
    );
  }
}
