import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_job/camera/camera_store.dart';
import 'package:photo_job/details/details_widgets.dart';
import 'package:photo_job/jobs/job_list.dart';
import 'package:photo_job/jobs/jobs_widgets.dart';
import 'package:photo_job/home/home_widget.dart';
import 'package:provider/provider.dart';
import 'package:photo_job/jobs/job_categories_widget.dart';
import 'package:photo_job/applicant_details.dart';

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
          Provider<Function>(value: applicantDetails.setNamePhoneAndEmailValue)
        ],
      child: CupertinoApp(
        debugShowCheckedModeBanner: false,
        title: 'Photo Job',
        routes: {
          '/': (_) => HomePage(),
          '/jobCategory': (_) => JobCategoryPage(),
          '/jobs': (_) => JobsPage(),
          '/details': (_) => DetailsPage()

        },
        initialRoute: '/',
      )
    );
  }
}
