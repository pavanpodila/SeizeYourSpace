import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:photo_job/camera_store.dart';
import 'package:photo_job/jobs_store.dart';

final cameraStore = CameraStore();
final jobsStore = JobsStore();
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Photo Job',
      routes: {'/': (_) => HomePage(), '/jobs': (_) => JobsPage()},
      initialRoute: '/',
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 28.0),
              child: Text('Publicis Sapient',
                  style: TextStyle(color: Colors.redAccent, fontSize: 30)),
            ),
            Text(
              'Would you like to see the opportunities we have?',
              textAlign: TextAlign.center,
            ),
            Container(
              height: 150,
            ),
            CupertinoButton(
              child: Text('Yes, why not!'),
              onPressed: () => Navigator.pushNamed(context, '/jobs'),
            )
          ],
        ),
      ),
    )));
  }
}

class JobsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Observer(builder: (_) {
                if (jobsStore.hasSelection)
                  return JobView(job: jobsStore.selectedJob);

                return Container();
              }),
            ),
            SizedBox(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return JobCard(store: jobsStore, index: index);
                },
                itemCount: jobsStore.jobs.length,
              ),
              height: 150,
            )
          ],
        ),
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final JobsStore store;
  final int index;

  JobCard({@required this.store, @required this.index});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final job = jobsStore.jobs[index];
        final isSelected = jobsStore.selectedJob == job;

        final cardColor = isSelected ? Colors.redAccent : Colors.white;
        final textColor = isSelected ? Colors.white : Colors.black;
        final textWeight = isSelected ? FontWeight.bold : FontWeight.normal;

        return GestureDetector(
          onTap: () => jobsStore.selectJob(job),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.center,
                width: 150,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      offset: Offset(1, 1),
                      blurRadius: 5,
                      color: Color.fromARGB(32, 0, 0, 0))
                ], color: cardColor),
                child: Text(
                  job.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18, color: textColor, fontWeight: textWeight),
                )),
          ),
        );
      },
    );
  }
}

class JobView extends StatelessWidget {
  JobView({@required this.job});

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
          child: CupertinoButton(
            onPressed: () {
              Navigator.of(context).push(CupertinoPageRoute(
                  builder: (_) => TakePhotoPage(), fullscreenDialog: true));
            },
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
        )
      ],
    );
  }
}

class TakePhotoPage extends StatelessWidget {
  TakePhotoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
            child: Align(
      alignment: Alignment.center,
      child: Column(children: <Widget>[
        CupertinoButton(
          onPressed: () =>
              Navigator.popUntil(context, ModalRoute.withName('/')),
          child: Text('Escape'),
        ),
        Observer(
            builder: (_) => cameraStore.isCameraReady
                ? Expanded(
                    child: CircleAvatar(
                        child: AspectRatio(
                            aspectRatio:
                                cameraStore.controller.value.aspectRatio,
                            child: CameraPreview(cameraStore.controller))))
                : Expanded(
                    child: CircleAvatar(
                        color: Colors.grey,
                        child: Text(
                          'No Camera',
                          style: TextStyle(color: Colors.grey),
                        )))),
        Observer(
          builder: (_) => cameraStore.isCameraReady
              ? CupertinoButton(
                  onPressed: cameraStore.takePicture,
                  child: Text('Take Picture'),
                )
              : Container(),
        ),
        Observer(
          builder: (_) => SizedBox(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cameraStore.images.length,
                  itemBuilder: (_, index) => Image.file(
                        File(cameraStore.images[index]),
                        key: Key(cameraStore.images[index]),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ))),
        ),
      ]),
    )));
  }

  Widget getIcon(CameraLensDirection direction) {
    switch (direction) {
      case CameraLensDirection.front:
        return Text('Front');
      case CameraLensDirection.back:
        return Text('Back');
      default:
        return Text('External');
    }
  }
}

class CircleAvatar extends StatelessWidget {
  CircleAvatar(
      {@required this.child, this.color = Colors.redAccent, this.width = 10});

  final double width;

  final Color color;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipPath(
        clipper: ShapeBorderClipper(shape: CircleBorder()),
        child: Align(
          child: child,
          alignment: Alignment.center,
        ),
      ),
      decoration: BoxDecoration(
          border: Border.all(width: width, color: color),
          shape: BoxShape.circle),
    );
  }
}
