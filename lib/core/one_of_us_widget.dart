import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_job/core/theme.dart';

class AreYouOneOfUsText extends StatefulWidget {
  @override
  _AreYouOneOfUsTextState createState() => _AreYouOneOfUsTextState();
}

class _AreYouOneOfUsTextState extends State<AreYouOneOfUsText>
    with SingleTickerProviderStateMixin {
  List<Animation<double>> _opacityAnimations;
  AnimationController _controller;

  List<String> _lines;

  @override
  void initState() {
    super.initState();

    _lines = [
      "Are you someone who fuses startup thinking and agile methods?",
      "Transforms the norms?",
      "Makes bold choices for clients and communities?",
      "Never ceases to learn and grow?",
    ];

    final r = Random();

    _controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    bool flag = r.nextBool();
    _opacityAnimations = _lines.map((_) {
      final begin = flag ? 1.0 : r.nextDouble() / 3;
      final end = flag ? r.nextDouble() / 3 : 1.0;

      flag = !flag;

      return Tween<double>(begin: begin, end: end).animate(_controller);
    }).toList(growable: false);

    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = _lines
        .asMap()
        .map((index, s) => MapEntry(
            index,
            Padding(
              child: FadeTransition(
                opacity: _opacityAnimations[index],
                child: Text(
                  s,
                  textAlign: TextAlign.right,
                  style: theme.bodyTextStyle
                      .apply(color: Colors.white, fontSizeDelta: 2),
                ),
              ),
              padding: EdgeInsets.only(bottom: 20),
            )))
        .values
        .toList(growable: false);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: widgets,
        crossAxisAlignment: CrossAxisAlignment.end,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
