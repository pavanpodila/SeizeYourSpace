import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_job/admin/admin_page.dart';
import 'package:photo_job/core/app_page_view.dart';
import 'package:photo_job/core/circular_button.dart';
import 'package:photo_job/core/one_of_us_widget.dart';
import 'package:photo_job/core/theme.dart';
import 'package:photo_job/home/main_store.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainStore = Provider.of<MainStore>(context);

    return AppPageView(
      backgroundColor: theme.radiantRed,
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onLongPress: () {
                mainStore.loadApplicants();
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (_) => AdminPage(), fullscreenDialog: true));
              },
              child: Text('publicis',
                  style: TextStyle(color: Colors.black, fontSize: 30)),
            ),
            Text('sapient',
                style: TextStyle(color: Colors.white, fontSize: 30)),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: AreYouOneOfUsText()),
            CircularButton(
                borderColor: Colors.white,
                color: Colors.black,
                textColor: Colors.white,
                text: 'Yes, \n this is me!',
                onPressed: () {
                  mainStore.beginApplication(context);
                }),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 20), child: null),
            PSBanner(),
          ],
        ),
      ),
    );
  }
}
