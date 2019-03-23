import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_job/camera/camera_store.dart';
import 'package:photo_job/camera/camera_widgets.dart';
import 'package:photo_job/core/app_page_view.dart';
import 'package:photo_job/details/details_widgets.dart';
import 'package:photo_job/jobs/jobs_store.dart';
import 'package:photo_job/jobs/jobs_widgets.dart';

final cameraStore = CameraStore();
final jobsStore = JobsStore();
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Photo Job',
      routes: {
        '/': (_) => HomePage(),
        '/jobs': (_) => JobsPage(
              store: jobsStore,
              onSelected: (context) {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (_) => TakePhotoPage(
                          store: cameraStore,
                          onEscape: (context) => Navigator.popUntil(
                              context, ModalRoute.withName('/')),
                          onCancel: (context) => Navigator.pop(context),
                          onAccept: (context) =>
                              Navigator.popAndPushNamed(context, '/details'),
                        ),
                    fullscreenDialog: true));
              },
            ),
        '/details': (_) => DetailsPage()
      },
      initialRoute: '/',
    );
  }
}

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
              padding: const EdgeInsets.symmetric(vertical: 28.0),
              child: Text('Publicis Sapient',
                  style: TextStyle(color: Colors.redAccent, fontSize: 30)),
            ),
            Text(
              'Would you like to see the opportunities we have?',
              textAlign: TextAlign.center,
            ),
            Container(
              height: 150,
            ),
            CupertinoButton(
              child: Text('Yes, why not!'),
              onPressed: () => Navigator.pushNamed(context, '/jobs'),
            )
          ],
        ),
      ),
    );
  }
}
