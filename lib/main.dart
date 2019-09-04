import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_job/camera/take_photo_page.dart';
import 'package:photo_job/details/application_complete_page.dart';
import 'package:photo_job/details/details_widgets.dart';
import 'package:photo_job/home/app_route.dart';
import 'package:photo_job/home/home_page.dart';
import 'package:photo_job/home/main_store.dart';
import 'package:photo_job/jobs/job_categories_page.dart';
import 'package:photo_job/jobs/jobs_page.dart';
import 'package:photo_job/sdk/applicant_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<ApplicantService>(
            builder: (_) => ApplicantService(),
          ),
          ProxyProvider<ApplicantService, MainStore>(
              builder: (_, service, __) => MainStore(service)),
        ],
        child: CupertinoApp(
          debugShowCheckedModeBanner: false,
          title: 'Seize Your Space',
          routes: {
            AppRoute.home: (_) => WillPopScope(
                onWillPop: () => Future.value(false), child: HomePage()),
            AppRoute.categories: (_) => JobCategoryPage(),
            AppRoute.jobs: (_) => JobsPage(
                  onSelected: (context) {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (_) => TakePhotoPage(
                              onAccept: (context) => Navigator.popAndPushNamed(
                                  context, AppRoute.details),
                            ),
                        fullscreenDialog: true));
                  },
                ),
            AppRoute.details: (_) => DetailsPage(),
            AppRoute.complete: (_) => ApplicationCompletePage(),
          },
          initialRoute: AppRoute.home,
        ));
  }
}
