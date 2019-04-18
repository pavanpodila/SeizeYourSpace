import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  CircularButton(
      {@required this.text,
      @required this.onPressed,
      this.color = Colors.white,
      this.textColor = Colors.black});
  String text;
  final Color color;
  final Color textColor;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        this.onPressed();
      },
      child: Container(
          width: 120,
          height: 120,
          decoration: new BoxDecoration(
            // Circle shape
            shape: BoxShape.circle,
            color: color,
            // The border you want
            border: new Border.all(
              width: 5.0,
              color: Colors.blueAccent,
            ),
          ),
          child: Center(
            child: Text(
              '${this.text}',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 15, color: textColor),
            ),
          )),
    );
  }
}
