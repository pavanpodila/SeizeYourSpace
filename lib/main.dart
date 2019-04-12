import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_job/camera/camera_store.dart';
import 'package:photo_job/camera/camera_widgets.dart';
import 'package:photo_job/details/details_widgets.dart';
import 'package:photo_job/jobs/job_list.dart';
import 'package:photo_job/jobs/jobs_widgets.dart';
import 'package:photo_job/home/home_widget.dart';

final cameraStore = CameraStore();
//final jobsStore = JobsStore();

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
//              store: jobsStore,
//              onSelected: (context) {
//                Navigator.of(context).push(CupertinoPageRoute(
//                    builder: (_) => TakePhotoPage(
//                          store: cameraStore,
//                          onEscape: (context) => Navigator.popUntil(
//                              context, ModalRoute.withName('/')),
//                          onCancel: (context) => Navigator.pop(context),
//                          onAccept: (context) =>
//                              Navigator.popAndPushNamed(context, '/details'),
//                        ),
//                    fullscreenDialog: true));
//              },
            ),
        '/details': (_) => DetailsPage()
      },
      initialRoute: '/',
    );
  }
}
