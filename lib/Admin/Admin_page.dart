import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_job/applicant_details.dart';
import 'package:photo_job/core/app_page_view.dart';
import 'package:provider/provider.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final applicantDetails = Provider.of<ApplicantDetails>(context);
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
                    await applicantDetails.readApplicantDetails();
                    return Navigator.pushNamed(context, '/home');
                  },
                  color: Colors.blueAccent,
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
