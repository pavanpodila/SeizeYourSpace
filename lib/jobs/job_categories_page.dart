import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_job/core/app_page_view.dart';
import 'package:photo_job/core/circular_button.dart';
import 'package:photo_job/core/theme.dart';
import 'package:photo_job/home/main_store.dart';
import 'package:provider/provider.dart';

class JobCategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainStore = Provider.of<MainStore>(context);
    final jobStore = mainStore.jobStore;

    return AppPageView(
        child: Column(
      children: <Widget>[
        PSBanner(),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Text(
              "Select the category to apply",
              textAlign: TextAlign.center,
              style: theme.headingTextStyle,
            )),
        new Expanded(
            child: GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20.0),
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                crossAxisCount: 3,
                children: jobStore.jobCategories
                    .map((jobCategory) => Hero(
                        tag: jobCategory,
                        transitionOnUserGestures: true,
                        child: CircularButton(
                            text: jobCategory,
                            onPressed: () {
                              mainStore.setJobCategory(jobCategory, context);
                            })))
                    .toList())),
      ],
    ));
  }
}
