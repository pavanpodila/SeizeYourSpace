import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_job/core/app_page_view.dart';
import 'package:photo_job/core/theme.dart';
import 'package:photo_job/home/main_store.dart';
import 'package:provider/provider.dart';

class ApplicationCompletePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainStore = Provider.of<MainStore>(context);

    return AppPageView(
      backgroundColor: theme.radiantRed,
      child: Column(
        children: <Widget>[
          PSBanner(),
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 30, right: 30),
            child: Text(
              "We have received your application!\nYou will hear from us soon.",
              style: theme.headingTextStyle.apply(color: Colors.white),
            ),
          ),
          Expanded(
              child: Center(
            child: CupertinoButton(
                child: Icon(
                  CupertinoIcons.check_mark_circled_solid,
                  size: 200,
                  color: Colors.white,
                ),
                onPressed: () {
                  mainStore.endApplication(context);
                }),
          )),
          Text('publicis'),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              'sapient',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
