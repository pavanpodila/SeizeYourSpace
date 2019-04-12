import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_job/core/app_page_view.dart';
import 'package:photo_job/core/circular_button.dart';
import 'package:provider/provider.dart';
import 'package:photo_job/jobs/job_list.dart';

class JobCategoryPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final jobCategories = Provider
        .of<JobList>(context)
        .jobCategories;
    final setJobCategory = Provider
        .of<JobList>(context).setJobCategory;
    return AppPageView(
        child: GridView.count(
            primary: true,
            padding: const EdgeInsets.all(20.0),
            crossAxisSpacing: 10.0,
            crossAxisCount: 2,
            children: jobCategories.map((jobCategory) =>
              CircularButton(textContent: '${jobCategory}', onSelected: () {
                print('onSelected');
                setJobCategory(jobCategory);
                return Navigator.pushNamed(context, '/jobs');
              })
            ).toList()
        ));
  }
}