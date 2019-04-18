import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_job/core/app_page_view.dart';
import 'package:photo_job/core/theme.dart';
import 'package:photo_job/home/main_store.dart';
import 'package:provider/provider.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final applicant = Provider.of<MainStore>(context).applicant;

    return AppPageView(
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: RaisedButton(
                  onPressed: () async {
                    return Navigator.pushNamed(context, '/home');
                  },
                  color: theme.blue,
                  child: Text(
                    'Export as Text File',
                    style: TextStyle(fontSize: 16.9),
                  ),
                  textColor: Colors.white70,
                )),
            CupertinoButton(
              child: Text('Not Now'),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
            )
          ],
        ),
      ),
    );
  }
}
