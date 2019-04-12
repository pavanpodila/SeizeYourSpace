import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_job/core/app_page_view.dart';
import 'package:photo_job/core/circular_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppPageView(
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: Text('publicis',
                  style: TextStyle(color: Colors.black, fontSize: 30)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: Text('sapient',
                  style: TextStyle(color: Colors.redAccent, fontSize: 30)),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 50), child: null),
            Column(
              children: <Widget>[
                Text(
                  "Would you like to see the",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  "opportunities we have?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 50), child: null),
            CircularButton(textContent: 'Yes \r Why not?', onSelected: () {
              print('onSelected');
              return Navigator.pushNamed(context, '/jobCategory');
            }),
          ],
        ),
      ),
    );
  }
}