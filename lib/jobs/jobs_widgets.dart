import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_job/core/app_page_view.dart';
import 'package:photo_job/jobs/counter.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class JobsPage extends StatefulWidget {
  const JobsPage({Key key}) : super(key: key);

  @override
  _JobsPageState createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
//  final void Function(BuildContext context) onSelected;
  final _counter = Counter();

//  JobsPage({@required this.store, @required this.onSelected});
  @override
  Widget build(BuildContext context) {
    print(_counter.value);
    print(_counter.jobs);
    return AppPageView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Observer(builder: (_) {
            print(_counter.value);
            _counter.jobs.length != 0 ? print( _counter.jobs[0].title): print('no');
            return Text(
              '${_counter.value}',
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

//class JobView extends StatelessWidget {
//  JobView({@required this.job, this.jobs});
//
////  final void Function() onSelected;
//
//  final Job job;
//
//  final List<Job> jobs;
//
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      crossAxisAlignment: CrossAxisAlignment.stretch,
//      children: <Widget>[
//        Padding(
//          padding: const EdgeInsets.only(bottom: 16.0),
//          child: Container(
//            padding: EdgeInsets.symmetric(vertical: 16),
//            decoration: BoxDecoration(color: Colors.redAccent),
//            child: Text(job.title,
//                textAlign: TextAlign.center,
//                style: TextStyle(
//                    fontSize: 20,
//                    fontWeight: FontWeight.bold,
//                    color: Colors.white)),
//          ),
//        ),
//        Padding(
//          padding: const EdgeInsets.all(8.0),
//          child: Text(job.description, style: TextStyle(fontSize: 16)),
//        ),
//        Expanded(
//          child: Align(
//            alignment: Alignment.bottomCenter,
//            child: CupertinoButton(
////              onPressed: onSelected,
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: <Widget>[
//                  Icon(
//                    CupertinoIcons.check_mark_circled_solid,
//                    size: 30,
//                  ),
//                  Text(
//                    'I want this!',
//                    style: TextStyle(fontSize: 20),
//                  )
//                ],
//              ),
//            ),
//          ),
//        )
//      ],
//    );
//  }
//}
