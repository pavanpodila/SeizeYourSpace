import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_job/core/app_page_view.dart';
import 'package:photo_job/jobs/job_list.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:photo_job/jobs/job.dart';
import 'package:provider/provider.dart';
import 'package:photo_job/applicant_details.dart';

class JobsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final jobStore = Provider.of<JobList>(context);
    final applicantDetails = Provider.of<ApplicantDetails>(context);

    return AppPageView(child: Observer(builder: (_) {
      return ListView.builder(
        itemBuilder: (_, index) {
          return JobView(
            job: jobStore.jobs[index],
            onSelected: (job) {
              applicantDetails.jobId = job.id;
              jobStore.selectJob(job);
              print('here');
              print(applicantDetails.jobId);
              return Navigator.pushNamed(context, '/details');
            },
          );
        },
        itemCount: jobStore.jobs.length,
      );
    }));
  }
}

class JobView extends StatelessWidget {
  JobView({@required this.job, @required this.onSelected});

  final void Function(Job job) onSelected;

  final Job job;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 15.0, right: 15.0),
          child: Container(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text('JOB TITLE'),
                    subtitle: Text('${this.job.title}'),
                  ),
                  Divider(
                    color: Colors.black26,
                  ),
                  ListTile(
                    title: Text('JOB LOCATION'),
                    subtitle: Text('${this.job.location}'),
                  ),
                  Divider(
                    color: Colors.black26,
                  ),
                  Padding(
                      padding:
                      const EdgeInsets.only(bottom: 15.0, left: 0, right: 0),
                      child: ListTile(
                        title: Text('Job Summary'),
                        subtitle: Text('${this.job.summary}'),
                      )),
                  RaisedButton(
                    onPressed: () {
                      this.onSelected(this.job);
                    },
                    color: Colors.blueAccent,
                    child: Text(
                      'I am here!',
                      style: TextStyle(fontSize: 16.9),
                    ),
                    textColor: Colors.white70,
                  )
                ],
              ),
            ),
            decoration: new BoxDecoration(boxShadow: [
              new BoxShadow(
                color: Colors.black12,
                blurRadius: 1.0,
              ),
            ]),
          ),
        )
      ],
    );
  }
}
