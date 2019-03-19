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
            child: Column(children: <Widget>[
          Observer(
              builder: (_) => _store.isCameraReady
                  ? Expanded(
                      child:
                          CircleAvatar(child: CameraPreview(_store.controller)))
                  : Container()),
          Observer(
              builder: (_) => _store.isCameraReady
                  ? CupertinoSegmentedControl(
                      onValueChanged: (camera) {
                        _store.selectCamera(camera);
                      },
                      groupValue: _store.selectedCamera,
                      children: Map.fromIterables(
                          _store.cameras,
                          _store.cameras.map((x) => Padding(
                              padding: EdgeInsets.all(16),
                              child: getIcon(x.lensDirection)))),
                    )
                  : Container()),
          CupertinoButton(
            onPressed: _store.takePicture,
            child: Text('Take Picture'),
          )
        ])));
  }

  Widget getIcon(CameraLensDirection direction) {
    if (direction == CameraLensDirection.front) return Text('Front');
    if (direction == CameraLensDirection.back) return Text('Back');
    if (direction == CameraLensDirection.external) return Text('External');
  }
}

class CircleAvatar extends StatelessWidget {
  CircleAvatar({@required this.child});

  Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipPath(
        clipper: ShapeBorderClipper(shape: CircleBorder()),
        child: child,
      ),
      decoration: BoxDecoration(
          border: Border.all(width: 10, color: Color.fromARGB(255, 255, 0, 0)),
          shape: BoxShape.circle),
    );
  }
}
