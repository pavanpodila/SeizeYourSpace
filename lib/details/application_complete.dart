import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_job/core/app_page_view.dart';

class ApplicationCompletePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppPageView(
      child: Column(
        children: <Widget>[
          Image.asset(
            'lib/assets/image1.png',
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 30, right: 30),
            child: Text(
              "We have received your application!\nYou will hear from us soon.",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
              child: Center(
            child: CupertinoButton(
                child: Icon(
                  CupertinoIcons.check_mark_circled_solid,
                  size: 200,
                  color: Colors.blueAccent,
                ),
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/home'));
                }),
          ))
        ],
      ),
    );
  }
}
