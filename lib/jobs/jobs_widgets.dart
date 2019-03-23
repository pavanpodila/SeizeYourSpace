import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_job/core/app_page_view.dart';
import 'package:photo_job/jobs/jobs_store.dart';

class JobsPage extends StatelessWidget {
  final JobsStore store;

  final void Function(BuildContext context) onSelected;

  JobsPage({@required this.store, @required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return AppPageView(
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        onPageChanged: (index) => store.selectJobWithIndex(index),
        itemBuilder: (_, index) {
          return JobView(
            job: store.jobs[index],
            onSelected: () => onSelected(context),
          );
        },
        itemCount: store.jobs.length,
      ),
    );
  }
}

class JobView extends StatelessWidget {
  JobView({@required this.job, @required this.onSelected});

  final void Function() onSelected;

  final Job job;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(color: Colors.redAccent),
            child: Text(job.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(job.description, style: TextStyle(fontSize: 16)),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: CupertinoButton(
              onPressed: onSelected,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    CupertinoIcons.check_mark_circled_solid,
                    size: 30,
                  ),
                  Text(
                    'I want this!',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
