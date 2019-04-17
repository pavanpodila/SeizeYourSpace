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
                  "Are you someone who\n"
                  "Fuses startup thinking and agile methods?\n"
                      "Transforms the norms?\n"
                  "Makes bold choices for clients and communities?\n"
                  "Never ceases to learn and grow?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                )
              ],
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 50), child: null),
            CircularButton(textContent: 'Yes, \n this is me!', onSelected: () {
              return Navigator.pushNamed(context, '/jobCategory');
            }),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 50), child: null),
            Column(
            children: <Widget>[
              Image.asset(
                'lib/assets/image1.png',
              ),
            ],
          ),
          ],
        ),
      ),
    );
  }
}