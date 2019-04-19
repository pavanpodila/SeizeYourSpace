import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_job/Admin/admin_page.dart';
import 'package:photo_job/camera/take_photo_page.dart';
import 'package:photo_job/details/application_complete_page.dart';
import 'package:photo_job/details/details_widgets.dart';
import 'package:photo_job/home/app_route.dart';
import 'package:photo_job/home/home_page.dart';
import 'package:photo_job/home/main_store.dart';
import 'package:photo_job/jobs/job_categories_page.dart';
import 'package:photo_job/jobs/jobs_page.dart';
import 'package:provider/provider.dart';

final _mainStore = MainStore();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<MainStore>(value: _mainStore),
        ],
        child: CupertinoApp(
          debugShowCheckedModeBanner: false,
          title: 'Photo Job',
          routes: {
            AppRoute.admin: (_) => AdminPage(),
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
