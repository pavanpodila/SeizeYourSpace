import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_job/applicant_details.dart';
import 'package:photo_job/core/app_page_view.dart';
import 'package:photo_job/core/circular_button.dart';
import 'package:photo_job/jobs/job_list.dart';
import 'package:provider/provider.dart';

class JobCategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final jobCategories = Provider.of<JobList>(context).jobCategories;
    final applicantDetails = Provider.of<ApplicantDetails>(context);

    final setJobCategory = Provider.of<JobList>(context).setJobCategory;

    return AppPageView(
        child: Column(
      children: <Widget>[
        Image.asset(
          'lib/assets/image1.png',
        ),
        Padding(padding: const EdgeInsets.symmetric(vertical: 50), child: null),
        Column(
          children: <Widget>[
            Text(
              "Select the category to apply",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )
          ],
        ),
        Padding(padding: const EdgeInsets.symmetric(vertical: 20), child: null),
        new Expanded(
            child: GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20.0),
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                crossAxisCount: 3,
                children: jobCategories
                    .map((jobCategory) => CircularButton(
                        textContent: '${jobCategory}',
                        onSelected: () {
                          setJobCategory(jobCategory);
                          applicantDetails.setJobCategory(jobCategory);
                          return Navigator.pushNamed(context, '/jobs');
                        }))
                    .toList())),
      ],
    ));
  }
}
