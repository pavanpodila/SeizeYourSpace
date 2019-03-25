import 'package:flutter/cupertino.dart';
import 'package:photo_job/core/app_page_view.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppPageView(
        child: Column(
      children: <Widget>[
        Text('Details'),
        Column(
          children: <Widget>[
            Align(
              child: Text('Name'),
              alignment: Alignment.centerLeft,
            ),
            CupertinoTextField(),
          ],
        ),
        Column(
          children: <Widget>[
            Align(
              child: Text('Email'),
              alignment: Alignment.centerLeft,
            ),
            CupertinoTextField(),
          ],
        ),
        Column(
          children: <Widget>[
            Align(
              child: Text('Phone'),
              alignment: Alignment.centerLeft,
            ),
            CupertinoTextField(),
          ],
        ),
        CupertinoButton.filled(
          child: Text('Submit'),
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
        )
      ],
    ));
  }
}
