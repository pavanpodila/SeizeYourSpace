import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_job/Admin/Admin_page.dart';
import 'package:photo_job/applicant_details.dart';
import 'package:photo_job/camera/camera_store.dart';
import 'package:photo_job/camera/camera_widgets.dart';
import 'package:photo_job/details/application_complete.dart';
import 'package:photo_job/details/details_widgets.dart';
import 'package:photo_job/home/home_widget.dart';
import 'package:photo_job/jobs/job_categories_widget.dart';
import 'package:photo_job/jobs/job_list.dart';
import 'package:photo_job/jobs/jobs_widgets.dart';
import 'package:provider/provider.dart';

final cameraStore = CameraStore();
final jobsStore = JobList();
final applicantDetails = ApplicantDetails();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<ApplicantDetails>(value: applicantDetails),
          Provider<JobList>(value: jobsStore),
          Provider<CameraStore>(value: cameraStore)
        ],
        child: CupertinoApp(
          debugShowCheckedModeBanner: false,
          title: 'Photo Job',
          routes: {
            '/': (_) => AdminPage(),
            '/home': (_) => HomePage(),
            '/jobCategory': (_) => JobCategoryPage(),
            '/jobs': (_) => JobsPage(
                  onSelected: (context) {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (_) => TakePhotoPage(
                              store: cameraStore,
                              onEscape: (context) => Navigator.popUntil(
                                  context, ModalRoute.withName('/')),
                              onCancel: (context) => Navigator.pop(context),
                              onAccept: (context) => Navigator.popAndPushNamed(
                                  context, '/details'),
                            ),
                        fullscreenDialog: true));
                  },
                ),
            '/details': (_) => DetailsPage(),
            '/complete': (_) => ApplicationCompletePage(),
          },
          initialRoute: '/home',
        ));
  }
}
