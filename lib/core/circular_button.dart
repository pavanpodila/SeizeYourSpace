import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class CircularButton extends StatelessWidget {

  CircularButton({@required this.textContent, @required this.onSelected});
  String textContent;
  final void Function() onSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          this.onSelected();
        },
        child: Container(
          width: 120,
          height: 120,
          decoration: new BoxDecoration(
            // Circle shape
            shape: BoxShape.circle,
            color: Colors.white,
            // The border you want
            border: new Border.all(
              width: 5.0,
              color: Colors.blueAccent,
            ),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: null),
              Text(
                '${this.textContent}',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              )
            ],
          ),
        ));
  }
}