import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_job/core/app_page_view.dart';
import 'package:photo_job/jobs/job_list.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:photo_job/jobs/job.dart';

class JobsPage extends StatefulWidget {
  const JobsPage({Key key}) : super(key: key);

  @override
  _JobsPageState createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
//  final void Function(BuildContext context) onSelected;
  final _counter = JobList();

//  JobsPage({@required this.store, @required this.onSelected});
  @override
  Widget build(BuildContext context) {
//    print(_counter.value);
    print(_counter.jobs.length);
    return AppPageView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Observer(builder: (_) {
//            print(_counter.value);
            _counter.jobs.length != 0 ? print( _counter.jobs[0].title): print('no');
            return Text(
              '${_counter.jobs.length}',
              style: const TextStyle(fontSize: 20),
            );
          }),
          FloatingActionButton(
            onPressed: _counter.increment,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
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
                const ListTile(
                  title: Text('JOB TITLE'),
                  subtitle: Text('Senior Associate'),
                ),
                Divider(
                  color: Colors.black26,
                ),
                const ListTile(
                  title: Text('JOB LOCATION'),
                  subtitle: Text('Bangalore'),
                ),
                Divider(
                  color: Colors.black26,
                ),
                const ListTile(
                  title: Text('Job Summary'),
                  subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
