import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:photo_job/job_store.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Photo Job',
      home: MyHomePage(title: 'A Photo Job'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _store = JobStore();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        resizeToAvoidBottomInset: true,
        navigationBar: CupertinoNavigationBar(
          middle: Text(widget.title),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Text('hello'),
              Expanded(
                child: Observer(
                    builder: (_) => _store.isCameraReady
                        ? AspectRatio(
                            aspectRatio: _store.controller.value.aspectRatio,
                            child: CameraPreview(_store.controller))
                        : Container()),
              ),
              CupertinoButton(
                child: Text('Flip'),
                onPressed: _store.flipCamera,
              )
            ],
          ),
        ));
  }
}
