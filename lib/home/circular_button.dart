import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class CircularButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          Navigator.pushNamed(context, '/jobs');
          final Map parsed = json.decode(await rootBundle.loadString('lib/assets/jobs.json'));
          print(parsed["jobs"][1]);
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
              color: Colors.redAccent,
            ),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: null),
              Text(
                "Yes",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                "Why Not!",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
        ));
  }
}