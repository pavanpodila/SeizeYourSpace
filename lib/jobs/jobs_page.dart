import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:photo_job/core/app_page_view.dart';
import 'package:photo_job/core/circular_button.dart';
import 'package:photo_job/core/theme.dart';
import 'package:photo_job/home/main_store.dart';
import 'package:photo_job/sdk/domain/job_profile.dart';
import 'package:provider/provider.dart';

class JobsPage extends StatelessWidget {
  JobsPage({this.onSelected});

  final void Function(BuildContext context) onSelected;

  @override
  Widget build(BuildContext context) {
    final mainStore = Provider.of<MainStore>(context);
    final jobStore = mainStore.jobStore;
    final applicant = mainStore.applicant;

    return AppPageView(
        child: Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            PSBanner(),
            Positioned(
              bottom: -20,
              right: 10,
              child: Hero(
                tag: jobStore.selectedCategory,
                transitionOnUserGestures: true,
                child: CircularButton(
                  text: jobStore.selectedCategory,
                  onPressed: null,
                ),
              ),
            )
          ],
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 8, bottom: 8),
            child: Text(
              '${jobStore.jobs.length} Position${jobStore.jobs.length != 1 ? 's' : ''}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: theme.radiantRed,
                  fontSize: 14),
            ),
          ),
        ),
        new Expanded(child: Observer(builder: (_) {
          return ListView.builder(
            itemBuilder: (_, index) {
              final job = jobStore.jobs[index];

              return JobView(
                job: job,
                onSelected: (job) {
                  applicant.jobId = job.id;
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

  final void Function(JobProfile job) onSelected;

  final JobProfile job;

  @override
  Widget build(BuildContext context) {
    String responsibilities = '';

    this.job.responsibilities.forEach((entry) {
      responsibilities = responsibilities + entry + "\n\n";
    });

    return Container(
      padding:
          const EdgeInsets.only(top: 30.0, bottom: 30, left: 15.0, right: 15.0),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: theme.radiantRed))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              this.job.title,
              style: theme.headingTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Location',
              style: theme.captionTextStyle,
            ),
          ),
          Text(
            this.job.location,
            style: theme.bodyTextStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 8),
            child: Text(
              'Summary',
              style: theme.captionTextStyle,
            ),
          ),
          Text(this.job.summary),
          Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 8),
              child: Text(
                'Responsibilities',
                style: theme.captionTextStyle,
              )),
          Text(responsibilities),
          Center(
            child: CupertinoButton(
              onPressed: () {
                this.onSelected(this.job);
              },
              color: theme.blue,
              child: Text(
                'This is me!',
                style: theme.bodyTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
