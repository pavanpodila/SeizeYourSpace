import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_job/core/app_page_view.dart';
import 'package:photo_job/core/circular_button.dart';
import 'package:provider/provider.dart';
import 'package:photo_job/jobs/job_list.dart';
import 'package:photo_job/applicant_details.dart';

class JobCategoryPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final jobCategories = Provider
        .of<JobList>(context)
        .jobCategories;
    final applicantDetails = Provider.of<ApplicantDetails>(context);

    final setJobCategory = Provider
        .of<JobList>(context).setJobCategory;

    return AppPageView(
        child: GridView.count(
            primary: true,
            padding: const EdgeInsets.all(20.0),
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            crossAxisCount: 3,
            children: jobCategories.map((jobCategory) =>
              CircularButton(textContent: '${jobCategory}', onSelected: () {
                setJobCategory(jobCategory);
                applicantDetails.jobCategory = jobCategory;
                return Navigator.pushNamed(context, '/jobs');
              })
            ).toList()
        ));
  }
}