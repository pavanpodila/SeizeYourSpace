import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_job/core/app_page_view.dart';
import 'package:photo_job/jobs/job_list.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:photo_job/jobs/job.dart';
import 'package:provider/provider.dart';

class JobsPage extends StatelessWidget {

//  JobsPage({@required this.store, @required this.onSelected});
  @override
  Widget build(BuildContext context) {
    print('see here');
    final jobStore = Provider.of<JobList>(context);
//    print(_counter.value);
    return AppPageView(
      child: Observer(builder: (_) {
        print(jobStore.jobs.length);
        return PageView.builder(
        scrollDirection: Axis.horizontal,
        onPageChanged: (index) => jobStore.selectJobWithIndex(index),
        itemBuilder: (_, index) {
          return JobView(
            job: jobStore.jobs[index],
//            onSelected: () => onSelected(context),
          );
        },
        itemCount: jobStore.jobs.length,
      );})
    );
  }
}

class JobView extends StatelessWidget {
  JobView({@required this.job});

//  final void Function() onSelected;

  final Job job;

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 15.0, right: 15.0),
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
                    padding: const EdgeInsets.only(bottom: 15.0, left: 0, right: 0),
                    child: ListTile(
                  title: Text('Job Summary'),
                  subtitle: Text('${this.job.summary}'),
                ))
              ],
            ),
          ),
        )
      ],
    );
  }
}
