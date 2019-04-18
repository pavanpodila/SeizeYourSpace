import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:photo_job/applicant_details.dart';
import 'package:photo_job/core/app_page_view.dart';
import 'package:photo_job/core/circular_button.dart';
import 'package:photo_job/core/theme.dart';
import 'package:photo_job/jobs/job.dart';
import 'package:photo_job/jobs/job_list.dart';
import 'package:provider/provider.dart';

class JobsPage extends StatelessWidget {
  JobsPage({this.onSelected});

  final void Function(BuildContext context) onSelected;

  @override
  Widget build(BuildContext context) {
    final jobStore = Provider.of<JobList>(context);
    final applicantDetails = Provider.of<ApplicantDetails>(context);

    return AppPageView(
        child: Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Image.asset(
              'lib/assets/banner.png',
            ),
            Positioned(
              right: 10,
              top: 10,
              child: CircularButton(
                text: jobStore.jobCategory,
                onPressed: null,
              ),
            )
          ],
        ),
        new Expanded(child: Observer(builder: (_) {
          return ListView.builder(
            itemBuilder: (_, index) {
              return JobView(
                job: jobStore.jobs[index],
                onSelected: (job) {
                  applicantDetails.setJobId(job.id);
                  jobStore.selectJob(job);
                  this.onSelected(context);
                },
              );
            },
            itemCount: jobStore.jobs.length,
          );
        }))
      ],
    ));
  }
}

class JobView extends StatelessWidget {
  JobView({@required this.job, @required this.onSelected});

  final void Function(Job job) onSelected;

  final Job job;

  @override
  Widget build(BuildContext context) {
    String responsibilities = '';

    this.job.responsibilities.forEach((entry) {
      responsibilities = responsibilities + entry + "\n\n";
    });
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 15.0, right: 15.0),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(
                'Title',
                style: theme.captionTextStyle,
              ),
              subtitle: Text(
                this.job.title,
                style: theme.headingTextStyle,
              ),
            ),
            ListTile(
              title: Text(
                'Location',
                style: theme.captionTextStyle,
              ),
              subtitle: Text(
                this.job.location,
                style: theme.bodyTextStyle,
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 15.0, left: 0, right: 0),
                child: ListTile(
                  title: Text(
                    'Summary',
                    style: theme.bodyTextStyle,
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(this.job.summary),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(bottom: 10.0, left: 0, right: 0),
                child: ListTile(
                  title: Text(
                    'Responsibilities',
                    style: theme.bodyTextStyle,
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(responsibilities),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(bottom: 10.0, left: 0, right: 0),
                child: CupertinoButton(
                  onPressed: () {
                    this.onSelected(this.job);
                  },
                  color: theme.blue,
                  child: Text(
                    'This is me!',
                    style: theme.bodyTextStyle,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
