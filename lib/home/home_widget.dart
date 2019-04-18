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
                padding: const EdgeInsets.symmetric(vertical: 70),
                child: AreYouOneOfUsText()),
            CircularButton(
                color: Colors.blueAccent,
                textColor: Colors.white,
                text: 'Yes, \n this is me!',
                onPressed: () {
                  return Navigator.pushNamed(context, '/jobCategory');
                }),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 50), child: null),
            Image.asset(
              'lib/assets/image1.png',
            ),
          ],
        ),
      ),
    );
  }
}

class AreYouOneOfUsText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final spans = [
      "Are you someone who fuses startup thinking and agile methods?",
      "Transforms the norms?",
      "Makes bold choices for clients and communities?",
      "Never ceases to learn and grow?",
    ]
        .map((s) => Padding(
              child: Text(
                s,
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 16),
              ),
              padding: EdgeInsets.only(bottom: 8),
            ))
        .toList(growable: false);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: spans,
        crossAxisAlignment: CrossAxisAlignment.end,
      ),
    );
  }
}
