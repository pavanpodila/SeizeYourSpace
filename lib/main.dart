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
      routes: {
        '/': (_) => HomePage(),
        '/photo': (_) => TakePhotoPage(),
        '/jobs': (_) => JobsPage()
      },
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
                  return Text(jobsStore.selectedJob.title);

                return Container();
              }),
            ),
            SizedBox(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  final job = jobsStore.jobs[index];

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
                          ], color: Colors.white),
                          child: Text(
                            job.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18),
                          )),
                    ),
                  );
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

class TakePhotoPage extends StatelessWidget {
  TakePhotoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
            child: Align(
      alignment: Alignment.center,
      child: Column(children: <Widget>[
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
